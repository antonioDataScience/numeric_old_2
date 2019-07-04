a = 1;
b = 210;
T0 = 294.15;
tol = 1e-3;

[ t, T, k ] = odj_rk23( @term_obrada_funkcija, a, b, T0, tol );

[ t1, T1 ] = odj_rk4( @term_obrada_funkcija, a, b, T0, k - 1 );

T = T - 273.15;
T1 = T1 - 273.15;

hold on;
plot( t, T, 'g-*', 'LineWidth', 2 );
plot( t1, T1, 'm-o', 'LineWidth', 2 );
xlabel( 'vrijeme u sekundama' )
ylabel( 'temperatura u stupnjevima' )
title( 'Termicka obrada sipke' )
legend( 'rk23', 'rk4' );
hold off;
