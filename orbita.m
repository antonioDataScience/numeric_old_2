load model_orbita_polozaji

x1 = p1( 1 );
y1 = p1( 2 );
x2 = p2( 1 );
y2 = p2( 2 );
x3 = p3( 1 );
y3 = p3( 2 );
x4 = p4( 1 );
y4 = p4( 2 );
x5 = p5( 1 );
y5 = p5( 2 );

A = [ x1*y1 y1*y1 x1 y1 1;
      x2*y2 y2*y2 x2 y2 1;
      x3*y3 y3*y3 x3 y3 1;
      x4*y4 y4*y4 x4 y4 1;
      x5*y5 y5*y5 x5 y5 1 ];

b = - [ x1*x1; x2*x2; x3*x3; x4*x4; x5*x5 ];

n = 5;
restart = 5;
tol = 1e-8;
maxit = 5;
x0 = zeros( n, 1 );

[ a, flag, relres, iter, resvec ] = gmres( A, b, restart, tol, maxit, [], [], x0 );

f = @( x, y ) x.^2 + a( 1 )*x.*y + a( 2 )*y.^2 + a( 3 )*x + a( 4 )*y + a( 5 );

x = -5 : 0.1 : 5;
y = x;
[ X, Y ] = meshgrid( x, y );
Z = f( X, Y );

figure( 1 )
contour( x, y, Z, [ 0 0 ] );
grid on

figure( 2 )
surf( X, Y, Z )
