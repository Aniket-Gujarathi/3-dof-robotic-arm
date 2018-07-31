% translation matrix
function [T] = dist( d )    
        T = [1 0 0 d;
             0 1 0 0;
             0 0 1 0;
             0 0 0 1];
end