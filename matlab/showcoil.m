function [x, y, z] = showcoil(params);
   c1 = params(1:7);
   c2 = params(8:9);
   p = linspace(0, 2*pi, 3000);
   theta = polyval(c1, p);
   x = cos(theta);
   y = sin(theta);
   z = polyval(c2, p);
end