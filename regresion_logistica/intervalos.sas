data gss;
input race $ trauma happy;*race is 0=white, 1=black;
datalines;
    0 0 1 
    0 0 1 
    0 0 1 
    0 0 1 
    0 0 1 
    0 0 1 
    0 0 1 
    0 0 2 
    0 0 2 
    0 0 2 
    0 0 2
    0 0 2
    0 0 2
    0 0 2
    0 0 2 
    0 0 2 
    0 0 2 
    0 0 2
    0 0 2
    0 0 2
    0 0 2
    0 0 2
    0 0 3
    0 1 1
    0 1 1
    0 1 1
    0 1 1 
    0 1 1
    0 1 1
    0 1 1
    0 1 1 
    0 1 2
    0 1 2
    0 1 2
    0 1 2
    0 1 2
    0 1 2
    0 1 2
    0 1 2
    0 1 2
    0 1 2
    0 1 2
    0 1 2
    0 1 3
    0 2 1
    0 2 1
    0 2 1
    0 2 1
    0 2 1
    0 2 2
    0 2 2
    0 2 2
    0 2 2         
    0 2 2
    0 2 2
    0 2 2
    0 2 2         
    0 2 2
    0 2 2
    0 2 2
    0 2 2         
    0 2 2
    0 2 2
    0 2 2
    0 2 2         
    0 2 3
    0 3 1
    0 3 2
    0 3 2
    0 3 2 
    0 3 2
    0 3 2
    0 3 2 
    0 3 2
    0 3 2
    0 3 2 
    0 3 3
    0 4 1
    0 4 2
    0 4 2
    0 4 2
    0 4 2
    0 5 3
    0 5 3
    1 0 2
    1 0 3
    1 1 2
    1 1 2
    1 1 2
    1 1 3
    1 2 2
    1 2 2
    1 2 2
    1 2 3
    1 3 2
    1 3 2
    1 3 3
;
*proc print;
ods graphics on;
proc genmod; class race;
model happy = trauma race / dist=multinomial link=clogit lrci type3;
effectplot slicefit;
run;
proc logistic data=gss plots=effect(at(race=all)); class race;
model happy = trauma race ;
output out=predict p=hi_hat lower=LCL upper=UCL;
proc print data=predict;
run;
proc logistic data=gss plots=all; class race;
model happy = trauma race;
run;
ods graphics off;
run;
