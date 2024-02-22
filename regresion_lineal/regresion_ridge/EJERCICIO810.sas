Data E810;
input A B C D E y;
cards;
0 0 0 0 0 7.78
0 0 0 0 0 7.78
0 0 0 0 0 7.81
1 0 0 1 0 8.15
1 0 0 1 0 8.18
1 0 0 1 0 7.88
0 1 0 1 0 7.50
0 1 0 1 0 7.56
0 1 0 1 0 7.50
1 1 0 0 0 7.59
1 1 0 0 0 7.56
1 1 0 0 0 7.75
0 0 1 1 0 7.54
0 0 1 1 0 8.00
0 0 1 1 0 7.88
1 0 1 0 0 7.69
1 0 1 0 0 8.09
1 0 1 0 0 8.06
0 1 1 0 0 7.56
0 1 1 0 0 7.52
0 1 1 0 0 7.44
1 1 1 1 0 7.56
1 1 1 1 0 7.81
1 1 1 1 0 7.69
0 0 0 0 1 7.50
0 0 0 0 1 7.25
0 0 0 0 1 7.12
1 0 0 1 1 7.88
1 0 0 1 1 7.88
1 0 0 1 1 7.44
0 1 0 1 1 7.50
0 1 0 1 1 7.56
0 1 0 1 1 7.50
1 1 0 0 1 7.63
1 1 0 0 1 7.75
1 1 0 0 1 7.56
0 0 1 1 1 7.32
0 0 1 1 1 7.44
0 0 1 1 1 7.44
1 0 1 0 1 7.56
1 0 1 0 1 7.69
1 0 1 0 1 7.62
0 1 1 0 1 7.18
0 1 1 0 1 7.18
0 1 1 0 1 7.25
1 1 1 1 1 7.81
1 1 1 1 1 7.50
1 1 1 1 1 7.59
; 
proc glm;
class A B C D;
Model y = A B C D E A*B A*C A*D A*E B*E C*E D*E;
run;