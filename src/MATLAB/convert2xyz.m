%% convert to xyz
xyz  = [];
for i = 1:n
    xyz = [xyz;  variables(i*3-2) variables(i*3-1) variables(i*3)];    
end
