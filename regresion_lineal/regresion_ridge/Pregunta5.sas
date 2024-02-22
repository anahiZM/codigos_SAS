DATA malaria;
input x y;
cards;
1 879795
2 857782
3 738985
4 661159
5 527609
6 496664
7 288256
8 273479
9 241657
10 155011
11 153675
12 146579
13 199256
14 258927
15 263658
;
proc print;
proc reg;
model y=x/dw partial;
output out=tres
			p = yhat
			r = resi;
		proc print data=malaria;
proc gplot;
	plot resi*t;
		symbol i=join;
proc plot data=malaria;
		plot y*x="*";
run;

/* Ajuste del moedelo transformado: Cochrane Orcutt */
/*
proc reg data=tres;
model y2=x2/dw ;
output out =cuatro
            p = yhat2 
            r = resi2;
proc print data=cuatro;

proc gplot;
    plot resi2*t;
	symbol i=join;
run;