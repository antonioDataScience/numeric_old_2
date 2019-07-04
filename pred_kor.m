function [] = pred_kor( n, m )

f = @( x, y ) - y - 5*exp( - x ).*sin( 5*x );
a = 0;
b = 3;
y0 = 1;

[ x, y ] = odj_pred_kor( f, a, b, y0, n, m );

hold on;
plot( x, y, 'g-*', 'LineWidth', 2 );
xlabel( 'x' )
ylabel( 'y' )
fplot( 'exp( -x )*cos( 5*x )', [ 0 3 ], 'm-' )
legend( 'prediktor-korektor', 'egzaktno' )
hold off;

rj = exp( -x ).*cos( 5*x );

fprintf( 'Maksimalna greska je: %e\n\n', max( abs( rj - y ) ) );
