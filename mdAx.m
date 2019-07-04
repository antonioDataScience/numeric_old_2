function y = mdAx( x )
%Funkcija produkta matrice i vektora

y = [ 2*x( 1 ) - x( 5 ) + x( 6 );
      0.5*x( 2 ) - x( 6 ) + x( 7 );
      35*x( 3 ) - x( 5 );
      0.7*x( 4 ) - x( 6 );
      x( 5 ) - x( 7 );
      x( 1 ) + x( 3 );
      x( 1 ) - x( 2 ) - x( 4 ) ];
  
end 