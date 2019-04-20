function [counter] = shapeSegment(labels, image, startingIndex)
    segmentedLabels = zeros(32,32);
    shapeNum = 1;
    tracker = zeros(32, 32);
    for i=1:32
        for j=1:32
            if tracker(i,j) == 0
                currlabel = labels(i,j);
                Q = zeros(32*32, 2);
                Q(1,:) = [i,j];
                pointer = 1;
                endPointer = 2;
                while Q(pointer,1) ~= 0
                    currI = Q(pointer,1);
                    currJ = Q(pointer,2);
                    if tracker(currI,currJ) ~= 2
                        tracker(currI,currJ) = 2;
                        segmentedLabels(currI,currJ) = shapeNum;
                        neighbors = getNeighbors(currI,currJ);
                        for k=1:4
                            nI = neighbors(k,1);
                            nJ = neighbors(k,2);
                            if nI ~= 0 && labels(nI,nJ) == currlabel && tracker(nI,nJ) == 0
                                Q(endPointer,:) = neighbors(k,:);
                                tracker(nI,nJ) = 1;
                                endPointer = endPointer + 1;
                            end
                        end
                    end
                    pointer = pointer + 1;
                end
                shapeNum = shapeNum + 1;
            end
        end
    end
    widthCount = zeros(shapeNum, 1);
    heightCount = zeros(shapeNum, 1);
    for i=1:32
        appearedRow = zeros(shapeNum,1);
        appearedCol = zeros(shapeNum,1);
        for j=1:32
            currLabelRow = segmentedLabels(i,j);
            currLabelCol = segmentedLabels(j,i);
            if appearedRow(currLabelRow) == 0
                heightCount(segmentedLabels(i,j)) = heightCount(segmentedLabels(i,j)) + 1;
                appearedRow(currLabelRow) = 1;
            end
            if appearedCol(currLabelCol) == 0
                widthCount(segmentedLabels(j,i)) = widthCount(segmentedLabels(j,i)) + 1;
                appearedCol(currLabelCol) = 1;
            end
        end
    end
    toClear = zeros(shapeNum, 1);
    for k = 1:shapeNum
        if heightCount(k) < 2 || widthCount(k) < 2
            toClear(k) = 1;
        end
    end
    
    for i=1:32
        for j=1:32
            if toClear(segmentedLabels(i,j)) == 1
                segmentedLabels(i,j) = 0;
            end
        end
    end
    
    counter = 1;
    folder = 'D:\CIS520\Project\segmentedImage';
    for k=1:shapeNum
        if toClear(k) == 1
            continue;
        end
        newImage = uint8(zeros(224, 224, 3));
        startI = 1;
        for i=1:32
            startJ = 1;
            for j=1:32
                if segmentedLabels(i,j) == k
                    for p=1:7
                        for q=1:7
                            newImage(startI + p - 1, startJ + q - 1,1) = image(i,j,1);
                            newImage(startI + p - 1, startJ + q - 1,2) = image(i,j,2);
                            newImage(startI + p - 1, startJ + q - 1,3) = image(i,j,3);
                        end
                    end
                else
                    for p=1:7
                        for q=1:7
                            newImage(startI + p - 1, startJ + q - 1,1) = 0;
                            newImage(startI + p - 1, startJ + q - 1,2) = 0;
                            newImage(startI + p - 1, startJ + q - 1,3) = 0;
                        end
                    end
                end
                startJ = startJ + 7;
            end
            startI = startI + 7;
        end
        filename = strcat(num2str(startingIndex + counter - 1), ".jpg");
        imwrite(newImage, fullfile(folder,filename));
        counter = counter + 1;
    end
    counter = counter - 1;
    return;
end

