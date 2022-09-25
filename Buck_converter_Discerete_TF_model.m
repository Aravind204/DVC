buck_parameters2;
V_m=10;R=1;
D=Vref/Vin;r_eq=r_L+r_1;
F_m=1/V_m;t_s=0.1*T;
alpha=R/(R+r_C);
r_e=(r_1+r_L);
T_s=t_s;I_den=[1 0; 0 1];
A_on=[-(r_e+(alpha*r_C))/L -alpha/L;
     alpha/C -alpha/(R*C)];
A_off=A_on;
B=[1/L;0];
C_m=[r_C*alpha alpha];
%% Obtain Aeq and Beq matrices
Aeq=(expm(A_on*T));
Beq=(expm(A_on*(T-(D*T)-t_s)))*B*Vin*T;
Ceq=C_m;
Deq=0;
%% DT Small signal model
[num_vd,den_vd]=ss2tf(Aeq,Beq,Ceq,Deq);
G_vdd=tf(num_vd,den_vd,T);
G_vcd=F_m*G_vdd;
figure(1)
bode(G_vcd,'r'); hold on;grid on