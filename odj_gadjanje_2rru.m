function [ x1, y1, s, k ] = odj_gadjanje_2rru( f, a, b, alfa, beta, s0, n )

max = 1000;
tol = 1e-14;
s = s0;
k = 1;

while k < max

    y01 = [ alfa; s0 ]; 

    [ x1, y1 ] = odj_rk4v( f, a, b, y01, n ); 
    
    y02 = [ alfa; s0 + 1e5*sqrt( eps )*s0 ];
    
    [ ~, y2 ] = odj_rk4v( f, a, b, y02, n ); 

    F = y1( 1, n + 1 ) - beta;
    
    if abs( F ) < tol
        break
    end
  
    DF = ( y2( 1, n + 1 ) - y1( 1, n + 1 ) )/1e5/sqrt( eps )/s0;
  
    s = s0 - F/DF;
    
    s0 = s;
    
    k = k + 1;
    
end




   
    
    


