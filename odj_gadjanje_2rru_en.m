function [ x, y, s, k ] = odj_gadjanje_2rru_en( f, a, b, alfa, beta, s0, n )

max = 1000;
tol = 1e-14;
s = s0;
k = 1;

while k < max
    
    y0 = [ alfa; s0; 0; 1 ]; 

    [ x, y ] = odj_rk4v( f, a, b, y0, n ); 
    
    F = y( 1, n + 1 ) - beta;
    
    if abs( F ) < tol
        break
    end
  
    DF = y( 3, n + 1 );
  
    s = s0 - F/DF;
    
    s0 = s;
    
    k = k + 1;
end

