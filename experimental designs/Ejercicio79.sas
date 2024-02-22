/*Diseño 2^5 de 4 bloques con ACDE y BCD confundidos*/
%web_drop_table(WORK.IMPORT3);


FILENAME REFFILE '/home/ruta_segun_distribucion_propia/d79.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.IMPORT3;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT3; RUN;


%web_open_table(WORK.IMPORT3);
proc print;
proc glm;
class rep A B C D E A*C*D*E B*C*D A*B*E;
model y = A B C A*B;
run;
proc glm;
class bloq trat;
model y=bloq trat;
run;