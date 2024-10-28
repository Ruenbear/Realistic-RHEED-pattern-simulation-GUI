function rheedSimuDisorder(Sys,Exp,Opt,ax)
if nargin == 3
    figure;
    ax = axes;
end
if nargin == 2
    Opt.PixelSize = 0.05;
    Opt.ColorMap = 37;
    Opt.ScreenSize = [6,6]; %cm (Width,Height)
    Opt.Gain = 6;
    Opt.Treshold = 0;
end

ps = Opt.PixelSize; %cm per pixel(Width,Height)
ss = Opt.ScreenSize; %cm (Width,Height)
clrmp = Opt.ColorMap;
gain = Opt.Gain;
thd = Opt.Treshold;

dist = Exp.Distance; %cm
volt = Exp.Voltage*1e3; %kV
tilt = Exp.Tilt; %deg
phi = Exp.Phi; %deg

lc = Sys.LatticeConstant*1e-10;
anum = Sys.UnitNum; 
vec = Sys.Vectors;
% use cell, Including 3 arrays
% {inplaneVec1,inplaneVec2,OutOfPlaneVec}

Rot = rotvec2mat3d([0,0,1]*phi);

for i = 1:3
    vec{i} = vec{i}/norm(vec{i});
    vec{i} = (Rot*vec{i}')';
end

k0 = kvalue(volt);

rangey = -ss(1)/2:ps(1):ss(1)/2;
rangez = 0:ps(2):ss(2);
sizey = length(rangey);
sizez = length(rangez);
SCREEN = zeros(sizey,sizez);

yi = 0;
for y = rangey
    yi = yi + 1;
    zi = 0;
    for z = rangez
        zi = zi + 1;
        K = getK(y,z,k0,tilt,dist);
        SCREEN(yi,zi) ...
            = intensity(K, ...
                lc(1)*vec{1},lc(2)*vec{2},lc(3)*vec{3}, ...
                anum(1),anum(2),anum(3));
    end
end

MM = mean(max(SCREEN));
mm = mean(min(SCREEN));
SCREEN = (rot90(SCREEN,3)-mm)/(MM-mm);


image(ax,(SCREEN-thd)*exp(gain));
ax.DataAspectRatio = [ss(2),ss(1),3];
ax.XLim = [1,sizey];
ax.YLim = [1,sizez];
ax.Box = 'On';
ax.FontSize = 13;

xlabel('Width (cm)');
ylabel('Height (cm)');

tt = "Tilt = _1_, Phi = _2_ (deg)";
tt = replace(tt,'_1_',num2str(tilt));
tt = replace(tt,'_2_',num2str(phi));
title(tt)

colormap(ax,slanCM(clrmp));
colorbar(ax)


end