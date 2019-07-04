function z = odj_newton( f, df, z0, k )

for i = 1 : k
    
    z = z0 - f( z0 )/df( z0 );
    z0 = z;
    
end
