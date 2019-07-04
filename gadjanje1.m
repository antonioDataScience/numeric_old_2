function [] = gadjanje1( s0, n )

a = 0;
b = 1;
alfa = 4;
beta = 1;

f = @f_2rru;

[ x, y, s, k ] = odj_gadjanje_2rru( f, a, b, alfa, beta, s0, n );
fprintf( 'Newton aproksimacija\n' );
fprintf( 'Broj iteracija: %d\n', k ); 
fprintf( 'Nultocka: %f\n\n', s );

f = @f_2rru_en;

[ x1, y1, s1, k1 ] = odj_gadjanje_2rru_en( f, a, b, alfa, beta, s0, n );
fprintf( 'Newton egzaktno\n' );
fprintf( 'Broj iteracija: %d\n', k1 ); 
fprintf( 'Nultocka: %f\n\n', s1 );

subplot( 2, 1, 1 )
plot( x, y( 1, : ), 'g-*' )
title( 'Newton aproksimacija' )
subplot( 2, 1, 2 )
plot( x1, y1( 1, : ), 'r-*' )
title( 'Newton egzaktno' )