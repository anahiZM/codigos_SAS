/*Diseño factorial 2^2*/
data factorial;				
input trat rep A B y;
cards;					
1 1 0 0 18.2	
2 1 1 0 27.2	
3 1 0 1 15.9	
4 1 1 1 41	
1 2 0 0 18.9	
2 2 1 0 24	
3 2 0 1 14.5	
4 2 1 1 43.9	
1 3 0 0 12.9	
2 3 1 0 22.4	
3 3 0 1 15.1	
4 3 1 1 36.3	
1 4 0 0 14.4	
2 4 1 0 22.5	
3 4 0 1 14.2	
4 4 1 1 39.9	
;					
proc print;	
ods graphics on;			
proc glm;				
class rep A B;		
model y= rep A B A*B;
run;	
ods graphics off;				
proc glm;				
class trat;				
model y=trat;				
means trat/tukey;				
run;					
proc glm;				
class rep trat;			
model y=rep trat;			
means trat/tukey;				
run;					
