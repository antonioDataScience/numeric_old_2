function [ x, y ] = odj_pred_kor( f, a, b, y0, n, m )

h = ( b - a )/n;

%koeficijenti 4-koracne AB metode
b0 = 55/ 24; b1 = -59/24; b2 = 37/24; b3 = -9/24;

%koeficijenti 3-koracne AM metode
c0 = 9/24; c1 = 19/24; c2 = -5/24; c3 = 1/24;

%racunamo y1, y2, y3 pomocu RK4
[ x, y ] = odj_rk4( f, a, a + 3*h, y0, 3 );

pom = f( x, y );

x = ( a : h : b )';

ynew = y;

for i = 4 : n
    
    %Adams-Bashfort reda 4 
    ynew( 1 ) = y( i ) + h*( b0*pom( i ) + b1*pom( i - 1 ) + b2*pom( i - 2 ) + b3*pom( i - 3 ) );
     
    for k = 1 : m
        
        %Adams-Moulton reda 3
        ynew( k + 1 ) = y( i ) + h*( c0*f( x( i + 1 ), ynew( k ) ) + c1*pom( i ) + c2*pom( i - 1 ) + c3*pom( i - 2 ) );
        
    end 
    
    y( i + 1 ) = ynew( k + 1 );
    
    pom( i + 1 ) = f( x( i + 1 ), y( i + 1 ) );  
    
end
    
    