data cemento;
input i y x1 x2 x3 x4;
cards;
 1 78.5 7 26 6 60
 2 74.3 1 29 15 52
 3 104.3 11 56 8 20
 4 87.6 11 31 8 47
 5 95.9 7 52 6 33
 6 109.2 11 55 9 22
 7 102.7 3 71 17 6
 8 72.5 1 31 22 44
 9 93.1 2 54 18 22
 10 115.9 21 47 4 26
 11 83.8 1 40 23 34
 12 113.3 11 66 9 12
 13 109.4 10 68 8 12
 ;
 /* Ridge regression coefficients computed in SAS/IML */
proc iml;
use cemento;        
read ALL var {x1 x2 x3 x4} into X; 
read all var {y} into y;
close cemento;
xBar = mean(X);       /* save row vector of means */
yBar = mean(y);       /* save mean of Y */
X = X - xBar;         /* center X and y; do not add intercept */
y = y - yBar;                      
D = vecdiag(X`*X);
Z = X / sqrt(D`);     /* Z`Z = corr(X) */
ZtZ = Z`*Z;
Zty = Z`*y;
PRINT D;
PRINT (1/sqrt(D));
PRINT Z;
PRINT ZtZ; 
PRINT Zty;
k = 0.008;             /* choose a ridge parameter */
T = inv(Z`*Z + k*I(ncol(X))) * (Z`*y);
PRINT T;
b =  (1/sqrt(D)) # inv(Z`*Z + k*I(ncol(X))) * (Z`*y); /* formula in REG doc */
print (b`)[colname={"x1" "x2" "x3" "x4"}];
 
 /* The ridge regression uses centered x and y. Recover the intercept:
      y-yBar = b1(x1-x1Bar) + ... + bn(xn-xnBar)
   so      y = yBar-Sum(bi*xibar) + b1 x1 + ... + bn xn
   Consequently, b0 = yBar-Sum(bi*xibar). */
   b0 = ybar - xbar * b;
   print b0[label="Intercept"];
QUIT;
proc print;
ods graphics on;
proc reg data=cemento outvif
         outest=b ridge=0 to 1 by .001;
   model y=x1 x2 x3 x4;
run;
proc print data=b;
run;
proc reg data=cemento plots(only)=ridge(unpack VIFaxis=log)
         outest=b ridge=0 to 1 by .001;
   model y=x1 x2 x3 x4;
run;

ods graphics off;