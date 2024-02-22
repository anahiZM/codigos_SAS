

/* Código generado (IMPORT) */
/* Archivo de origen: Cars.csv */
/* Ruta de origen: /home/u59062432 */
/* Código generado el: 28/11/21 0:17 */

%web_drop_table(WORK.cards);


FILENAME REFFILE '/home/u59062432/Cars.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.cards;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.cards; RUN;


%web_open_table(WORK.cards);

 
proc reg data=WORK.cards outest=b ridge=0.1 noprint;
   model mpg = hp vol sp wt;
run;
 
proc print data=b(where=(_TYPE_="RIDGE")) noobs;
   var _RIDGE_ Intercept hp vol sp wt;
run;

proc print;
ods graphics on;
proc reg data=WORK.cards outvif
         outest=b ridge=0 to 1 by .1;
   model mpg = hp vol sp wt;
run;
proc print data=b;
run;
proc reg data=WORK.cards plots(only)=ridge(unpack VIFaxis=log)
         outest=b ridge=0 to 1 by .1;
   model mpg = hp vol sp wt;;
run;

ods graphics off;


