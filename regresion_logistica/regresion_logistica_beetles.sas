DATA beetles;
input log_dose nbeetles nkilled;
dose = exp(log_dose);
nsurvive=nbeetles-nkilled;
dose_est = (dose-6.0219312)/0.4039140;*estandarización de dose;
/*logit*/
ylogit = exp(0.7842 + 2.3453*dose_est)/(1+exp(0.7842 + 2.3453*dose_est));
ycll = 1-exp(-exp(-0.0220 + 1.4885*dose_est));
yll = 1-exp(-exp(-1.0694 - 1.4954*dose_est));
/*for sample proportion*/
rprob1=nkilled/nbeetles;
cards;
1.6907 59 6
1.7242 60 13
1.7552 62 18
1.7842 56 28
1.8113 63 52
1.8369 59 53
1.8610 62 61
1.8839 60 60
;
proc print;
proc logistic data=beetles descending;
model nkilled/nbeetles = dose_est/aggregate=(dose_est) scale=none;
title 'the logit model for beetles data';
proc logistic data=beetles descending;
model nkilled/nbeetles = dose_est/aggregate=(dose_est) link=probit scale=none;
title 'the probit model for beetles data';
proc logistic data=beetles descending;
model nkilled/nbeetles = dose_est/aggregate=(dose_est) link=cloglog scale=none;
title 'the complementary log log model for beetles data';
/*log-log link*/
proc logistic data=beetles descending;
model nsurvive/nbeetles = dose_est/aggregate=(dose_est) link=cloglog scale=none;
title 'the log log model for beetles data';

/*plot a curve*/
symbol1 color=red value=star interpol=NONE height=1 width=1;
symbol2 color=green value=plus interpol=spline height=1 width=1;
symbol3 color=blue value=DIAMOND interpol=spline height=1 width=1;
symbol3 color=orangered value=square interpol=spline height=1 width=1;

proc gplot;
plot rprob1*dose_est ylogit*dose_est ycll*dose_est yll*dose_est/overlay legend=legend2;
title 'sample proportion, logit cll and ll model comparison'; 
run;
