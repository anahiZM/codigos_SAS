proc format; value NA .='NA'; run;

DATA gasoline;
INPUT n Automobile $ y x1 x2 x3 x4 $ x5 $ x6 x7 x8 x9 x10 x11;
cards;
1   Apollo 18.90 350.0 165 260.0  8.0:1 2.56:1  4  3 200.3 69.9 3910   1
2         Omega 17.00 350.0 170 275.0  8.5:1 2.56:1  4  3 199.6 72.9 2860   1
3          Nova 20.00 250.0 105 185.0 8.25:1 2.73:1  1  3 196.7 72.2 3510   1
4       Monarch 18.25 351.0 143 255.0  8.0:1 3.00:1  2  3 199.9 74.0 3890   1
5        Duster 20.07 225.0  95 170.0  8.4:1 2.76:1  1  3 194.1 71.8 3365   2
6  Jenson_Conv. 11.20 440.0 215 330.0  8.2:1 2.88:1  4  3 184.5 69.0 4215   1
7       Skyhawk 22.12 231.0 110 175.0  8.0:1 2.56:1  2  3 179.3 65.4 3020   1
8         Monza 21.47 262.0 110 200.0  8.5:1 2.56:1  2  3 179.3 65.4 3180   1
9      Scirocco 34.70  89.7  70  81.0  8.2:1 3.90:1  2  4 155.7 64.0 1905   2
10 Corolla_SR-5 30.40  96.9  75  83.0  9.0:1 4.30:1  2  5 165.2 65.0 2320   2
11       Camaro 16.50 350.0 155 250.0  8.5:1 3.08:1  4  3 195.4 74.4 3885   1
12  Datsun_B210 36.50  85.3  80  83.0  8.5:1 3.89:1  2  4 160.6 62.2 2009   2
13     Capri_II 21.50 171.0 109 146.0  8.2:1 3.22:1  2  4 170.4 66.9 2655   2
14        Pacer 19.70 258.0 110 195.0  8.0:1 3.08:1  1  3 171.5 77.0 3375   1
15       Babcat 20.30 140.0  83 109.0  8.4:1 3.40:1  2  4 168.8 69.4 2700   2
16      Granada 17.80 302.0 129 220.0  8.0:1  3.0:1  2  3 199.9 74.0 3890   1
17     Eldorado 14.39 500.0 190 360.0  8.5:1 2.73:1  4  3 224.1 79.8 5290   1
18     Imperial 14.89 440.0 215 330.0  8.2:1 2.71:1  4  3 231.0 79.7 5185   1
19      Nova_LN 17.80 350.0 155 250.0  8.5:1 3.08:1  4  3 196.7 72.2 3910   1
20      Valiant 16.41 318.0 145 255.0  8.5:1 2.45:1  2  3 197.6 71.0 3660   1
21    Starfi_re 23.54 231.0 110 175.0  8.0:1 2.56:1  2  3 179.3 65.4 3050   1
22      Cordoba 21.47 360.0 180 290.0  8.4:1 2.45:1  2  3 214.2 76.3 4250   1
23     Trans_AM 16.59 400.0 185 217.9  7.6:1 3.08:1  4  3 196.0 73.0 3850   1
24  Corolla_E-5 31.90  96.9  75  83.0  9.0:1 4.30:1  2  5 165.2 61.8 2275   2
25        Astre 29.40 140.0  86 217.9  8.0:1 2.92:1  2  4 176.4 65.4 2150   2
26      Mark_IV 13.27 460.0 223 366.0  8.0:1 3.00:1  4  3 228.0 79.8 5430   1
27    Celica_GT 23.90 133.6  96 120.0  8.4:1 3.91:1  2  5 171.5 63.4 2535   2
28   Charger_SE 19.73 318.0 140 255.0  8.5:1 2.71:1  2  3 215.3 76.3 4370   1
29       Cougar 13.90 351.0 148 243.0  8.0:1 3.25:1  2  3 215.5 78.5 4540   1
30        Elite 13.27 351.0 148 243.0  8.0:1 3.26:1  2  3 216.1 78.5 4715   1
31      Matador 13.77 360.0 195 295.0 8.25:1 3.15:1  4  3 209.3 77.4 4215   1
32     Corvette 16.50 350.0 165 255.0  8.5:1 2.73:1  4  3 185.2 69.0 3660   1
;




proc iml;
use gasoline;        
read ALL var {x1 x2 x3 x6 x7 x8 x9 x10 x11} into X; 
read all var {y} into y;
close gasoline;
xBar = mean(X);       /* save row vector of means */
yBar = mean(y);       /* save mean of Y */
X = X - xBar;         /* center X and y; do not add intercept */
y = y - yBar;                      
D = vecdiag(X`*X);
Z = X / sqrt(D`);     /* Z`Z = corr(X) */
ZtZ = Z`*Z;
Zty = Z`*y;

k = 0.1;             /* choose a ridge parameter */
T = inv(Z`*Z + k*I(ncol(X))) * (Z`*y);
b =  (1/sqrt(D)) # inv(Z`*Z + k*I(ncol(X))) * (Z`*y); /* formula in REG doc */
print (b`)[colname={"x1" "x2" "x3" "x6" "x7" "x8" "x9" "x10" "x11"}];
 
 /* The ridge regression uses centered x and y. Recover the intercept:
      y-yBar = b1(x1-x1Bar) + ... + bn(xn-xnBar)
   so      y = yBar-Sum(bi*xibar) + b1 x1 + ... + bn xn
   Consequently, b0 = yBar-Sum(bi*xibar). */
   b0 = ybar - xbar * b;
   print b0[label="Intercept"];
QUIT;


proc reg outest = b ridge = 0 to 1 by .1;
model y = x1 x2 x3 x6 x7 x8 x9 x10 x11/ noprint;
plot / ridgeplot nomodel;
run;
proc reg outest = b2 data = gasoline ridge = .1;
model y = x1 x2 x3 x6 x7 x8 x9 x10 x11/ r; 
run;
proc print data = b2;
run;
proc reg data = gasoline;
model y = x1 x2 x3 x6 x7 x8 x9 x10 x11;
run;
