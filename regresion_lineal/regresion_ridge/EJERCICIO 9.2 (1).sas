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
proc print;
proc reg;
model y=x1 x2 x3 x4/ vif;
proc corr;
var x1 x2 x3 x4 ;
run;
proc princomp cov;
var x1 x2 x3 x4;
run;
