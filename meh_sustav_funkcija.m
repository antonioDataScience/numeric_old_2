function f = meh_sustav_funkcija( t, y )

a0 = 9.8;       %akceleracija gravitacije
z = 0.1;        %bezdimenzionalni koeficijent prigusivanja
w = 35;         %prirodna frekvencija

t0 = 0.3;

if t < t0
    f = [ y( 2 ); - 2*z*w*y( 2 ) - w*w*y( 1 ) ];
else
    f = [ y( 2 ); a0 - 2*z*w*y( 2 ) - w*w*y( 1 ) ];
end
