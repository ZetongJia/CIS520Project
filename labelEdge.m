function [result] = labelEdge(imageMat, threshold)
    result = imageMat;
    for i=1:31
        for j=1:32
            diff = 0;
            for c=1:3
                diff = diff + abs(imageMat(i,j,c)-imageMat(i+1,j,c));
            end
            if diff > threshold
                result(i,j,1) = 255;
                result(i,j,2) = 0;
                result(i,j,3) = 0;
            end
        end
    end
    image(result);
    return;
end

