close all;clc;clear all;
buck_parameters2;
V_m=10;R=1;
D=Vref/Vin;r_eq=r_L+r_1;
Fm=1/V_m;t_s=0.1*T;
t_d=t_s+(D*T);
%% define poles
alpha=(R+r_eq)/R;
V_e=Vin/alpha;
z_c=sqrt(L/C);
w_o_ideal=1/sqrt(L*C);
w_o=w_o_ideal*sqrt((R+r_eq)/(R+r_C));
Q=alpha/(((r_C+r_eq)/z_c)+z_c/R);
%% define zeros
w_z=1/(r_C*C);
%% Control -to output TF Gvd
num_c=V_e*[1/w_z 1];
den_c=[1/(w_o^2) 1/(Q*w_o) 1];
Gvd=tf(num_c,den_c);
Gvd_delay=tf(num_c,den_c,'Inputdelay',t_d);
Gvc=Fm*Gvd;
Gvc_delay=Fm*Gvd_delay;
figure(1)
bode(Gvc,'--b');hold on;
bode(Gvc_delay,'g');hold on;


