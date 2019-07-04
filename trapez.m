f =  @( x, y ) - 100*( y - cos( x ) ) - sin( x );
a = 0;
b = 1;
y0 = 1;

for n = 20 : 10 : 50
    
    [ x, y ] = odj_impl_trapez( f, a, b, y0, n );
    [ x1, y1 ] = odj_rk2( f, a, b, y0, n );
    
    fprintf( 'n = %d\n\n', n );
    fprintf( 'Greska trapezne metode: %e\n\n', max( abs( y - cos( x ) ) ) );
    fprintf( 'Greska Runge-Kutta metode: %e\n\n', max( abs( y1 - cos( x1 ) ) ) );

    clf;
    hold on;
    plot( x, y, 'c', 'LineWidth', 2 )
    plot( x1, y1, 'g', 'LineWidth', 2 )
    fplot( 'cos( x )' , [ 0 1 ], 'm' )
    legend( 'trapezna', 'Runge-Kutta', 'cos( x )', 'Location', 'SouthWest' )
    hold off;
    pause( 1 );
    
end
    
    
