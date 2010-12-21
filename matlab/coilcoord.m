function [x, y, z] = coilcoord(params, R, npoints)
% [x, y, z] = coilcoord(params, R, npoints);
% Calculate the x, y, z coordinate of the coil
% according to the paper, takes power-6 polynomal + power-1 polynomial in
% params
   c1 = params(1:7);
   c2 = params(8:9);
   p = linspace(0, 2*pi, npoints);
   theta = polyval(c1, p);
   x = R*cos(theta);
   y = R*sin(theta);
   z = polyval(c2, p);
end