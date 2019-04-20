function [] = rebuild(startIndex,endIndex)
    imageMat = uint8(zeros(32,32,3));
    checkMat = zeros(32,32);
    for i=startIndex:endIndex
        filename = strcat('segmentedImage/', num2str(i), '.png');
        segmentMat = imread(filename);
        image(segmentMat);
        for x=1:32
            for y=1:32
                if segmentMat(x,y, 1) > 0 || segmentMat(x,y, 2) > 0 || segmentMat(x,y, 3) > 0
                    if checkMat(x,y) == 1
                        disp("conflict");
                    else
                        imageMat(x,y,1) = segmentMat(x,y, 1);
                        imageMat(x,y,2) = segmentMat(x,y, 2);
                        imageMat(x,y,3) = segmentMat(x,y, 3);
                        checkMat(x,y) = 1;
                    end
                end
            end
        end
    end
    figure;
    image(imageMat);
end

