data CRABS;
INPUT color spine width satell weight y;
weight=weight/1000;
y=0; if satell>0 then y=1;
CARDS;
3  3  28.3  8  3050 1 
4  3  22.5  0  1550 0 
2  1  26.0  9  2300 1 
4  3  24.8  0  2100 0 
4  3  26.0  4  2600 1 
3  3  23.8  0  2100 0 
2  1  26.5  0  2350 0 
4  2  24.7  0  1900 0 
3  1  23.7  0  1950 0 
4  3  25.6  0  2150 0 
4  3  24.3  0  2150 0 
3  3  25.8  0  2650 0 
3  3  28.2  11 3050 1 
5  2  21.0  0  1850 0 
3  1  26.0  14 2300 1 
2  1  27.1  8  2950 1 
3  3  25.2  1  2000 1 
3  3  29.0  1  3000 1 
5  3  24.7  0  2200 0 
3  3  27.4  5  2700 1 
3  2  23.2  4  1950 1 
2  2  25.0  3  2300 1 
3  1  22.5  1  1600 1 
4  3  26.7  2  2600 1 
5  3  25.8  3  2000 1 
5  3  26.2  0  1300 0 
3  3  28.7  3  3150 1 
3  1  26.8  5  2700 1 
5  3  27.5  0  2600 0 
3  3  24.9  0  2100 0 
2  1  29.3  4  3200 1 
2  3  25.8  0  2600 0 
3  2  25.7  0  2000 0 
3  1  25.7  8  2000 1 
3  1  26.7  5  2700 1 
5  3  23.7  0  1850 0 
3  3  26.8  0  2650 0 
3  3  27.5  6  3150 1 
5  3  23.4  0  1900 0 
3  3  27.9  6  2800 1 
4  3  27.5  3  3100 1 
2  1  26.1  5  2800 1 
2  1  27.7  6  2500 1 
3  1  30.0  5  3300 1 
4  1  28.5  9  3250 1 
4  3  28.9  4  2800 1 
3  3  28.2  6  2600 1 
3  3  25.0  4  2100 1 
3  3  28.5  3  3000 1 
3  1  30.3  3  3600 1 
5  3  24.7  5  2100 1 
3  3  27.7  5  2900 1 
2  1  27.4  6  2700 1 
3  3  22.9  4  1600 1 
3  1  25.7  5  2000 1 
3  3  28.3  15 3000 1 
3  3  27.2  3  2700 1 
4  3  26.2  3  2300 1 
3  1  27.8  0  2750 0 
5  3  25.5  0  2250 0 
4  3  27.1  0  2550 0 
4  3  24.5  5  2050 1 
4  1  27.0  3  2450 1 
3  3  26.0  5  2150 1 
3  3  28.0  1  2800 1 
3  3  30.0  8  3050 1 
3  3  29.0  10 3200 1 
3  3  26.2  0  2400 0 
3  1  26.5  0  1300 0 
3  3  26.2  3  2400 1 
4  3  25.6  7  2800 1 
4  3  23.0  1  1650 1 
4  3  23.0  0  1800 0 
3  3  25.4  6  2250 1 
4  3  24.2  0  1900 0 
3  2  22.9  0  1600 0 
4  2  26.0  3  2200 1 
3  3  25.4  4  2250 1 
4  3  25.7  0  1200 0 
3  3  25.1  5  2100 1 
4  2  24.5  0  2250 0 
5  3  27.5  0  2900 0 
4  3  23.1  0  1650 0 
4  1  25.9  4  2550 1 
3  3  25.8  0  2300 0 
5  3  27.0  3  2250 1 
3  3  28.5  0  3050 0 
5  1  25.5  0  2750 0 
5  3  23.5  0  1900 0 
3  2  24.0  0  1700 0 
3  1  29.7  5  3850 1 
3  1  26.8  0  2550 0 
5  3  26.7  0  2450 0 
3  1  28.7  0  3200 0 
4  3  23.1  0  1550 0 
3  1  29.0  1  2800 1 
4  3  25.5  0  2250 0 
4  3  26.5  1  1967 1 
4  3  24.5  1  2200 1 
4  3  28.5  1  3000 1 
3  3  28.2  1  2867 1 
3  3  24.5  1  1600 1 
3  3  27.5  1  2550 1 
3  2  24.7  4  2550 1 
3  1  25.2  1  2000 1 
4  3  27.3  1  2900 1 
3  3  26.3  1  2400 1 
3  3  29.0  1  3100 1 
3  3  25.3  2  1900 1 
3  3  26.5  4  2300 1 
3  3  27.8  3  3250 1 
3  3  27.0  6  2500 1 
4  3  25.7  0  2100 0 
3  3  25.0  2  2100 1 
3  3  31.9  2  3325 1 
5  3  23.7  0  1800 0 
5  3  29.3  12 3225 1 
4  3  22.0  0  1400 0 
3  3  25.0  5  2400 1 
4  3  27.0  6  2500 1 
4  3  23.8  6  1800 1 
2  1  30.2  2  3275 1 
4  3  26.2  0  2225 0 
3  3  24.2  2  1650 1 
3  3  27.4  3  2900 1 
3  2  25.4  0  2300 0 
4  3  28.4  3  3200 1 
5  3  22.5  4  1475 1 
3  3  26.2  2  2025 1 
3  1  24.9  6  2300 1 
2  2  24.5  6  1950 1 
3  3  25.1  0  1800 0 
3  1  28.0  4  2900 1 
5  3  25.8  10 2250 1 
3  3  27.9  7  3050 1 
3  3  24.9  0  2200 0 
3  1  28.4  5  3100 1 
4  3  27.2  5  2400 1 
3  2  25.0  6  2250 1 
3  3  27.5  6  2625 1 
3  1  33.5  7  5200 1 
3  3  30.5  3  3325 1 
4  3  29.0  3  2925 1 
3  1  24.3  0  2000 0 
3  3  25.8  0  2400 0 
5  3  25.0  8  2100 1 
3  1  31.7  4  3725 1 
3  3  29.5  4  3025 1 
4  3  24.0  10 1900 1 
3  3  30.0  9  3000 1 
3  3  27.6  4  2850 1 
3  3  26.2  0  2300 0 
3  1  23.1  0  2000 0 
3  1  22.9  0  1600 0 
5  3  24.5  0  1900 0 
3  3  24.7  4  1950 1 
3  3  28.3  0  3200 0 
3  3  23.9  2  1850 1 
4  3  23.8  0  1800 0 
4  2  29.8  4  3500 1 
3  3  26.5  4  2350 1 
3  3  26.0  3  2275 1 
3  3  28.2  8  3050 1 
5  3  25.7  0  2150 0 
3  3  26.5  7  2750 1 
3  3  25.8  0  2200 0 
4  3  24.1  0  1800 0 
4  3  26.2  2  2175 1 
4  3  26.1  3  2750 1 
4  3  29.0  4  3275 1 
2  1  28.0  0  2625 0 
5  3  27.0  0  2625 0 
3  2  24.5  0  2000 0 
;
PROC LOGISTIC;
MODEL y(event='1')= weight width;
RUN;
PROC CORR;
var weight width;
RUN;