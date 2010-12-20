﻿clc
clear
tic
%B-S law
%==========================================================
L=600/1000;          %m(totel length)
R=2.75*2.54/2/100;     %m(Radius of the tube)
%=================================================

Step = 0.05;
z0i = -0.2;
z0f = L + 0.1;
z0 = z0i:Step:z0f;
p0_step = 2*pi / 50;
p0_max = 2*pi;
p0 = 0:p0_step:p0_max;

% ideal case (fit target)
%=================================================
%c_i=[-0.05, 0.106, 30, 0, 0.1];

%c_i = [ 8.698, -0.302, 0.0016, 0, -0.106, 0.581, 0, 2.999];
c_i = [ 0.58149, -0.10626, 2.9942, 8.69812, -0.30231, 0, 0.00158, 0];
B_shape = helix(c_i,R,z0);

% fit range
za = -0.4;
zb = 1;
Step2 = (zb-za)/20;
%zz = za:Step2:zb;
zz=[0:0.02:0.7, 0.75,0.8];
Bzz = helix(c_i,R,zz);

zs_i = c_i(1) + c_i(2)*p0;
theta_i=(c_i(3).*p0+c_i(4).*p0.^2+c_i(5).*p0.^3+c_i(6).*p0.^4+c_i(7).*p0.^5+c_i(8).*p0.^6);

drawnow
figure(1)
subplot(1,2,1)
plot(z0,B_shape,'*',zz,Bzz,'r');
xlabel('z0 position')
ylabel('B field')
legend('target curve','fitted range') 
subplot(1,2,2);
plot(zs_i,theta_i,'*');
xlabel('zs position');
ylabel('Theta');
legend('theta');
%=================================================
%Given parameters testing

para = 8;
%errfac = 5; % persentage
%errc = rand(1,para).*2-1;
% curve fit
%constrain = 0;
%cont = 0;
%=================================================
%while constrain == 0 
c = rand(1,para); %initial guess of c parameters
%c(1) = c_i(1)*(1+(errc(1)*errfac/100));
%c(2) = c_i(2)*(1+(errc(2)*errfac/100));
%c(3) = c_i(3)*(1+(errc(3)*errfac/100));
%c(4) = c_i(4)*(1+(errc(4)*errfac/100));
%c(5) = c_i(5)*(1+(errc(5)*errfac/100));
%c(6) = c_i(6)*(1+(errc(6)*errfac/100));
%c(7) = c_i(7)*(1+(errc(7)*errfac/100));
%c(8) = c_i(8)*(1+(errc(8)*errfac/100));
%c = [0.6, -0.1, 6, 0.5, 0.5, 0.05, 0, 0.0001];
%c(1) = 0;
%c(2) = L/2/pi;
%c(5) = 0;
%c(7) = 0;

%B_pre = helix(c,R,z0);
%theta_pre = c(3)*p0 + c(4)*p0.^2 + c(5)*p0.^3 + c(6)*p0.^4 + c(7)*p0.^5 + c(8)*p0.^6;
%z_pre = c(1) + c(2)*p0;
%max_theta = max(theta_pre) - min(theta_pre)
%z_total = abs(z_pre(1) - z_pre(length(z_pre)))
%cont = cont + 1
%    if (max_theta < 400) & (z_total < (L + 0.1))
%        constrain = 1;
%    end 
%end 
    
%====================================================
[estimates, sse] = fitcurvedemo(c, R, zz, Bzz) % fit
c_f = estimates
fittedC = helix(c_f, R, z0); % fit range is [0,zz], but plot range is [0,z0]
zs_f = c_f(1) + c_f(2)*p0;
theta_f=(c_f(3).*p0+c_f(4).*p0.^2+c_f(5).*p0.^3+c_f(6).*p0.^4+c_f(7).*p0.^5+c_f(8).*p0.^6);
figure(2)
subplot(1,2,1)
plot(z0,B_shape,'*', z0,fittedC,'r', z0,B_pre,'g');
xlabel('z0 position')
ylabel('B_field')
legend('target curve','fitted curve','initial guess')
grid on
subplot(1,2,2)
plot(zs_i,theta_i,'*',zs_f,theta_f,'r')
grid on
hold on
xlabel('z position')
ylabel('Theta')
legend('target curve','fitted curve')
%title(['Fitting to function ', func2str(model)]);
%legend('data', ['fit using ', func2str(model)])

%=================================================

toc