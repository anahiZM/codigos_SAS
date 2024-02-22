/*Regresión lineal utilizando PROC IML*/
DATA DESEMBOLSOS;
INPUT Año Y X2 X3 X4 X5;
CARDS;
1962 51.1 560.3 0.6 16.0 0
1963 52.3 590.5 0.9 16.4 0
1964 53.6 632.4 1.1 16.7 0
1965 49.6 684.9 1.4 17.0 1
1966 56.8 749.9 1.6 20.2 1
1967 70.1 793.9 1.0 23.4 1
1968 80.5 865.0 0.8 25.6 1
1969 81.2 931.4 1.5 24.6 1
1970 80.3 992.7 1.0 24.8 1
1971 77.7 1077.6 1.5 21.7 1
1972 78.3 1185.9 2.95 21.5 1
1973 74.5 1326.4 4.8 24.3 0
1974 77.8 1434.2 10.3 26.8 0
1975 85.6 1549.2 16.0 29.5 0
1976 89.4 1718.0 14.7 30.4 0
1977 97.5 1918.3 8.3 33.3 0
1978 105.2 2163.9 11.0 38.0 0
1979 117.7 2417.8 13.0 46.2 0
1980 135.9 2633.1 15.3 57.6 0
1981 162.1 2937.7 18.0 68.9 0
;
PROC PRINT;
PROC REG;
MODEL Y = X2 X3 X4 X5;
RUN;
/*************************************************/
TITLE 'USANDO PROC IML';
proc iml;
use desembolsos;
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