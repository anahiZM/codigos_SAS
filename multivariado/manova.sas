/*----------------------------------------------------*/
/*                   EJERCICIO 6.14                   */
TITLE1 '6.14';
TITLE2 'MANOVA';
DATA UNO;
INPUT X1 X2 FACTOR1 FACTOR2;
cards;
14 8 1 1
6 8 1 1
6 2 1 2
4 6 1 2
8 2 1 3
8 12 1 3
16 -4 1 4
2 6 1 4
1 6 2 1
3 8 2 1
5 12 2 2
-3 2 2 2
0 15 2 3
4 3 2 3
2 7 2 4
-4 3 2 4
3 -2 3 1
-3 2 3 1
-2 7 3 2
-4 -5 3 2
-11 1 3 3
3 -3 3 3
-6 6 3 4
-4 -6 3 4
;
proc glm data = uno;
class factor1 factor2;
model x1 x2 = factor1 factor2 factor1*factor2/ss3 ;
manova h = factor1 factor2 factor1*factor2/printe;
means factor1 factor2 / bon;
lsmeans factor1 factor2/PDIFF ADJUST=BON;
RUN;

