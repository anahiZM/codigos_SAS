DATA FOOD;
input lake gender size food count;
cards;
1 1 1 1 7   
1 1 1 2 1   
1 1 1 3 0   
1 1 1 4 0   
1 1 1 5 5
1 1 2 1 4   
1 1 2 2 0   
1 1 2 3 0   
1 1 2 4 1   
1 1 2 5 2        
1 2 1 1 16  
1 2 1 2 3   
1 2 1 3 2   
1 2 1 4 2   
1 2 1 5 3
1 2 2 1 3   
1 2 2 2 0   
1 2 2 3 1   
1 2 2 4 2   
1 2 2 5 3
2 1 1 1 2   
2 1 1 2 2   
2 1 1 3 0   
2 1 1 4 0   
2 1 1 5 1  
2 1 2 1 13  
2 1 2 2 7   
2 1 2 3 6   
2 1 2 4 0   
2 1 2 5 0  
2 2 1 1 3   
2 2 1 2 9   
2 2 1 3 1   
2 2 1 4 0   
2 2 1 5 2  
2 2 2 1 0   
2 2 2 2 1   
2 2 2 3 0   
2 2 2 4 1   
2 2 2 5 0 
3 1 1 1 3   
3 1 1 2 7   
3 1 1 3 1   
3 1 1 4 0   
3 1 1 5 1
3 1 2 1 8   
3 1 2 2 6   
3 1 2 3 6   
3 1 2 4 3   
3 1 2 5 5  
3 2 1 1 2   
3 2 1 2 4   
3 2 1 3 1   
3 2 1 4 1   
3 2 1 5 4          
3 2 2 1 0   
3 2 2 2 1   
3 2 2 3 0   
3 2 2 4 0   
3 2 2 5 0  
4 1 1 1 13  
4 1 1 2 10  
4 1 1 3 0   
4 1 1 4 2   
4 1 1 5 2  
4 1 2 1 9   
4 1 2 2 0   
4 1 2 3 0   
4 1 2 4 1   
4 1 2 5 2  
4 2 1 1 3   
4 2 1 2 9   
4 2 1 3 1   
4 2 1 4 0   
4 2 1 5 1
4 2 2 1 8   
4 2 2 2 1   
4 2 2 3 0   
4 2 2 4 0   
4 2 2 5 1
;
proc print;
proc logistic; freq count;
class lake size / param=ref;
model food(ref='1') = lake / link=glogit aggregate scale=none;

proc catmod; weight count;
population lake size gender;
model food = lake / pred=freq pred=prob;
run;
