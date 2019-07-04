function [ x, y ] = odj_rk2( f, a, b, y0, n )

h = ( b - a )/n;
x = zeros( n, 1 );
y = zeros( n, 1 );
x( 1 ) = a;
y( 1 ) = y0;

c1 = 0; c2 = 1/4; c3 = 27/40;
a21 = 1/4; a31 = -189/800; a32 = 729/800;
w1= 214/891; w2 = 1/33; w3 = 650/891;

for i = 1 : n
    x( i + 1 ) = a + i*h;
    k1 = f( x( i ), y( i ) );
    k2 = f( x( i ) + c2*h, y( i ) + h*a21*k1 );
    k3 = f( x( i ) + c3*h, y( i ) + h*( a31*k1 + a32*k2 ) );
    y( i + 1 ) = y( i ) + h*( w1*k1 + w2*k2 + w3*k3 );
end
