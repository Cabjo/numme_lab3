function [t,y] = RK4(f, tspan, h, y0 )
t = tspan(1):h:tspan(end);

y = zeros(2, length(t)); 
y(:,1) = y0; %Must be a column vector


for i=1:length(t)-1
   
    f1=f(t(i),y(:,i));
    f2=f(t(i)+h/2,y(:,i)+h/2*f1);
    f3=f(t(i)+h/2,y(:,i)+h/2*f2);
    f4=f(t(i)+h,y(:,i)+h*f3);
    y(:,i+1)=y(:,i)+h/6*(f1+2*f2+2*f3+f4);

end

period_time_25 = [1.434101396415520 1.434101396415520];
period_time_50 = [1.487569191028397 1.487569191028397];
period_y = [1 -1];

figure(1);
plot(t,y(1,:),'r','LineWidth',2);  % Plot the RK4 solution in thin red
hold on
plot(period_time_25, period_y, 'b-');
grid on
legend('RK4, y_o = 25^o', 'Period time from a)', 'Location','southwest');
xlabel('Time')
ylabel('y')
title('Solution to ml*y'' + mg*y = 0');
end