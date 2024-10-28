function y = signal(N,x)
if cos(x)== 1
    y = N^2;
else
    y = (1-cos(N*x))./(1-cos(x));
end
end