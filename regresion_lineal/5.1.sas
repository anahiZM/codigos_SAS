DATA Hydro;
input Temperature Viscosity;
Y = LOG(Viscosity);
X = Temperature;
cards;
 24.9 1.133
 35.0 0.9772
 44.9 0.8532
 55.1 0.7550
 65.2 0.6723
 75.2 0.6021
 85.2 0.5420
 95.2 0.5074
 ;
 PROC REG;
 MODEL viscosity = temperature;
 RUN;
 
 PROC REG;
 MODEL Y = X;
 RUN;