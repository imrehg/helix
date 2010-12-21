function Bz = helix(c,R,z)
    c1d = polyder(c(1:7));
    c2 = c(8:9);

    field = zeros(length(z),1);
    for i = 1:length(z)
        intc = @(p) polyval(c1d, p) ./ sqrt(R^2 + (polyval(c2, p)-z(i)).^2).^3;
        field(i) = quad(intc, 0, 2*pi);
    end
    Bz = R^2 * field;
end
