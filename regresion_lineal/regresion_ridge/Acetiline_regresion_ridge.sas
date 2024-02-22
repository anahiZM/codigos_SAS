data acetylene;
input conv t h c;
t = (t - 1212.5) / 80.623;
h = (h - 12.44) / 5.662;
c = (c- 0.0403) / 0.03164;
th = t*h;
tc = t*c;
hc = h*c;
t2 = t*t;
h2 = h*h;
c2 = c*c;
cards;
49.0 1300 7.5 0.0120
50.2 1300 9.0 0.0120
50.5 1300 11.0 0.0115
48.5 1300 13.5 0.0130
47.5 1300 17.0 0.0135
44.5 1300 23.0 0.0120
28.0 1200 5.3 0.0400
31.5 1200 7.5 0.0380
34.5 1200 11.0 0.0320
35.0 1200 13.5 0.0260
38.0 1200 17.0 0.0340
38.5 1200 23.0 0.0410
15.0 1100 5.3 0.0840
17.0 1100 7.5 0.0980
20.5 1100 11.0 0.0920
29.5 1100 17.0 0.0860
;
proc reg outest = b ridge = 0.006 to 0.04 by .002;
model conv = t h c t2 h2 c2 th tc hc/ noprint;
plot / ridgeplot nomodel;
run;
proc reg outest = b2 data = acetylene ridge = .032;
model conv = t h c t2 h2 c2 th tc hc; run;
proc print data = b2;
run;
