close all, clear all, clc 
%3.1 a) ------------------------------
format long
% yn+1 = yn + (h/2)*f(tn,yn) + f(tn+1 + y + h*f*(tn,yn))

%theta_0 = theta0 %theta(0)
%primTheta_0 = 0 %primTheta(0)
l = 0.5 %(m)
g = 9.82 %(m/s¬≤)

tabell_periodtider = []

theta0=[pi/36:pi/36:pi/2]
tabell_fel=[]

%trapetsmetoden
%uppdatera h, while loop

for r=theta0(1:end)
    h = 0.025; %Fˆr att dimentionerna ska st√§mma √∂verens 
    T = 100;
    T_old=-100;
%        for i = 1:
%             fel = tabell_periodtider(i)-tabell_periodtider(i+1)
%        end
    
     while abs(T-T_old) > 1e-10 %ber‰kna fel
        h=h/2;
        alpha = [0:h:pi/2];
        k = sin(r/2);
        f = (1./(sqrt(1-(k.^2).*(sin(alpha).^2)))); %utrycket som ska in i integralen
        f_start = f(1);
        f_slut = f(end);
        T_old=T;
        I = sum(h*f) - (h/2).*(f_start + f_slut);
        T = 4*sqrt(l/g)*I;
   
     end
     tabell_fel = [tabell_fel T-T_old];
     tabell_periodtider = [tabell_periodtider T];
end 


tabell=[tabell_periodtider', theta0'];

%%
%upg B-------------------------
tabell_periodtider'
t_tilde = 2*pi*sqrt(l/g);
error= abs((tabell_periodtider - t_tilde)./tabell_periodtider)'
tabell_relativa_fel= [error, theta0'];

%upg C-------------------------

%gˆr om ekv1 frÂn 2 till 1 ordning med hj‰lp av runge-kuttas metod