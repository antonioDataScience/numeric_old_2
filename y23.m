function y = y23( x )

y( x <= pi ) = 1 - exp( -x( x <= pi ) );
y( x > pi ) = ( 1 - exp( - pi ) )*exp( -5*( x( x > pi ) - pi ) );

end