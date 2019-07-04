function kredit( k )

load model_kredit_A

n = max( size( A ) );

u = zeros( n, 1 );
u( 1 ) = 1;

for i = 1 : k
    
    u = A*u;
    plot( u, '-*', 'LineWidth', 2, 'MarkerSize', 10 );
    axis( [ 0.5 8.5 0 1 ] );
    xlabel( 'Stanje' );
    ylabel( 'Gustoca' );
    title( [ 'Iteracija br. ', int2str( i ) ] );
    set( gca, 'XTick', 1 : 8 );
    set( gca, 'XTickLabel', { 'AAA', 'AA', 'A', 'BBB', 'BB', 'B', 'CCC', 'D' } );
    grid on
    pause( 0.05 )
   
    
end

[ V, D ] = eig( A );
