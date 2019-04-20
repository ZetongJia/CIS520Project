function [imageMat] = imageVec2Mat(imageVec)
    imageMat = uint8(zeros(32, 32, 3));
    for i=1:32
        for j=1:3
            startingIndex = (j-1)*1024+((i-1)*32+1);
            endingIndex = startingIndex + 31;
            imageMat(i,:,j) = imageVec(startingIndex:endingIndex);
        end
    end
    return;
end

