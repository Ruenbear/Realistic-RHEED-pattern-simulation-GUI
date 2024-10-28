function [I,I1,I2,I3] = intensity(K,a1,a2,a3,N1,N2,N3)
x1 = dot(K,a1);
x2 = dot(K,a2);
x3 = dot(K,a3);
I1 = signal(N1,x1);
I2 = signal(N2,x2);
I3 = signal(N3,x3);
I = I1*I2*I3/((N1*N2*N3)^2);
end