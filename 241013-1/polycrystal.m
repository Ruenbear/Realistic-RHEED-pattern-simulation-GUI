clc
Sys.LatticeConstant = [4.4,4.4,4.4];
Sys.UnitNum = [10,10,1];
%Sys.Vectors = {[3/2,sqrt(3)/2,0],[0,sqrt(3),0],[1,1,1]};
Sys.Vectors = {[1,0,0],[0,1,0],[0,0,1]};
Exp.Distance = 20;
Exp.Voltage = 15;
Exp.Tilt = 1;
Exp.Phi = [0,0,0];
Opt.PixelSize = [0.03,0.03];
Opt.ColorMap = 37;
Opt.ScreenSize = [7,6]; %cm (Width,Height)
Opt.Gain = 6;
Opt.Treshold = 0;
Opt.ShowImage = false;
[s,DAR] = rheedSimu(Sys,Exp,Opt);
sz = size(s);
s = zeros(sz);
%%
for phi = 0:1:180
    Exp.Phi = phi;
    s = s + rheedSimu(Sys,Exp,Opt);
end

%%
for phi1 = 0:10:90
    for phi2 = 0:10:90
        for phi3 = 0:10:90
            Exp.Phi = [phi1,phi2,phi3];
        %       Exp.Tilt = tilt;
            s = s + rheedSimu(Sys,Exp,Opt);
        end
    end
end
%%
ax = axes;
sos = size(s);
CUT.cut = s*10;
CUT.xxl = [1,sos(2)];
CUT.yyl = [1,sos(1)];
fastimg(ax,CUT,40);
ax.YDir = "reverse";
%%
image(ax,s/max(max(s))*255*4);
ax.DataAspectRatio = DAR;

