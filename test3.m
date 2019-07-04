n = 7;
b = [ 0; 0; -20; -20; -20; 10; 0 ];
x0 = ones( n, 1 );
restart = n;
tol = 1e-8;
maxit = n;

[ x, flag, relres, iter, resvec ] = gmres( @mdAx, b, restart, tol, maxit, [], [], x0 );

rez = [ resvec/norm( b ); relres ];

plot( 0:iter( 2 ), rez, 'g' );

