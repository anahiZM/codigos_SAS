/*              EJERCICIO 7.1              */
TITLE 'EJERCICIO 7.1';
DATA ROSAS;
INPUT Y X2 X3 X4 X5;
Y1 = log(Y);
X12 = log(X2);
X13 = log(X3);
X14 = log(X4);
cards;
11484 2.26 3.49 158.11 1
9348 2.54 2.85 173.36 2
8429 3.07 4.06 165.26 3
10079 2.91 3.64 172.92 4
9240 2.73 3.21 178.46 5
8862 2.77 3.66 198.62 6
6216 3.59 3.76 186.28 7
8253 3.23 3.49 188.98 8
8038 2.60 3.13 180.49 9
7476 2.89 3.20 183.33 10
5911 3.77 3.65 181.87 11
7950 3.64 3.60 185.00 12
6134 2.82 2.94 184.00 13
5868 2.96 3.12 188.20 14
3160 4.24 3.58 175.67 15
5872 3.69 3.53 188.00 16
;
PROC PRINT;
/*Modelo lineal*/
PROC REG;
MODEL Y = X2 X3 X4 X5;
/*Modelo log lineal*/
PROC REG;
MODEL Y1 = X12 X13 X14 X5;
RUN;

TITLE 'USANDO PROC IML';

proc iml;
PRINT 'INCISO a) MODELO LINEAL';
use ROSAS;
read all var{x2 x3 x4 x5} into X1;
read all var{y} into Y;
n=nrow(X1);
unos=J(n, 1, 1);
X=unos||X1;
k=ncol(X);
Ybar=(1/n)*unos`*y;

XY=X`*Y;
XX=X`*X;
invXX=inv(XX);
BETA_est=invXX*X`*Y;
print 'X´Y=' XY;
print 'inv(X´X)=' invXX;
print 'betas estimados=' BETA_est;

dfTOTAL=n-1; /* PARA EL ANOVA COMENAZAMOS AQUÍ*/
dfE=k-1;
dfR=n-k;

r=y-X*beta_est;

SCR=r`*r;
SCT=Y`*Y-n*(Ybar**2);
SCE=SCT-SCR;

CME=SCE/dfE;
CMR=SCR/dfR;

F0=(CME)/(CMR);
Ftablas=quantile('F', 0.95, dfE, dfR);

PRINT 'PRUEBA DE AJUSTE GENERAL DEL MODELO';
PRINT 'SC' 'gl' 'CM';
PRINT SCE dfE CME;
PRINT SCR dfR CMR;

PRINT 'F_0=' F0 'F de tablas con alpha=0.05=' Ftablas;
run;

/*PRUEBAS DE HIPÓTESIS DOBRE LOS COEFICIENTES INDIVIDUALES */

print 'PRUEBAS DE HIPÓTESIS DOBRE LOS COEFICIENTES INDIVIDUALES';

sigma2_est=SCR/dfR;
COVB_est=sigma2_est*invXX;

b1=beta_est[1];
b2=beta_est[2];
b3=beta_est[3];
b4=beta_est[4];
b5=beta_est[5];

SE1=sqrt(COVB_est[1, 1]);
SE2=sqrt(COVB_est[2, 2]);
SE3=sqrt(COVB_est[3, 3]);
SE4=sqrt(COVB_est[4, 4]);
SE5=sqrt(COVB_est[5, 5]);

t1=b1/SE1; /* Valor t para el primer coeficiente (beta_1)*/
t2=b2/SE2;
t3=b3/SE3;
t4=b4/SE4;
t5=b5/SE5;

t_tablas=quantile('t', 1-(0.05/2), n-k);


p1=2*(1-cdf('t', abs(t1), n-k)); /*p valor para la prueba de significancia de beta_1*/
p2=2*(1-cdf('t', abs(t2), n-k));
p3=2*(1-cdf('t', abs(t3), n-k));
p4=2*(1-cdf('t', abs(t4), n-k));
p5=2*(1-cdf('t', abs(t5), n-k));

print 'MATRIZ DE VARS. Y COVS. DE LOS ESTS. DE BETAS' COVB_est;
print 't valores' t1 t2 t3 t4 T5;
print t_tablas;
print 'p valores para H_0: beta_i=0' p1 p2 p3 p4 p5;

/* Intervalos de confianza para los betas */

inf1=b1-t_tablas*SE1;
sup1=b1+t_tablas*SE1;

inf2=b2-t_tablas*SE2;
sup2=b2+t_tablas*SE2;

inf3=b3-t_tablas*SE3;
sup3=b3+t_tablas*SE3;

inf4=b4-t_tablas*SE4;
sup4=b4+t_tablas*SE4;

inf5=b5-t_tablas*SE5;
sup5=b5+t_tablas*SE5;

print 'Intervalos de confianza para los coeficientes de regresión.';
print 'beta_1' inf1 sup1;
print 'beta_2' inf2 sup2;
print 'beta_3' inf3 sup3;
print 'beta_4' inf4 sup4;
print 'beta_5' inf5 sup5;
QUIT;


proc iml;
PRINT 'INCISO b) MODELO LOG-LINEAL';
use ROSAS;
read all var{x12 x13 x14 x5} into X1;
read all var{y1} into Y;
n=nrow(X1);
unos=J(n, 1, 1);
X=unos||X1;
k=ncol(X);
Ybar=(1/n)*unos`*y;

XY=X`*Y;
XX=X`*X;
invXX=inv(XX);
BETA_est=invXX*X`*Y;
print 'X´Y=' XY;
print 'inv(X´X)=' invXX;
print 'betas estimados=' BETA_est;

dfTOTAL=n-1; /* PARA EL ANOVA COMENAZAMOS AQUÍ*/
dfE=k-1;
dfR=n-k;

r=y-X*beta_est;

SCR=r`*r;
SCT=Y`*Y-n*(Ybar**2);
SCE=SCT-SCR;

CME=SCE/dfE;
CMR=SCR/dfR;

F0=(CME)/(CMR);
Ftablas=quantile('F', 0.95, dfE, dfR);

PRINT 'PRUEBA DE AJUSTE GENERAL DEL MODELO';
PRINT 'SC' 'gl' 'CM';
PRINT SCE dfE CME;
PRINT SCR dfR CMR;

PRINT 'F_0=' F0 'F de tablas con alpha=0.05=' Ftablas;
run;

/*PRUEBAS DE HIPÓTESIS DOBRE LOS COEFICIENTES INDIVIDUALES */

print 'PRUEBAS DE HIPÓTESIS DOBRE LOS COEFICIENTES INDIVIDUALES';

sigma2_est=SCR/dfR;
COVB_est=sigma2_est*invXX;

b1=beta_est[1];
b2=beta_est[2];
b3=beta_est[3];
b4=beta_est[4];
b5=beta_est[5];

SE1=sqrt(COVB_est[1, 1]);
SE2=sqrt(COVB_est[2, 2]);
SE3=sqrt(COVB_est[3, 3]);
SE4=sqrt(COVB_est[4, 4]);
SE5=sqrt(COVB_est[5, 5]);

t1=b1/SE1; /* Valor t para el primer coeficiente (beta_1)*/
t2=b2/SE2;
t3=b3/SE3;
t4=b4/SE4;
t5=b5/SE5;

t_tablas=quantile('t', 1-(0.05/2), n-k);


p1=2*(1-cdf('t', abs(t1), n-k)); /*p valor para la prueba de significancia de beta_1*/
p2=2*(1-cdf('t', abs(t2), n-k));
p3=2*(1-cdf('t', abs(t3), n-k));
p4=2*(1-cdf('t', abs(t4), n-k));
p5=2*(1-cdf('t', abs(t5), n-k));

print 'MATRIZ DE VARS. Y COVS. DE LOS ESTS. DE BETAS' COVB_est;
print 't valores' t1 t2 t3 t4 T5;
print t_tablas;
print 'p valores para H_0: beta_i=0' p1 p2 p3 p4 p5;

/* Intervalos de confianza para los betas */

inf1=b1-t_tablas*SE1;
sup1=b1+t_tablas*SE1;

inf2=b2-t_tablas*SE2;
sup2=b2+t_tablas*SE2;

inf3=b3-t_tablas*SE3;
sup3=b3+t_tablas*SE3;

inf4=b4-t_tablas*SE4;
sup4=b4+t_tablas*SE4;

inf5=b5-t_tablas*SE5;
sup5=b5+t_tablas*SE5;

print 'Intervalos de confianza para los coeficientes de regresión.';
print 'beta_1' inf1 sup1;
print 'beta_2' inf2 sup2;
print 'beta_3' inf3 sup3;
print 'beta_4' inf4 sup4;
print 'beta_5' inf5 sup5;
QUIT;
