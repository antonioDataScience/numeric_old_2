function f = term_obrada_funkcija( t, T )

l = 1;          %duljina sipke
r = 0.5e-2;     %polumjer
V = r*r*pi*l;   %volumen
ro = 7822;      %gustoca
m = ro*V;       %masa sipke u kg

Ap = 2*r*pi*l;  %povrsina plasta sipke

c = 444;        %spec.top.kap.
e = 0.7;        %zracenje topline povrsine
s = 5.67e-8;    %Stefan-Boltzmannova konstanta

H1 = 15;
H2 = 100;
T0 = 294.15;
th = 70;

if t < th
    Qe = 3000;
    H = H1;
    f = ( Qe - Ap*( H*( T - T0 ) + e*s*( T^4 - T0^4 ) ) )/( m*c );
else
    Qe = 0;
    H = H2;
    f = ( Qe - Ap*( H*( T - T0 ) + e*s*( T^4 - T0^4 ) ) )/( m*c );
end






