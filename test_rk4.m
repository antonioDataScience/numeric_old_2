f = @( x, y ) - y - 5*exp( - x )*sin( 5*x );
a = 0;
b = 3;
y0 = 1;
n = 30;

[ x, y ] = odj_rk4( f, a, b, y0, n );

hold on;
plot( x, y, 'g-*' )
xlabel( 'x' )
ylabel( 'y' )
fplot( 'exp( -x )*cos( 5*x )', [ 0 3 ], 'r-' )
legend( 'runge-kutta', 'egzaktno' )
hold off;


rj = exp( -x ).*cos( 5*x );

fprintf( 'Maksimalna greska je: %e\n\n', max( abs( rj - y ) ) );