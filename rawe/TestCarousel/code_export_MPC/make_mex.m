%%
%%    This file was auto-generated by ACADO Toolkit.
%%
%%    ACADO Toolkit -- A Toolkit for Automatic Control and Dynamic Optimization.
%%    Copyright (C) 2008-2011 by Boris Houska, Hans Joachim Ferreau et al., K.U.Leuven.
%%    Developed within the Optimization in Engineering Center (OPTEC) under
%%    supervision of Moritz Diehl. All rights reserved.
%%


IFLAGS  = [ '-I. -I./qpoases/INCLUDE  -I./qpoases/SRC ' ];

if ( ispc == 0 )
%    CPPFLAGS  = [ IFLAGS, '-D__cpluplus -O -DLINUX ' ];
     CPPFLAGS  = [ IFLAGS, '-D__cpluplus -DLINUX ' ];
else
%     CPPFLAGS  = [ IFLAGS, '-D__cpluplus -DWIN32 ' ];
    CPPFLAGS  = [ IFLAGS, '-D__cpluplus -O -DWIN32 ' ];
end

OBJECTS = [ './qpoases/SRC/QProblem.cpp ',...
            './qpoases/SRC/QProblemB.cpp ',...
            './qpoases/SRC/Bounds.cpp ',...
            './qpoases/SRC/Constraints.cpp ',...
            './qpoases/SRC/SubjectTo.cpp ',...
            './qpoases/SRC/Indexlist.cpp ',...
            './qpoases/SRC/CyclingManager.cpp ',...
            './qpoases/SRC/Utils.cpp ',...
            './qpoases/SRC/MessageHandling.cpp ',...
            './qpoases/solver.cpp ',...
            'integrator.c ',...
            'condensing.c ',...
            'gauss_newton_method.c ' ];


eval( [ 'mex -output MPCstep CFLAGS="\$CFLAGS -std=c99" ', CPPFLAGS, 'MPCmex.c ', OBJECTS] );
disp( [ 'MPCstep.', eval('mexext'), ' successfully created!'] );

clear IFLAGS CPPFLAGS OBJECTS

