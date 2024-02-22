data political;
input gender race ppi count;
/*gender, 1 = male; race, 1 = white; ppi: Pol itical Party Identification*/
cards;
1 1 1 132
1 1 2 176
1 1 3 127
1 2 1 42
1 2 2 6 
1 2 3 12
2 1 1 172
2 1 2 129
2 1 3 130
2 2 1 56
2 2 2 4
2 2 3 15
;
proc print;
proc logistic; freq count;
class gender race/ param=ref;
model ppi(ref='3') = gender race / link=glogit aggregate scale=none;



