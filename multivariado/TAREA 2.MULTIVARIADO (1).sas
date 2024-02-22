/*EJERCICIO 5.30*/
OPTIONS PS=500 NODATE NONUMBER;
PROC IML;
sigma = {3 0 2 2, 0 1 1 0, 2 1 9 -2, 2 0 -2 4};
A = {1 2};
B = {1 -2, 2 -1};
PRINT A; PRINT B;
PRINT 'INCISO D';
sigma11 = sigma[1:2, 1:2];
covaS = A*sigma11*t(A);
PRINT sigma11; PRINT covaS;
PRINT 'INCISO J';
sigma_12 = sigma[1:2, 3:4];
cov_ax1bx2 = A*sigma_12*t(B);
PRINT sigma_12; PRINT cov_ax1bx2;
RUN;
QUIT;
/*EJERCICIO 2.41*/
PROC IML;
tres = J(1, 4, 3);
SIGMA_X = DIAG(tres);
A = {1 -1 0 0, 1 1 -2 0, 1 1 1 -3};
mu_X = {3, 2, -2, 0};
PRINT SIGMA_X; PRINT A; PRINT mu_X;
PRINT 'INCISO A';
E_AX = A*mu_X;
PRINT 'E(AX) = ' E_AX;
PRINT 'INCISO B';
COV_AX = A*SIGMA_X*T(A);
PRINT 'cov(AX) = 'COV_AX;
RUN;
QUIT;


/*EJERCICIO 4.1*/
PROC IML;
*sigma12 = -0.8*sqrt(2);
PRINT 'INCISO A';
Sigma = {2 -1.131371, -1.131371 1};
Sigma_inv = inv(Sigma);
PRINT Sigma; PRINT Sigma_inv;
RUN;
QUIT;

