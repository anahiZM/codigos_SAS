/*the begin of sas code
the code is used for two goal, so there is some result
that got from it and use it back to the code again fro plotting
*/
data beetles1;
input logdose nbeetles nkilled;
nsurvive=nbeetles-nkilled;
/*for sample proportion*/
rprob1=nkilled/nbeetles;
/*for logit model*/
ylogit=exp(-60.7339+34.2824*logdose)/(1+exp(-60.7339+34.2824*logdose));
/*for complementary log log*/
ycll= 1-exp(-exp(-39.5224+22.0148*logdose));
datalines;
1.691 59 6
1.724 60 13
1.755 62 18
1.784 56 28
1.811 63 52
1.837 59 53
1.861 62 61
1.884 60 60
;
/***using logistic proc for test comparing the three kinds of model */
proc logistic data= beetles1; /*for logit*/
model nkilled/nbeetles = logdose ;
title 'the logit model for beetles data';
proc logistic data= beetles1;/*for cloglog*/
model nkilled/nbeetles = logdose / link=cloglog OUTROC=cllplotd;
title 'the complementary log log model for beetles data';

proc logistic data= beetles1;/*for loglog*/
model nsurvive/nbeetles = logdose / link=cloglog OUTROC=cllplotd;
title 'the complementary log log model for beetles data';

proc logistic data= beetles1; /*for probit*/
model nkilled/nbeetles = logdose / link=probit;
title 'the probit model for beetles data';


/*plot a curve*/
symbol1 color=red value=star interpol=NONE height=1 width=1;
symbol2 color=green value=plus interpol=spline height=1 width=1;
symbol3 color=blue value=DIAMOND interpol=spline height=1 width=1;
proc gplot data=beetles1;
plot rprob1*logdose ylogit*logdose ycll*logdose/haxis=1.65 to 1.90 by
.05 overlay legend=legend2;
title 'sample proportion, cll and logit model comparison'; 
run;

/***the end of using logistic for test comparing the three kind of
model */
/*the end of sas code*/ 