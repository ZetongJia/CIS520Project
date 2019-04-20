k=5;
shapeNum = zeros(1,100);

startingIndex = 1;
for i=1:100
    disp(i);
    A = imageVec2Mat(data(i,:));
    lab_A = rgb2lab(A);
    ab = lab_A(:,:,2:3);
    ab = im2single(ab);
    [labels, centers] = imsegkmeans(ab,k,'NumAttempts',3);
    shapeNum(i) = shapeSegmentNonAugment(labels, A, startingIndex);
    startingIndex = startingIndex + shapeNum(i);
end

%segmented = uint8(zeros(32,32,3));
%for i=1:32
%    for j=1:32
%        segmented(i,j,1) = labels(i,j)*10;
%       segmented(i,j,2) = labels(i,j)*10;
%       segmented(i,j,3) = labels(i,j)*10;
%    end
%end
%image(segmented);