DATA MARITAL;
INPUT y MS PMS EMS GENDER;
CARDS;
17 1 1 1 1
54 1 1 0 1
36 1 0 1 1
214 1 0 0 1
28 1 1 1 0
60 1 1 0 0
17 1 0 1 0
68 1 0 0 0
4 0 1 1 1
25 0 1 0 1
4 0 0 1 1
322 0 0 0 1 
11 0 1 1 0
42 0 1 0 0
4 0 0 1 0
130 0 0 0 0
;
proc print; 
proc logistic; freq y;
class MS EMS GENDER/ param=ref;
model PMS = GENDER / selection=backward lackfit;
run;