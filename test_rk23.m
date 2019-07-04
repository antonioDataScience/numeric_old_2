a = 0;
b = 4;
y0 = 0;
tol = 1e-5;

[ x, y, k ] = odj_rk23( @f23, a, b, y0, tol );

fprintf( 'Potrebno je %d koraka\n\n', k );

[ x1, y1 ] = odj_rk2( @f23, a, b, y0, k - 1 );

hold on;
plot( x, y, 'g-*' );
plot( x1, y1, 'b-o');
fplot( @y23, [ 0 4 ], 'r-' );
legend( 'rk23', 'rk2', 'egzaktno', 'Location', 'NorthWest' )
hold off;

format short e
greska = max( abs( y23( x ) - y ) ) 
greska1 = max( abs( y23( x1 ) - y1' ) )
