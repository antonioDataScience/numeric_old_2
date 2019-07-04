function [ x, y ] = odj_impl_trapez( f, a, b, y0, n )

h = ( b - a )/n;
x( 1 ) = a;
y( 1 ) = y0;
k = 5;

for i = 1 : n 
    
   x( i + 1 ) = a + i*h;
   w = sym( 'w' );
   g = @( z ) -z + y( i ) + h*( f( x( i ), y( i ) ) + f( x( i + 1 ), z ) )/2;
   gs = g( w );
   dgs = diff( gs );
   dg = @( z ) double( subs( dgs, z ) );
   z0 = y( i ) + h*f( x( i ), y( i ) );
   y( i + 1 ) = odj_newton( g, dg, z0, k );
   
end
    