data GLASS;
INPUT  y x @@;
Y1 = LOG(Y);
cards;
13.0 4 34.2 11
16.1 5 65.6 12
14.5 6 49.2 13
17.8 7 66.2 14
22.0 8 81.2 15
27.4 9 87.4 16
16.8 10 114.5 17
;
proc print;
PROC REG;
MODEL Y = X;
RUN;
PROC REG;
MODEL Y1 = X;
RUN;