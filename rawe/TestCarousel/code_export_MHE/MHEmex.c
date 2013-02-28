#include "mex.h"

#include "acado.h"


/* SOME CONVENIENT DEFINTIONS: */
/* --------------------------------------------------------------- */
   #define NUM_STEPS   1      /* number of real time iterations */
   #define VERBOSE     1      /* show iterations: 1, silent: 0  */
/* --------------------------------------------------------------- */


/* GLOBAL VARIABLES FOR THE ACADO REAL-TIME ALGORITHM: */
/* --------------------------------------------------- */
   ACADOvariables acadoVariables;
   ACADOworkspace acadoWorkspace;

/* GLOBAL VARIABLES FOR THE QP SOLVER: */
/* ----------------------------------- */
   Vars         vars;
   Params       params;


real_t getTime(  ){
real_t current_time = 0.000000e+00;
struct timeval theclock;
gettimeofday( &theclock,0 );
current_time = 1.0*theclock.tv_sec + 1.0e-6*theclock.tv_usec;
return current_time;
}

/* A TEMPLATE FOR TESTING THE REAL-TIME IMPLEMENTATION: */
/* ---------------------------------------------------- */
void mexFunction( int            nlhs, 
                  mxArray        *plhs[], 
                  int            nrhs, 
                  const mxArray  *prhs[]){

    
    /* Input */
    int nRxInit, nCxInit; 
    double *dPxInit; 
    int nRuInit, nCuInit; 
    double *dPuInit; 
    int nRin_Y, nCin_Y; 
    double *dPin_Y; 
    int nRin_YN, nCin_YN; 
    double *dPin_YN; 
    int nR_S, nC_S; 
    double *dP_S; 
    int nR_SN, nC_SN; 
    double *dP_SN;	
    /* Output */
    double *dPoutU; /*data pointer for the output argument*/
    double *dPoutX; 
    
    /* Initial guess */
    nRxInit    = mxGetM(prhs[0]);
    nCxInit    = mxGetN(prhs[0]);
    dPxInit    = mxGetPr(prhs[0]);
    nRuInit    = mxGetM(prhs[1]);
    nCuInit    = mxGetN(prhs[1]);
    dPuInit    = mxGetPr(prhs[1]);
    /* Measurements */
    nRin_Y  = mxGetM(prhs[2]);
    nCin_Y  = mxGetN(prhs[2]);
    dPin_Y  = mxGetPr(prhs[2]);
    nRin_YN = mxGetM(prhs[3]);
    nCin_YN = mxGetN(prhs[3]);
    dPin_YN = mxGetPr(prhs[3]);
    /* Weighting matrices */
    nR_S       = mxGetM(prhs[4]);
    nC_S       = mxGetN(prhs[4]);
    dP_S       = mxGetPr(prhs[4]);
    nR_SN      = mxGetM(prhs[5]);
    nC_SN      = mxGetN(prhs[5]);
    dP_SN      = mxGetPr(prhs[5]);
    
    
    /*checking input dimensions*/
    if ( ( nRxInit != ACADO_N+1 ) || ( nCxInit != ACADO_NX ) ){
        mexPrintf( "First argument must be a vector of size: %d by %d \n", ACADO_N+1, ACADO_NX );
        mexErrMsgTxt( "Check the dimensions of the first input array (initial guess for the states)" );
    }
    if ( ( nRuInit != ACADO_N ) || ( nCuInit != ACADO_NU ) ){
        mexPrintf( "Second argument must be a vector of size: %d by %d \n", ACADO_N, ACADO_NU );
        mexErrMsgTxt( "Check the dimensions of the second input array (initial guess for the controls)" );
    }
    if ( ( nRin_Y != ACADO_N ) || ( nCin_Y != ACADO_NY ) ){
        mexPrintf( "Third argument must be a vector of size: %d by %d \n", ACADO_N, ACADO_NY );
        mexErrMsgTxt( "Check the dimensions of the third input array (reference for the states)" );
    }
    if ( ( nRin_YN != 1 ) || ( nCin_YN != ACADO_NYN ) ){
        mexPrintf( "Fourth argument must be a vector of size: %d by %d \n", 1, ACADO_NYN );
        mexErrMsgTxt( "Check the dimensions of the fourth input array (reference for the controls)" );
    }
    if ( ( nR_S != ACADO_NY ) || ( nC_S != ACADO_NY ) ){
        mexPrintf( "Fifth argument must be a vector of size: %d by %d \n", ACADO_NY, ACADO_NY );
        mexErrMsgTxt( "Check the dimensions of the fifth input array (weighting matrix)" );
    }
    if ( ( nR_SN != ACADO_NYN ) || ( nC_SN != ACADO_NYN ) ){
        mexPrintf( "Sixth argument must be a vector of size: %d by %d \n", ACADO_NYN, ACADO_NYN );
        mexErrMsgTxt( "Check the dimensions of the sixth input array (end weighting matrix)" );
    }
    
    
    
    
   /* INTRODUCE AUXILIARY VAIRABLES: */
   /* ------------------------------ */
      int    i, j, iter        ;
      real_t lastMeasurement[ACADO_NYN];

   /* INITIALIZE THE STATES AND CONTROLS: */
   /* ---------------------------------------- */
    for( j = 0; j < ACADO_N+1; ++j ) {
        for( i = 0; i < ACADO_NX  ; ++i ) {
            acadoVariables.x[j*ACADO_NX + i] = dPxInit[j + i*(ACADO_N+1)];
        }
    }
    for( j = 0; j < ACADO_N; ++j ) {
        for( i = 0; i < ACADO_NU; ++i ) {
            acadoVariables.u[j*ACADO_NU + i] = dPuInit[j + i*ACADO_N];
        }
    }

   /* INITIALIZE THE MEASUREMENTS: */
   /* -------------------------------------------- */
    for( j = 0; j < ACADO_N; ++j ) {
        for( i = 0; i < ACADO_NY  ; ++i ) {
            acadoVariables.yMeas[j*ACADO_NY + i] = dPin_Y[j + i*ACADO_N];
        }
    }
	for( i = 0; i < ACADO_NYN; ++i ) {
		lastMeasurement[i] = dPin_YN[i];
	}
    

   /* SETUP THE WEIGHTING MATRICES: */
   /* ------------------------------------------------ */
    for( j = 0; j < ACADO_NY; ++j ) {
        for( i = 0; i < ACADO_NY; ++i ) {
            acadoVariables.S[j*ACADO_NY + i] = dP_S[j + i*ACADO_NY];
        }
    }
    for( j = 0; j < ACADO_NYN; ++j ) {
        for( i = 0; i < ACADO_NYN; ++i ) {
            acadoVariables.SN[j*ACADO_NYN + i] = dP_SN[j + i*ACADO_NYN];
        }
    }
      
     
	int status;


      real_t t0;


   /* GET THE TIME BEFORE START THE LOOP: */
   /* ---------------------------------------------- */
      real_t t1;
      real_t t2;


   /* THE REAL-TIME ITERATION LOOP: */
   /* ---------------------------------------------- */
      for( iter = 0; iter < NUM_STEPS; ++iter ){
        
          t0 = getTime();
       /* PREPARE FIRST STEP: */
       /* ------------------- */
          preparationStep();
          t1 = getTime();
          
        /* TAKE A MEASUREMENT: */
        /* ----------------------------- */
           /* meausrement = ... */

        /* PERFORM THE FEEDBACK STEP: */
        /* ----------------------------- */
           status = feedbackStep( lastMeasurement );
           
		if (  status )
			mexPrintf("WARNING: QP solver returned the error code: %d \n", status);
           
           t2 = getTime();

        /* APPLY THE NEW CONTROL IMMEDIATELY TO THE PROCESS: */
        /* ------------------------------------------------- */
           /* send first piece of acadoVariables.u to process;*/
           if( VERBOSE ) mexPrintf("=================================================================\n\n" );
           if( VERBOSE ) mexPrintf("   MHE:  Real-Time Iteration %d:  KKT Tolerance = %.3e\n", iter, getKKT() );
           /*if( VERBOSE ) mexPrintf("\n=================================================================\n" );*/

        /* OPTIONAL: SHIFT THE INITIALIZATION: */
        /* ----------------------------------- */
           /* shiftControls( acadoVariables.uRef );*/
           /* shiftStates  ( acadoVariables.xRef );*/

        /* PREPARE NEXT STEP: */
        /* ------------------ */
//            preparationStep();
      }
      /*if( VERBOSE ) mexPrintf("\n\n              END OF THE REAL-TIME LOOP. \n\n\n");*/


   /* GET THE TIME AT THE END OF THE LOOP: */
   /* ---------------------------------------------- */
      real_t t3 = getTime();

    /* if( VERBOSE ) mexPrintf("=================================================================\n\n" ); */
    if( VERBOSE ) mexPrintf("      Preparation step: %.3e s\n", t1-t0 );
    if( VERBOSE ) mexPrintf("      Feedback step:    %.3e s\n", t2-t1 );
    if( VERBOSE ) mexPrintf("\n=================================================================\n" );

   /* PRINT DURATION AND RESULTS: */
   /* -------------------------------------------------------------------------------------------------- */
      if( !VERBOSE )
      mexPrintf("\n\n AVERAGE DURATION OF ONE REAL-TIME ITERATION:   %.3g μs\n\n", 1e6*(t2-t1)/NUM_STEPS );

   /* ASSIGN THE STATES AND CONTROLS TO THE OUTPUTS: */
   /* ---------------------------------------- */
    plhs[0] = mxCreateDoubleMatrix(ACADO_N, ACADO_NU, mxREAL);
    dPoutU = mxGetPr(plhs[0]);
    plhs[1] = mxCreateDoubleMatrix(ACADO_N+1, ACADO_NX, mxREAL);
    dPoutX = mxGetPr(plhs[1]);
    plhs[2] = mxCreateDoubleScalar( getKKT() );

    for( j = 0; j < ACADO_N+1; ++j ) {
        for( i = 0; i < ACADO_NX; ++i ) {
//             dPoutX[j + i*(ACADO_N+1)] = acadoVariables.x[j + i*(ACADO_N+1)];
            dPoutX[j + i*(ACADO_N+1)] = acadoVariables.x[j*ACADO_NX + i];
        }
    }
//             acadoVariables.x[j*ACADO_NX + i] = dPxInit[j + i*(ACADO_N+1)];
            
    for( j = 0; j < ACADO_N; ++j ) {
        for( i = 0; i < ACADO_NU; ++i ) {
//             dPoutU[j + i*ACADO_N] = acadoVariables.u[j + i*ACADO_N];
            dPoutU[j + i*ACADO_N] = acadoVariables.u[j*ACADO_NU + i];
        }
    }
}
