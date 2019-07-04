load model_gravitacija_g

m = 15;
hs = 1/( m - 1 );
s = 0 : hs : 1;

n = 15;
ht = 1/( n - 1 );
t = 0 : ht : 1;

d = 0.25;

%egzaktno rjesenje
f = zeros( n, 1 );
for j = 1 : n
    f( j ) = sin( pi*t( j ) ) + 0.5*sin( 2*pi*t( j ) );
end

%jezgra operatora
k = zeros( m, n );
for i = 1 : m
    for j = 1 : n
        k( i, j ) = d/( d^2 + ( s( i ) - t( j ) )^2 )^( 3/2 );
    end
end

K = zeros( m, n );
for i = 1 : m
    for j = 1 : n
        if j == 1 || j == n
            K( i, j ) = k( i, j )/( 2*( n - 1 ) );
        else
            K( i ,j ) = k( i, j )/( n - 1 );
        end
    end
end

fprintf( 'Uvjetovanost matrice K : %e\n\n', cond( K ) );

%vektor gresaka
ksi = 0.1*ones( m, 1 );

g = g - ksi;

%rjesavamo problem f = K\g
[ U, S, V ] = svd( K );
figure( 1 )
plot( diag( S ), 'o' );

for p = 1 : 15
    figure( 2 )
    hold on;
    plot( t, f, 'g', 'LineWidth', 2 );
    %rjesenje pomocu krnjeg SVD-a
    rj = V( :, 1 : p )*( S( 1 : p, 1 : p )\( U( :, 1 : p )'*g ) );
    plot( t, rj, 'r', 'LineWidth', 2 );
    legend( 'ezgaktno', 'izracunato' )
    title( [ 'Rang =  ', int2str( p ) ] );
    pause( 0.5 )
    hold off;
    clf
end

    
    

