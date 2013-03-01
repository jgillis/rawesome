/*
 *    This file is part of ACADO Toolkit.
 *
 *    ACADO Toolkit -- A Toolkit for Automatic Control and Dynamic Optimization.
 *    Copyright (C) 2008-2009 by Boris Houska and Hans Joachim Ferreau, K.U.Leuven.
 *    Developed within the Optimization in Engineering Center (OPTEC) under
 *    supervision of Moritz Diehl. All rights reserved.
 *
 *    ACADO Toolkit is free software; you can redistribute it and/or
 *    modify it under the terms of the GNU Lesser General Public
 *    License as published by the Free Software Foundation; either
 *    version 3 of the License, or (at your option) any later version.
 *
 *    ACADO Toolkit is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *    Lesser General Public License for more details.
 *
 *    You should have received a copy of the GNU Lesser General Public
 *    License along with ACADO Toolkit; if not, write to the Free Software
 *    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */


 /**
 *    SINGLE POWER KITE START-UP WITH PROPELLER
 *    CARTESIAN COORDINATES (ODE FORMULATION)
 *    MARCH 2013 SEBASTIEN GROS & MARIO ZANON & GREG HORN, HIGHWIND, OPTEC
 *    SEBASTIEN GROS & MARIO ZANON & GREG HORN
 */


#include <acado_optimal_control.hpp>
#include <include/acado_gnuplot/gnuplot_window.hpp>



int main( int argc, char * const argv[] ){


	//======================================================================
	// PARSE THE INPUT ARGUMENTS:
	// ----------------------------------
	double IC[4];
	
	/* arguments are passed to the main function by string
	 *  there are 'int argc' arguments
	 *		the first one is the name of the program
	 *		the next ones are arguments passed in the call like
	 *			program number1 number2
	 *  in this stupid simple parser, we directly read doubles from the arguments
	 */
	 
	int i=1;
	while (i < argc) {
		// load the i-th string argument passed to the main function
		char* input = argv[i];
		// parse the string to a double value
		IC[i-1] = atof(input);
		i++;
	}
	
	cout << "Initial Conditions" << endl;
	cout << "------------" << endl;
	for (i = 0; i < argc-1; ++i) {
		cout << i+1 << ":\t" << IC[i] << endl;
	}
	//======================================================================	
	
	
	double Ncvp  = IC[1];
	double Tc    = IC[2];
	int MaxSteps = IC[3];
// 	double r = IC[4];
	 
	 
	USING_NAMESPACE_ACADO
	
	
	#include "model.cpp"
	
	
	// ===============================================================
	//                        END OF MODEL EQUATIONS
	// ===============================================================
	
	const double PI = M_PI;
	const int n_XD = 25;
	const int n_U = 4;
	
	// DEFINE AN OPTIMAL CONTROL PROBLEM:
	// ----------------------------------
	OCP ocp( 0.0, Tc, Ncvp );


	ExportVariable QQ( "QQ",n_XD ,n_XD );
	ExportVariable RR( "RR",n_U ,n_U ); 
	ExportVariable QT( "QT",n_XD ,n_XD );
	
	
	ocp.minimizeLSQ( QQ, RR );
	ocp.minimizeLSQEndTerm( QT );
	
	
	ocp.subjectTo( _f );
	
	// BOUNDS:
	// ---------------------------------
	
	// CONTROL
	double AccRate = 30*PI/180;
	ocp.subjectTo( -600 <= motor_torque <= 600 );
	ocp.subjectTo( -0.5 <= ddr <= 0.5 );
    
//     ocp.subjectTo( dddelta == 0 );
// 	ocp.subjectTo( ddr == 0 );
    
	ocp.subjectTo(  -1 <= delevator  <= 1 );
	ocp.subjectTo(  -3.2767 <= daileron  <= 3.2767 );
	
	// STATE
	ocp.subjectTo( -1 <= z );

	
	// PATH CONSTRAINTS
	// ---------------------------------
// 	ocp.subjectTo( -0.1 <= CL + SlackCLmax );
// 	ocp.subjectTo(        CL - SlackCLmax <= 1.1 );	
// 	ocp.subjectTo( 0 <= SlackCLmax <= 0.4 );
// 	ocp.subjectTo( -0.1 <= CL  <= 1.1  );

	
	// lambda > 10
// 	ocp.subjectTo( 1 <= lambda/10 + SlackLambda );
// 	ocp.subjectTo( 0 <= SlackLambda <= 1 );
// 	ocp.subjectTo( 1 <= lambda/10 );
	
	
// 	ocp.subjectTo( -10*PI/180 <= beta <= 10*PI/180 );
// 	ocp.subjectTo( -10*PI/180 <= alpha <= 10*PI/180 );
// 	ocp.subjectTo( -15*PI/180 <= alphaTail <= 15*PI/180 );

	
	printf("EXPORTING LINUX/QPOASES CODE\n");
	MPCexport mpc( ocp );

	mpc.set( HESSIAN_APPROXIMATION,       GAUSS_NEWTON    );
	mpc.set( DISCRETIZATION_TYPE,   MULTIPLE_SHOOTING );
	mpc.set( QP_SOLVER,             QP_QPOASES      );
	mpc.set( HOTSTART_QP,           YES              );
    
    
// 	mpc.set( INTEGRATOR_TYPE,             INT_RK4         );
// 	mpc.set( NUM_INTEGRATOR_STEPS,        200            );
    
	mpc.set( INTEGRATOR_TYPE,             INT_IRK_GL2    );
	mpc.set( NUM_INTEGRATOR_STEPS,        30            );
	
	mpc.set( IMPLICIT_INTEGRATOR_NUM_ITS, 3				);
	mpc.set( IMPLICIT_INTEGRATOR_NUM_ITS_INIT, 0		);
	mpc.set( LINEAR_ALGEBRA_SOLVER,		  HOUSEHOLDER_QR );
	mpc.set( UNROLL_LINEAR_SOLVER,        NO	      );
	mpc.set( IMPLICIT_INTEGRATOR_MODE, IFTR );
	
	mpc.set(SPARSE_QP_SOLUTION, CONDENSING);
    
	mpc.set( CG_USE_C99,    YES              );  
    
// 	  mpc_qpOASES.set( QP_SOLVER,                   QP_QPOASES3 );    /* PLAIN C VERSION OF QP OASES FOR dSPACE */
	//    mpc_qpOASES.set( MAX_NUM_QP_ITERATIONS,       20              );
	//    mpc_qpOASES.set( HOTSTART_QP,                 YES             );
	//    mpc_qpOASES.set( LEVENBERG_MARQUARDT,         1.0e-4          );
// 	mpc.set( GENERATE_TEST_FILE,          YES            );
// 	mpc.set( GENERATE_SIMULINK_INTERFACE, YES );
// 	mpc.set( GENERATE_MAKE_FILE,          NO            );

	mpc.exportCode( "code_export_MPC" );
	mpc.printDimensionsQP();


    return 0;
}



