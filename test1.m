A = [ 16, -4, 8, 12; -4, 4, -7, 3; 8, -7, 78, 32; 12, 3, 32, 113 ];
b = [ 32; -4; 111; 160 ];
x0 = zeros( 4, 1 );

tol = 1e-5;
om = 1.2;

[ x, k, rez ] = sor( A, b, x0, tol, om );

[ omega, ro ] = sor_konvergencija( A );