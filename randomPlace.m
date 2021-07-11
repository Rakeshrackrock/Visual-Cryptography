function [s] = randomPlace(n,recons)
    a = randperm(n);
    s = a(1:recons);
return;