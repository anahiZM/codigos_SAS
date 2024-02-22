/*EJEMPLO 1*/
PROC IML;
PRINT 'PROCEDIMIENTO CON PROC IML';
RESET PRINT;                                                                                                                                                                                 
X={1 63,1 52,1 78,1 49,1 71,1 62,1 68,1 48,1 56,1 67};
Y={162, 158, 167, 151, 162, 168, 167, 153, 152,173};
X_prime = t(X); /*Transpuesta de X*/
X_Xprime = X_prime*X; /*(X'X)*/
X_inv = inv(X_Xprime); /*(X'X)^(-1)*/
betas = X_inv*X_prime*Y; /*(X'X)^(-1)(X'Y)*/
RUN;
QUIT;


DATA EJEMPLO1;
TITLE2 'PROCEDIMIENTO CON PROC REG';
INPUT PESO ESTATURA;
cards;
63 162
52 158
78 167
49 151
71 162
62 168
68 167
48 153
56 152
67 173
;
PROC PRINT;
PROC MEANS;
PROC REG;
model ESTATURA = PESO;
PROC PLOT;
PLOT ESTATURA*PESO;
RUN;