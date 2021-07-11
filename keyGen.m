function [key] = keyGen(n,user_key)
user_key = double(user_key);
key = zeros(n,1,'uint8');
for ind = 1 : n
    ind_user_key = mod(ind,size(user_key,2)) + 1;
    key(ind) = mod(bitxor(mod((mod(bitxor((ind.^2),user_key(ind_user_key)),256)).^2,256),ind),256);
end;