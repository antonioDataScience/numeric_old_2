function [ x, k, rez ] = sor( A, b, x0, tol, om )

n = max( size( A ) );

x = x0;

k = 1;

while 1
    
    for i = 1 : n
        x( i ) = ( 1 - om )*x( i ) + ( om/A( i, i ) )*( b( i ) - A( i, : )*x + A( i, i )*x( i ) );
    end

    rez( k ) = norm( b - A*x )/norm( b );
    
    if rez( k ) < tol
        break
    end
    
    k = k + 1;

end