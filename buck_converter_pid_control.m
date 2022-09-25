close all;clc;clear;
buck_parameters2;
R=1;
t_s=0.1*T;
D=Vref/Vin;r_eq=r_L+r_1;
alpha=R/(R+r_C);
t_total=t_s+(D*T);
%%
f_sw=1/T;w_sw=2*pi*f_sw;
z_c=sqrt(L/C);w_o_ideal=1/sqrt(L*C);
w_o=w_o_ideal*(sqrt((R+r_eq)/(R+r_C)));
Q=alpha/(((r_C+r_eq)/z_c)+(z_c/R));
%% define zeros
w_z=1/(r_C*C);
w_z1=1/((R+r_C)*C);
w_z2=r_eq/L;
%% Controller_to_output TF Gvd
num_c=(Vin/alpha)*[1/w_z 1];
den_c=[1/(w_o^2) 1/(Q*w_o) 1];
Gvd=tf(num_c,den_c);
Gvd_delay=tf(num_c,den_c,'Inputdelay',t_total);

%% Open loop output Impedance
num_o=(r_eq/alpha)*[1/(w_z2*w_z) ((1/w_z1)+(1/w_z2)) 1];
den_o=[1/(w_o^2) 1/(Q*w_o) 1];
Z_o=tf(num_o,den_o);
%% audio  susptibility
num_c=(D/alpha)*[1/w_z 1];
den_c=[1/(w_o^2) 1/(Q*w_o) 1];
Gvg=tf(num_c,den_c);
%% modular and controller parameters
V_m=10;
Fm=1/V_m;
%% PID controller design using pole /zero cancellation
k1=1/(w_o*Q);k2=1/(w_o^2);w_c=0.15*(2*pi*f_sw);
K_ia=(alpha*V_m*w_c)/Vin; tau_d=1/w_z;
K_pa=K_ia*(k1-tau_d);
K_da=(k2*K_ia)-(K_pa*tau_d);
num_con=[(K_da +(tau_d*K_pa)) (K_pa +(K_ia*tau_d)) K_ia];
den_con=[tau_d 1 0];
Gc=tf(num_con,den_con);
%% Loop gain and closed_loop TFs
G_loop=Gvd*Fm*Gc;
G_loop_delay=Gvd_delay*Fm*Gc;


Z_oc=Z_o/(1+G_loop);
G_cl=G_loop/(1+G_loop);
G_vgc=Gvg/(1+G_loop);
figure(1)
bode(G_loop,'b'); hold on;grid on
bode(G_loop_delay,'r'); hold on;grid on
%% Analog to Digital PID controller conversion
K_pd=K_pa
K_id=K_ia*T
K_dd=K_da/T
t_sim=2e-3;t_step=1e-3;Io_step=20;
%sim('diiferentialeq_n__buck_converter');
%simulation_file;
%waveforms_plotting;