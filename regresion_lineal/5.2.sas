DATA AGUA;
INPUT Temperature Vapor_Pressure;
Y = log(Vapor_Pressure);
X = -(1/temperature);
CARDS;
273 4.6
283 9.2
293 17.5
303 31.8
313 55.3
323 92.5
333 149.4
343 233.7
353 355.1
363 525.8
373 760.0
;
PROC PRINT;
PROC REG;
MODEL Vapor_Pressure = Temperature;
run;
PROC REG;
MODEL Y = X;
RUN;