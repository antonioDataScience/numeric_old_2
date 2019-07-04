function [ omega, ro ] = sor_konvergencija( A )

n = max( size( A ) );

D = diag( diag( A ) );
L = tril( A, -1 ); %strogo donji trokut od A
U = triu( A, 1 ); %strogo gornji trokut od A


k = 1;
for pom = 0 : 0.01 : 2
    
    T = ( D + pom*L ) \ ( ( 1 - pom )*D - pom*U );
    spr = max( abs( eig ( T ) ) );
    
    omega( k ) = pom;
    ro( k ) = spr;
    
    k = k + 1;
    
end

figure( 1 )
plot( omega, ro, 'm' );
xlabel( 'omega' );
ylabel( 'ro' );
axis( [ 0 2 0 1 ] );