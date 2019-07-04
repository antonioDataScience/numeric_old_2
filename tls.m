load model_dekonvolucija_uy
load model_dekonvolucija_hh

m = 102;
n = 18;
k = 1;

%generiranje vektora y
y = zeros( m + 1, 1 );
for i = 1 : m + 1 
    y( i ) = yp( i );
end

%generiranje matrice U
for i = 1 : m + 1
    for j = 1 : n + 1
        U( i, j ) = up( n + 1 - j + i );
        k = k + 1;
    end
end

C = [ U, y ];

S1 = svd( U );
[ U2, S2, V2 ] = svd( C );

if S1( n ) > S2( n + 1 )
    fprintf( 'OK\n' );
end

h = -V2( 1 : n + 1, n + 2 )/V2( n + 2, n + 2 ); 

hold on;
plot( h, 'g', 'LineWidth', 2 );
plot( hh, 'r', 'LineWidth', 2 );
legend( 'izracunato', 'egzaktno' );
hold off;



