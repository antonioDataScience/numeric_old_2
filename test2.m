function[ wmin1, wmp1 ] = test2() 

load( 'model_portfelj_Cm.mat' );
n = max( size( C ) );

%prvo rjesavamo sustav Cx = e pomocu SOR metode
e = ones( n, 1 );

%izracunajmo optimalni parametar omega
[ omega, ro ] = sor_konvergencija( C );
om = 1.2;

x0 = zeros( n, 1 );
tol = 1e-8;

[ x1, k1, rez1 ] = sor( C, e, x0, tol, om );

%racunamo omega_min
wmin1 = x1/( e'*x1 );

%sada rjesavamo sustav Cx = e pomocu pcg
[ x2, flag, resnorm, k2, rez2 ] = pcg( C, e, tol );

%opet racunamo mi_min
wmin2 = x2/( e'*x2 );

%crtamo reziduale
figure( 2 )
semilogy( 1:k1, rez1, 'g', 0:k2, rez2/norm( e ), 'r' );
legend( 'SOR', 'pcg' );

mp = 0.05;

%rjesavamo sustav Cx = m pomocu SOR metode
[ x3, k3, rez3 ] = sor( C, m, x0, tol, om );

%racunamo omega_mi_p
wmp1 = ( ( m'*x3 - mp*(e'*x3) )*x1 + ( mp*(e'*x1) - e'*x3 )*x3 )/( (e'*x1)*(m'*x3) - (e'*x3)*(e'*x3) );

%sada rjesavamo sustav Cx = m pomocu pcg
[ x4, flag, resnorm, k4, rez4 ] = pcg( C, m, tol );

%opet racunamo omega_mi_p
wmp2 = ( ( m'*x4 - mp*(e'*x4) )*x2 + ( mp*(e'*x2) - e'*x4 )*x4 )/( (e'*x2)*(m'*x4) - (e'*x4)*(e'*x4) );

%crtamo reziduale
figure( 3 )
semilogy( 1:k3, rez3, 'g', 0:k4, rez4/norm( m ), 'r' );
legend( 'SOR', 'pcg' );



