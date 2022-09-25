for n=0:N_tran-1
    figure(3)
    plot(t1_scale,Vsam,'o','Linewidth',2);hold on;grid on;
    Ve=(Vref-Vsam);
    V_intg=V_intg_int+(K_id*Ve);V_intg_int=V_intg;
    V_der=K_dd*(Ve-Ve_int);Ve_int=Ve;
    Vcon=(K_pd*Ve)+V_intg+V_der;
    D_temp=Vcon/V_m;
    if D_temp<0
        D=0;
    elseif D_temp>1
        D=1;
    else
        D=D_temp;
    end
A_LS=(expm(A_on*T));
B_LS=(expm(A_on*(T-(D*T)-t_start)))*((expm(A_on*(D*T)))-I_den)*(inv(A_on))*B;
x_n1=A_LS*x_n+B_LS*Vin;
t1=t1+T;t1_scale=t1*1e3;
x_n=x_n1;V_o_s=C_m*x_n;Vsam=V_o_s;
figure(1)
plot(t1_scale,x_n(1),'o','Linewidth',2);hold on;grid on;
end