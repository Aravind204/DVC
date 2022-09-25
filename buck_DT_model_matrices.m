alpha=R/(R+r_C);
r_e=(r_1+r_L);
T_s=t_s;I_den=[1 0; 0 1];
A_on=[-(r_e+(alpha*r_C))/L -alpha/L;
     alpha/C -alpha/(R*C)];
A_off=A_on;
B=[1/L;0];
C_m=[r_C*alpha alpha];
