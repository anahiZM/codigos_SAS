PROC IML;
PRINT 'PROCEDIMIENTO CON PROC IML';
RESET PRINT;
X={1 0.00, 1 0.10, 1 0.20, 1 0.30, 1 0.40, 1 0.50, 1 0.60}; 
Y={4593.00, 3141.60, 1965.20, 1064.20, 438.60, 85.00, 0.00};
X_prime = t(X); /*Transpuesta de X*/
X_Xprime = X_prime*X; /*(X'X)*/
X_inv = inv(X_Xprime); /*(X'X)^(-1)*/
X_primeY= X_prime*Y;
betas = X_inv*X_primeY; /*(X'X)^(-1)(X'Y)*/
x_i = X[, 2];
x_i2 = x_i##2;
sum_xi = x_i[+,];
sum_xi2 = x_i2[+,];


PRINT 'ANOVA C1';
/*CONSTRUCCION DE LA TABLA C2*/
Y_barra = Y[:];
n = 7;
Y_prime = t(Y);
Y_primeY = Y_prime*Y;
B_TX_TY = t(betas)*X_primeY;    /*B'X'y*/

SCE = t(betas)*X_primeY - n*Y_barra##2;
SCR = Y_primeY - B_TX_TY;
RUN;
QUIT;