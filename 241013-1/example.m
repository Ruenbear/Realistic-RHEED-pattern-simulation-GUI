Sys.LatticeConstant = [3.8,3.8,4];
Sys.UnitNum = [10,10,2]; 
Sys.Vectors = {[3/2,sqrt(3)/2,0],[0,sqrt(3),0],[1,1,1]};

Exp.Distance = 20; %cm
Exp.Voltage = 15; %kV
Exp.Tilt = 1; %deg
Exp.Phi = 0; %deg

Opt.PixelSize = [0.02,0.02];
Opt.ScreenSize = [6,6]; %cm (Width,Height)
Opt.ColorMap = 37;
Opt.Gain = 5.5;
Opt.Treshold = 0.1;
Opt.ShowImage = true;

clf
figure(1);
ax = axes;
rheedSimu(Sys,Exp,Opt,ax);