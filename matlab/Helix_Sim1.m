clcclear% %B-S law% %==========================================================L=600/1000;          %m(total length)R=2.75*2.54/2/100;     %m(Radius of the tube)% %=================================================% Step = 0.025;z0i = 0;z0f = 0.85;z0 = z0i:Step:z0f;p0_step = 2*pi / 50;p0_max = 2*pi;p0 = 0:p0_step:p0_max;% %=============== Settings from the papercp = [0, 0.0015, 0, 0.3, 8.7, 3, 0, -0.1, 0.58];cn = [-0.001, 0.003, 0.02, -0.23, -1.26, -2, pi, 0.043, 0.62];% %========== Plot coils% [xp, yp, zp] = coilcoord(cp, 1, 6000);% plot3(zp, xp, yp)% [xn, yn, zn] = coilcoord(cn, 1, 6000);% plot3(zp, xp, yp, zn, xn, yn)% xlabel('Z')% ylabel('X')% zlabel('y')% view(0, 0)% %%% Simple case% B_shape = helix(cp,R,z0);% % ci = [0, 0.0012, 0, 0.35, 8.2, 3.2, 0, -0.12, 0.53];% [estimates, sse] = fitcurvedemo(ci, R, z0, B_shape)% zlist = linspace(z0(1)-0.2, z0(end)+0.2, 301);% plot(z0, B_shape, 'bx', zlist, helix(estimates, R, zlist), 'r-')%%% Double helixB_shape = helix(cp,R,z0) + helix(cn,R,z0);ci = [0, 0.0025, 0, 0.35, 8.4, 3, 0, -0.12, 0.54, -0.001, 0.004, 0.02, -0.3, -1.2, -2, pi, 0.04, 0.6];[estimates, sse] = fitdoublehelix(ci, R, z0, B_shape)%estimates = cicpest = estimates(1:9)cnest = estimates(10:18)zlist = linspace(z0(1)-0.2, z0(end)+0.2, 301);plot(z0, B_shape, 'bx', zlist, helix(cpest, R, zlist) + helix(cnest, R, zlist), 'r-')