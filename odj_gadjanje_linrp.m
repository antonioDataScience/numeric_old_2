function [ x, y, s ] = odj_gadjanje_linrp( T, g, a, b, A, B, c, n )

m = max( size( A ) );
s = zeros( m, 1 );
f1 = @( x, y ) T( x )*y + g( x );

[ x, y ] = odj_rk4v( f1, a, b, s, n );
% y je dimenzije 3*101, nama treba samo zadnja aproksimacija
F0 = B*y( :, n + 1 ) - c;

% rjesavamo sustav Y'=TY
Y0 = eye( m );
f2 = @( x, y ) T( x )*y;

[ x, y1 ] = odj_rk4v( f2, a, b, Y0( :, 1 ), n ); % y1 je dimenzije 3*101
[ x, y2 ] = odj_rk4v( f2, a, b, Y0( :, 2 ), n ); % y2 je dimenzije 3*101
[ x, y3 ] = odj_rk4v( f2, a, b, Y0( :, 3 ), n ); % y3 je dimenzije 3*101

% opet uzimamo samo zadnje stupce od y1, y2, y3 i slozimo ih jedan pokraj
% drugoga
Y = [ y1( :, n + 1 ) y2( :, n + 1 ) y3( :, n + 1 ) ];

DF0 = A + B*Y;

s = - DF0\F0

% konacno rjesenje
[ x, y ] = odj_rk4v( f1, a, b, s, n );

