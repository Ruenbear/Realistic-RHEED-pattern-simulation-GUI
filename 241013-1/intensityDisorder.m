function II = intensityDisorder(K,S)
mc = size(S);
su = 0;
for j = 1:mc(1)
    KdR = dot(K,S(j,:));
    eKdR = exp(1i*KdR);
    su = su + eKdR;
end
II = 
end