A = gallery( 'poisson', 19 );
n = max( size( A ) );%n = 361

%desna strana sustava
b = zeros( n, 1 );
%izvor topline je u sredisnjoj tocki
b( ( n - 1 )/2, 1 ) = 10000;

h = 0.05;
tol = 1e-8;
maxit = n;
u0 = zeros( n, 1 );

%rjesenje sustava bez prekondicioniranja
[ u1, flag1, relres1, iter1, resvec1 ] = pcg( A, b*h*h, tol, maxit, [], [], u0 );

%rjesenje sustava s prekondicioniranjem
R = cholinc( A, '0' );
%M = R'*R je matrica prekondicioniranja
[ u2, flag2, relres2, iter2, resvec2 ] = pcg( A, b*h*h, tol, maxit, R', R, u0 );

k1 = condest( A );
fprintf( 'Broj uvjetovanosti matrice A je: %f\n', k1 );
k2 = condest( inv( R')*A*inv( R ) );
fprintf( 'Broj uvjetovanosti prekondicionirane matrice je: %f\n', k2 );

figure( 1 )
semilogy( 0 : iter1, resvec1/norm( b ), 'c', 0 : iter2, resvec2/norm( b ), 'g' );
legend( 'bez prekondicioniranja', 's prekondicioniranjem' );

fprintf( 'Broj iteracija prvog sustava je: %d\n', iter1 );
fprintf( 'Broj iteracija prekondicioniranog sustava je: %d\n', iter2 );

[ X, Y ] = meshgrid( 0 : h : 1, 0 : h : 1 );
%vektor rjesenja prebacimo u matricu
U = zeros( 21 );
U( 2 : 20, 2 : 20 ) = vec2mat( u1, sqrt( n ) );

figure( 2 )
surf( X, Y, U )
xlabel( 'x' )
ylabel( 'y' )
zlabel( 'u(x,y))' )
