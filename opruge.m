m = [ 2; 5; 3; 6 ];
M = diag( sqrt( m ) );
K = [ 24 -9 -5 0; -9 22 -8 -5; -5 -8 25 -7; 0 -5 -7 18 ];
A = M\K/M;
I = eye( 4 );

x0 = rand( 4, 1 );
x = x0/norm( x0 );
ro = x'*A*x;

tol = 1e-8;
maxit = 4;

k = 1;
rez( k ) = norm( A*x - ro*x );

while rez( k ) > tol
    
    %metoda inverznih iteracija
    %prvo rjesavamo sustav ( A - 4*I )y = x
    y = minres( A - 4*I, x, tol, maxit );
    x = y/norm( y );
    ro = x'*A*x;
     
    if x( 1 ) > 0
        x = - x;
    end
 
    plot( x, '-*', 'LineWidth', 2, 'MarkerSize', 10 );
    axis( [ 0.5 4.5 -1 1 ] );
    xlabel( 'Indeks komponente' );
    ylabel( 'Komponenta' );
    title( [ 'Aproksimacija sv.vekt. : iteracija br. ', int2str( k ) ] );
    grid on;
    pause( 0.5 );
    
    k = k + 1;
    rez( k ) = norm( A*x - ro*x );
    
    
end

semilogy( 1 : k, rez( 1 : k ) )


    