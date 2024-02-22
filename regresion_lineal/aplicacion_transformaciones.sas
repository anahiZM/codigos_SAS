/*Ajuste un modelo de regresión. Obtenga el ANDEVA y las gráficas de residuos. ¿Cuáles son 
sus conclusiones con respecto a la adecuación del modelo?*/
/*Identifique y aplique una transformación apropiada para los datos. Ajuste un modelo de
regresión a los datos y realice las pruebas habituales de adecuación del modelo.*/
%web_drop_table(WORK.edu);


FILENAME REFFILE '/home/ubicacion/educacion.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.edu;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.edu; RUN;


%web_open_table(WORK.edu);
proc print data = WORK.edu;
 
proc reg data=work.edu;
model prestige = income;
run;
proc iml;
use WORK.edu;
read all var {income} into X;
read all var {prestige} into Y;
/*xlnx*/
w = X#log(X);
create b var{X W Y};
append;

proc print data=b;
proc reg data=b;
model y = x w;


