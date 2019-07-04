a = 1;
b = 30;
p0 = [ 5000; 100 ];
n = 300;
tol = 1e-3;

[ t, p ] = odj_rk4v( @grab_plijen_funkcija, a, b, p0, n );

[ t1, p1, k ] = odj_rk23v( @grab_plijen_funkcija, a, b, p0, tol );

figure( 1 )
subplot( 2, 1, 1 )
plot( t, p( 1, : ), 'r', t1, p1( 1, : ), 'g' )
legend( 'rk4v', 'rk23v' )
title( 'plijen' )
subplot( 2, 1, 2 )
plot( t, p( 2, : ), 'r', t1, p1( 2, : ), 'g' )
legend( 'rk4v', 'rk23v' )
title( 'grabezljivci' )
