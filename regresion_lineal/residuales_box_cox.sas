/*Se implementa el siguiente código para analizar los residuales 
y obtener el valor de lambda para las transformaciones boxcox*/
proc iml;
Edad = {0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6};
Plasma = {17, 11.2, 9.2, 12.6, 7.4, 10.5, 8.3, 5.8, 4.6, 6.5, 5.3, 3.8, 3.2, 4.5};
create a var{edad plasma};
append;
quit;

proc print data = a;
run;

proc reg;
model plasma = edad;
run;

proc transreg details;
model boxcox(plasma/convenient lambda=-1 to 1 by .01)=identity(edad);
output out=two;
run;



