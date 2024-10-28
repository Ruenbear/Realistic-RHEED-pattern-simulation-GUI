function K = getK(y,z,k0,tilt,D)
tilt = tilt/180*pi;
k0v = [k0*cos(tilt),0,k0*sin(tilt)];
kx = k0*D/sqrt(D^2+z^2+y^2);
K = [kx,y*kx/D,z*kx/D]-k0v;
end