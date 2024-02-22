
PROC IML;
PRINT 'PROCEDIMIENTO CON PROC IML';
RESET PRINT;
X={1 0.00, 1 0.10, 1 0.20, 1 0.30, 1 0.40, 1 0.50, 1 0.60}; /*la matriz sería [1 x_1] donde 1 seria el vector de unos*/
Y={4593.00, 3141.60, 1965.20, 1064.20, 438.60, 85.00, 0.00};
X_prime = t(X); /*Transpuesta de X*/
X_Xprime = X_prime*X; /*(X'X)*/
X_inv = inv(X_Xprime); /*(X'X)^(-1)*/
betas = X_inv*X_prime*Y; /*(X'X)^(-1)(X'Y)*/
PRINT X Y;
RUN;
QUIT;


DATA EJEMPLO2;
TITLE 'PROCEDIMIENTO CON PROC REG';
INPUT X Y;
CARDS;
0.0 4593
0.1 3141.6 
0.2 1965.2
0.3 1064.2
0.4 438.6
0.5 85
0.6 0
;
PROC PRINT;
PROC MEANS;
PROC REG;
model Y=X;
PROC PLOT;
PLOT Y*X;
RUN;


