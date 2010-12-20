function Bz = helix(c,R,z)

    c1 = c(1);

    c2 = c(2);

    c3 = c(3);

    c4 = c(4);

    c5 = c(5);

   c6 = c(6);

   c7 = c(7);

   c8 = c(8);





    for i=1:length(z);

      intc = @(p) (c3+2.*c4.*p+3*c5.*p.^2+c6.*p.^3+c7.*p.^4+c8.*p.^5)./sqrt(R^2+(c1+c2.*p-z(i)).^2).^3;

       Temp(i) = quad(intc, 0, 2*pi);

    end

    Bz = R.^2.*Temp;

end
