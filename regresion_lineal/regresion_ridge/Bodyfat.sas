data bodyfat;
input x1 x2 x3 y;
*y = (y-20.195)/;
*x1 = (x1-25.305)/5.0232591;
*x2 = (x2-51.17)/5.2346115;
*x3 = (x3-27.62)/3.6471474;
cards;
19.5  43.1  29.1  11.9
24.7  49.8  28.2  22.8
30.7  51.9  37.0  18.7
29.8  54.3  31.1  20.1
19.1  42.2  30.9  12.9
25.6  53.9  23.7  21.7
31.4  58.5  27.6  27.1
27.9  52.1  30.6  25.4
22.1  49.9  23.2  21.3
25.5  53.5  24.8  19.3
31.1  56.6  30.0  25.4
30.4  56.7  28.3  27.2
18.7  46.5  23.0  11.7
19.7  44.2  28.6  17.8
14.6  42.7  21.3  12.8
29.5  54.4  30.1  23.9
27.7  55.3  25.7  22.6
30.2  58.6  24.6  25.4
22.7  48.2  27.1  14.8
25.2  51.0  27.5  21.1
;
PROC MEANS DATA = bodyfat;
proc reg outest = b ridge = 0 to 1 by .001;
model y = x1 x2 x3 / noprint;
plot / ridgeplot nomodel;
run;
PROC PRINT DATA= B;

proc reg outest = b2 data = bodyfat ridge = .1;
model y = x1 x2 x3/ r; 
run;
proc print data = b2;
run;
proc reg data = bodyfat;
model y = x1 x2 x3;
run;
