m = 150;
hs = 11.85/( m - 1 );
for i = 1 : m
    s( i ) = -5.925 + ( i - 1 )*hs;
end

n = 121;
ht = 6/( n - 1 );
for j = 1 : n
    t( j ) = -3 + ( j - 1 )*ht;
end

%egzaktno rjesenje x
x = zeros( n, 1 );
for j = 1 : n
    x( j ) = 1 + cos( pi*t( j )/3 );
end

%jezgra operatora
k = zeros( m, n );
for i = 1 : m
    for j = 1 : n
        if abs( t( j ) - s( i ) ) <= 3
            k( i, j ) = ( 1 + cos( pi*( t( j ) - s( i ) )/3 ) )/6;
        else
            k( i, j ) = 0;
        end
    end
end

%matrica K dimenzije m*n
K = zeros( m, n );
for i = 1 : m
    for j = 1 : n
        if j == 1 || j == n
            K( i, j ) = 3*k( i, j )/( n - 1 );
        else
            K( i ,j ) = 6*k( i, j )/( n - 1 );
        end
    end
end

%definiramo y = Kx
y = K*x;

%definiramo greske
for i = 1 : m
    zeta( i ) = ( 1e-4 )*y( i );
end
S = diag( zeta );

%definiramo A i b
eta = randn( m, 1 );
A = S\K;
b = S\y + eta;

fprintf( 'Uvjetovanost matrice A je: %e\n\n', cond( A ) );

%rjesavamo problem najmanjih kvadrata za Ax - b koristeci SVD
[ U, sigma, V ] = svd( A );
rj = V*( sigma\( U'*b ) );
fprintf( 'Norma reziduala iznosi: %f\n', norm( A*rj - b ) );
fprintf( 'Greska: %f\n', norm( rj - x ) );

%rjesavamo problem najmanjih kvadrata za Ax - b koristeci QR
% [ Q, R ] = qr( A );
% rj = R\( Q'*b );
% fprintf( 'Norma reziduala iznosi: %f\n', norm( A*rj - b ) );
% fprintf( 'Greska: %f\n', norm( rj - x ) );

%crtamo egzaktno i dobiveno rjesenje
figure( 1 )
hold on;
plot( t, x, 'g', 'LineWidth', 2 );
plot( t, rj, 'r', 'LineWidth', 2 );
legend( 'egzaktno', 'izracunato' );

%sada ukljucujemo regularizaciju
fprintf( '\n\n REGULARIZACIJA \n\n' );

x0 = zeros( n, 1 );
for j = 1 : n
    x0( j ) = y( j );
end

%optimalni lambda
lambda = 0.748;
A1 = [ A; lambda*eye( n ) ];
b1 = [ b; lambda*x0 ];

%rjesavamo problem najmanjih kvadrata za Ax - b koristeci SVD
[ U, sigma, V ] = svd( A1 );
rj = V*( sigma\( U'*b1 ) );
fprintf( 'Norma reziduala iznosi: %f\n', norm( A*rj - b ) );
fprintf( 'Greska: %f\n', norm( rj - x ) );

%crtamo egzaktno i dobiveno rjesenje
figure( 2 )
hold on;
plot( t, x, 'g', 'LineWidth', 2 );
plot( t, rj, 'r', 'LineWidth', 2 );
legend( 'egzaktno', 'izracunato' );

%najbolji lambda
fprintf( '\n\n' );
lambda = 77.5;
A1 = [ A; lambda*eye( n ) ];
b1 = [ b; lambda*x0 ];

%rjesavamo problem najmanjih kvadrata za Ax - b koristeci SVD
[ U, sigma, V ] = svd( A1 );
rj = V*( sigma\( U'*b1 ) );
fprintf( 'Norma reziduala iznosi: %f\n', norm( A*rj - b ) );
fprintf( 'Greska: %f\n', norm( rj - x ) );

%crtamo egzaktno i dobiveno rjesenje
figure( 3 )
hold on;
plot( t, x, 'g', 'LineWidth', 2 );
plot( t, rj, 'r', 'LineWidth', 2 );
legend( 'egzaktno', 'izracunato' );






    
