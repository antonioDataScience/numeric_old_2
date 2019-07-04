T = @( x ) [ x, 0, -x^2; 2*x^3-x, 3*x^2-2*x+1, -4*x-2; -3*x^3+2, 2*x^3+x^2-3*x, 2*x ];
g = @( x ) [ -2*x^2+5*x-3; x+3; -x^3+1 ];

a = 0;
b = 2;

A = [ 1 0 -1; 2 3 1; 4 5 -2 ];
B = eye( 3 );
c = [ 3; -8; 5 ];

n = 100;

[ x, y, s ] = odj_gadjanje_linrp( T, g, a, b, A, B, c, n );

hold on;
plot( x, y( 1, : ), 'y', 'Linewidth', 2 );
plot( x, y( 2, : ), 'g', 'Linewidth', 2 );
plot( x, y( 3, : ), 'r', 'Linewidth', 2 );
legend( 'y1', 'y2', 'y3', 'Location', 'SouthWest' );

