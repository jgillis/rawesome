import casadi as C

import phase1
import qpoases
from ocprt import OcpRT
import ocg_interface
from ..rtIntegrator import rtModelExport
from ..utils import codegen

def validateOptions(defaultOpts, userOpts, optName):
    '''
    Fill in any missing options which have defaults.
    Throw an error if any given option is unrecognized (has no default).
    '''
    assert isinstance(userOpts,dict), optName+" options must be a dictionary"
    # fill in missing default options
    for name in defaultOpts:
        if name not in userOpts:
            userOpts[name] = defaultOpts[name]

    # throw error on extra, unrecognized options
    for name in userOpts:
        if name not in defaultOpts:
            raise Exception(optName+' option "'+name+'" unrecognized, valid options: '+\
                                str(defaultOpts.keys()))

# make sure each element in the output is only a function of x or u, not both
def testSeparation(dae,out):
    badOnes = {}
    msgs = []
    for k in range(out.size()):
        fx = C.SXFunction([out[k]],[dae.xVec(),dae.pVec()])
        fu = C.SXFunction([out[k]],[dae.uVec(),dae.pVec()])
        fx.init()
        fu.init()
        us = fx.getFree()
        xs = fu.getFree()
        if len(us) > 0 and len(xs) > 0:
            msgs.append('output '+str(k)+' has xs: '+str(xs)+', us: '+str(us))
    if len(msgs) > 0:
        msg = str(len(msgs))+ ' compenents of the objective are a function '+\
              'of both x and u:\n'+'\n'.join(msgs)
        raise Exception(msg)

def writeObjective(ocp, out0, exportName):
    dae = ocp._dae

    # first make out not a function of xDot or z
    inputs0 = [dae.xDotVec(), dae.xVec(), dae.zVec(), dae.uVec(), dae.pVec()]
    outputFun0 = C.SXFunction(inputs0, [out0])

    (xDotDict, zDict) = dae.solveForXDotAndZ()
    xDot = C.veccat([xDotDict[name] for name in dae.xNames()])
    z    = C.veccat([zDict[name] for name in dae.zNames()])

    # plug in xdot, z solution to outputs fun
    outputFun0.init()
    [out] = outputFun0.eval([xDot, dae.xVec(), z, dae.uVec(), dae.pVec()])

    assert len(dae.pNames()) == 0, "parameters not supported right now in ocp export, sorry"

    # make sure each element in the output is only a function of x or u, not both
    testSeparation(dae,out)

    # make new SXFunction that is only fcn of [x, u, p]
    if exportName == 'lsqExtern':
        inputs = C.veccat([dae.xVec(), dae.uVec(), dae.pVec()])
        outs = C.veccat( [ out, C.jacobian(out,dae.xVec()).T, C.jacobian(out,dae.uVec()).T ] )
        outputFun = C.SXFunction([inputs], [C.densify(outs)])
        outputFun.init()
        assert len(outputFun.getFree()) == 0, 'the "impossible" happened >_<'
    elif exportName == 'lsqEndTermExtern':
        inputs = dae.xVec()
        outs = C.veccat( [ out, C.jacobian(out,dae.xVec()).T ] )
        outputFun = C.SXFunction([inputs], [C.densify(outs)])
        outputFun.init()
        assert len(outputFun.getFree()) == 0, 'lsqEndTermExtern cannot be a function of controls u, saw: '+str(outputFun.getFree())
    else:
        raise Exception('unrecognized name "'+exportName+'"')

    return codegen.writeCCode(outputFun,exportName)


def exportOcp(ocp, cgOptions, integratorOptions, ocpOptions, phase1Options):
    defaultCgOptions = {'CXX':'g++', 'CC':'gcc'}
    defaultPhase1Options = {'CXX':'g++'}
    validateOptions(defaultCgOptions, cgOptions, "codegen")
    validateOptions(defaultPhase1Options, phase1Options, "phase 1")

    # write the OCP exporter and run it, returning an exported OCP
    files = phase1.runPhase1(ocp, phase1Options, integratorOptions, ocpOptions)

    # add model for rt integrator
    files['model.c'] = '''\
#include "qpoases/solver.hpp"
#include "rhs.h"
#include "rhsJacob.h"
'''
    rtModelGen = rtModelExport.generateCModel(ocp._dae, ocp._ts, None)
    files['rhs.cpp'] = '#include "rhs.h"\n'+rtModelGen['rhsFile'][0]
    files['rhsJacob.cpp'] = '#include "rhsJacob.h"\n'+rtModelGen['rhsJacobFile'][0]
    files['rhs.h'] = rtModelGen['rhsFile'][1]
    files['rhsJacob.h'] = rtModelGen['rhsJacobFile'][1]

    # add objective and jacobian
    externObj    = writeObjective(ocp, ocp._minLsq, 'lsqExtern')
    externObjEnd = writeObjective(ocp, ocp._minLsqEndTerm, 'lsqEndTermExtern')
    externFile  = '''\
#include "acado_external_functions.h"
#include <math.h>
#include <stdio.h>
'''
    externFile += externObj[0] + '\n'
    externFile += externObjEnd[0]
    files['acado_external_functions.cpp'] = externFile
    externHeader  = externObj[1] + '\n'
    externHeader += externObjEnd[1]
    files['acado_external_functions.h'] = externHeader

    # #include objective/jacobian in acado_solver.c
    files['acado_solver.c'] = '#include "acado_external_functions.h"\n'+\
                              files['acado_solver.c']

    # add python_interface.c
    files['python_interface.c'] = ocg_interface.ocg_interface

    if ocpOptions['QP_SOLVER'] == 'QP_QPOASES':
        ocpSoPath = qpoases.exportPhase2(cgOptions, files)
    else:
        raise Exception('the impossible happened, unsupported qp solver: "'+str(ocpOptions['QP_SOLVER'])+'"')

    return (ocpSoPath, ocp._ts, ocp._dae)
