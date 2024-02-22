data belief;
input race gender belief count;
/*race, 1 =negros; gender, 1 = mujer*/
cards;
1 1 1 88
1 1 2 16
1 1 3 2
1 2 1 54
1 2 2 7
1 2 3 5
2 1 1 397
2 1 2 141
2 1 3 24
2 2 1 235
2 2 2 189
2 2 3 39
;
proc logistic; freq count;
class race gender / param=ref;
model belief(ref='3') = race gender / link=glogit aggregate scale=none;
proc catmod; weight count;
population race gender;
model belief = race gender / pred=freq pred=prob;
run;
