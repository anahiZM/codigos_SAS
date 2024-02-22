%web_drop_table(WORK.DATOS);


FILENAME REFFILE '/home/ubicaion/TABLA 6.15.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.DATOS;
	GETNAMES=YES;
RUN;
%web_open_table(WORK.DATOS);
proc print;
PROC LOGISTIC DATA = WORK.datos outest=betas covout;
class t /param=ref;
model y = D|T /selection=backward lackfit slstay=0.15 details lackfit;
output out=pred p=phat lower=lcl upper=ucl stdreschi = q reschi=p h=h xbeta=eta predprob=(individual crossvalidate);
run;
/* Creating the standardized residuals from the "pred" dataset */
data pred2; set pred; res = p/sqrt(1-h);
/* Usual plot of stand. Residuals vs predicted eta_i */
proc sgplot data=pred2;
 title2 "Residuals vs predicted eta_i";
 scatter y=res x=eta;
run;
proc loess data=pred2;
title2 'residuals vs. eta';
model res = eta;
run;
/* Also, you can try this one below */
proc sgscatter data=pred;
title2 "Std. Pearson residual plots";
plot p*eta q*eta / loess;
run;
