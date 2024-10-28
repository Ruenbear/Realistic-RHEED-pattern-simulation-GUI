function k = kvalue(U)
ce = 1.6e-19;
energy = U*ce;
hbar = 1.05457266E-34;
mass = 9.11E-31;
k = sqrt(2*energy*mass)/hbar;
end