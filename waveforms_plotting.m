figure(1)
plot(t,i_L,'b','LineWidth',2);grid on;hold on;
xlabel('Time(ms)','FontWeight','bold','FontSize',30,'FontName','Times New Roman');
ylabel('Inductor current(A)','FontWeight','bold','FontSize',30,'FontName','Times New Roman');
figure(2)
plot(t,v_o,'r','LineWidth',2);hold on; grid on
plot(t,V_c,'b','LineWidth',2);hold on 
xlabel('Time(ms)','FontWeight','bold','FontSize',30,'FontName','Times New Roman');
ylabel('OutputVolatage','FontWeight','bold','FontSize',30,'FontName','Times New Roman');
figure(3)
plot(t,v_con,'r','LineWidth',2);hold on; grid on
plot(t,V_con1,'b','LineWidth',2);hold on 
xlabel('Time(ms)','FontWeight','bold','FontSize',30,'FontName','Times New Roman');
ylabel('OutputVolatage','FontWeight','bold','FontSize',30,'FontName','Times New Roman');