function [patches] = image2Patches(data)
    [m,~] = size(data);
    patches = zeros(13* 13 * m, 64);
    counter = 1;
    for i=1:m
        disp(strcat('Breaking down image ', num2str(i)));
        grayscale = rgb2gray(imageVec2Mat(data(i,:)));
        startingX = 1;
        for x=1:13
            startingY = 1;
            for y=1:13
                localMat = grayscale(startingY:(startingY+7), startingX:(startingX+7));
                startingInd = 1;
                for row = 1:8
                    patches(counter, startingInd:(startingInd + 7)) = localMat(row, :);
                    startingInd = startingInd + 8;
                end
                counter = counter + 1;
                startingY = startingY + 2;
            end
            startingX = startingX + 2;
        end
    end
    return;
end

