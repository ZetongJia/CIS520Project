function [neighbors] = getNeighbors(i,j)
    neighbors = zeros(4,2);
    if i > 1
        neighbors(1,:) = [i-1, j];
    end
    if i < 32
        neighbors(2,:) = [i+1, j];
    end
    if j > 1
        neighbors(3,:) = [i, j-1];
    end
    if j < 32
        neighbors(4,:) = [i, j+1];
    end
end

