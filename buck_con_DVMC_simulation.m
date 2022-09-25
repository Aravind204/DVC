clear; close all; clc;
buck_parameters2;
%T=1e-6;
DCM_En=0;
N_tran=500;T_tran=2*N_tran*T;
t_start=0;t_sim=T_tran;
%% Controller parameters
K_pd=10;K_id=0.3;K_dd=20;t_s=0.1*T;
V_m=10;R1=1;R2=0.05;R=R1;
I_L_int=1;
V_C_int=0.99;
V_s_int=V_C_int;V_integral=0;
%%
sim('diiferentialeq_n__buck_converter.slx');
simulation_file;
waveforms_plotting;