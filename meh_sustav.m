a = 0;
b = 1.5;
y0 = zeros( 2, 1 );
tol = 1e-5;

[ x, y, k ] = odj_rk23v( @meh_sustav_funkcija, a, b, y0, tol );

subplot( 2, 1, 1 )
plot( x, y( 1, : ), 'm:', 'LineWidth', 2 );
title( 'polozaj' )
subplot( 2, 1, 2 )
plot( x, y( 2, : ), 'm:', 'LineWidth', 2 );
title( 'brzina' )