function [ x, y, i ] = odj_rk23( f, a, b, y0, tol )

p = 2;
x( 1 ) = a;
y( 1 ) = y0;

c1 = 0; c2 = 1/4; c3 = 27/40; c4 = 1;
a21 = 1/4; a31 = -189/800; a32 = 729/800; a41 = 214/891; a42 = 1/33; a43 = 650/891;
w1= 214/891; w2 = 1/33; w3 = 650/891;
W1 = 533/2106; W2 = 0; W3 = 800/1053; W4 = -1/78; 

k1 = @( x, y, h ) f( x, y );
k2 = @( x, y, h ) f( x + c2*h, y + h*a21*k1( x, y, h ) );
k3 = @( x, y, h ) f( x + c3*h, y + h*( a31*k1( x, y, h ) + a32*k2( x, y, h ) ) );
k4 = @( x, y, h ) f( x + c4*h, y + h*( a41*k1( x, y, h ) + a42*k2( x, y, h ) + a43*k3( x, y, h ) ) );

fi = @( x, y, h ) w1*k1( x, y, h ) + w2*k2( x, y, h ) + w3*k3( x, y, h );
FI = @( x, y, h ) W1*k1( x, y, h ) + W2*k2( x, y, h ) + W3*k3( x, y, h ) + W4*k4( x, y, h );

i = 1;
while x( i ) < b
    
    if i == 1
        h( i ) = b - a;
    else
        h( i ) = 0.9*h( i - 1 )*( ( tol/ abs( y( i ) - Y( i ) ) )^( 1/( p + 1 ) ) );
    end
    
    if x( i ) + h( i ) > b
        h( i ) = b - x( i );
    end
   
    y( i + 1 ) = y( i ) + h( i )*fi( x( i ), y( i ), h( i ) );
    Y( i + 1 ) = y( i ) + h( i )*FI( x( i ), y( i ), h( i ) );
    
    while( abs( Y( i + 1 ) - y( i + 1 ) ) > tol )
        
            h( i ) = 0.9*h( i )*( ( tol/ abs( y( i + 1 ) - Y( i + 1 ) ) )^( 1/( p + 1 ) ) );
            
            if x( i ) + h( i ) > b
                h( i ) = b - x( i );
            end

            y( i + 1 ) = y( i ) + h( i )*fi( x( i ), y( i ), h( i ) );
            Y( i + 1 ) = y( i ) + h( i )*FI( x( i ), y( i ), h( i ) );
  
    end
    
    %fprintf( 'h = %e\n', h( i ) );
    
    x( i + 1 ) = x( i ) + h( i );
    
    i = i + 1;
    
end
    
    
    