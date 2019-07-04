function f = grab_plijen_funkcija( t, p )

a1 = 2;
d1 = 0.02;
a2 = 0.0002;
d2 = 0.8;

f = [ a1*p( 1 ) - d1*p( 1 )*p( 2 ); a2*p( 1 )*p( 2 ) - d2*p( 2 ) ];




