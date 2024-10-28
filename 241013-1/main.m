distance = 20;
voltage = 15e3;
tilt = 2;
%a1 = [1,0,0]*3.8E-10;
%a2 = [1/2,sqrt(3)/2,0]*3.8E-10;

a1 = [3/2,sqrt(3)/2,0]*3.8E-10;
a2 = [0,sqrt(3),0]*3.8E-10;

a3 = [1,1,1]*1e-15;
N1 = 50;
N2 = 50;
N3 = 1;
k0 = kvalue(voltage);

rangey = -3:0.002:3;
rangez = 0:0.002:6;
sizey = length(rangey);
sizez = length(rangez);
SCREEN = zeros(sizey,sizez);
yi = 0;
zi = 0;

for y = rangey
    yi = yi + 1;
    zi = 0;
    for z = rangez
        zi = zi + 1;
        K = getK(y,z,k0,tilt,distance);
        SCREEN(yi,zi) = intensity(K,a1,a2,a3,N1,N2,N3);
    end
end
imshow(rot90(SCREEN,3))
%plot(SCREEN(499,:))
