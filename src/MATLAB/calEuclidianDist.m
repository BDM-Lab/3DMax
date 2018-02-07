function [ output ] = calEuclidianDist( x1,y1,z1,x2,y2,z2 )
% calEuclidianDist = square euclidean distance of 

output = (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2) + (z1 - z2) * (z1 - z2);
output = sqrt(output);
end

