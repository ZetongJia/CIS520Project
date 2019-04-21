clear
close all

k = 100;

idx = kmeans(featureMatrix,k,'Replicates',5);


idx_splitted = mat2cell(idx,1,shapeNum);

numPictures = size(idx_splitted);

for i = 1:numPictures
    segment_vector = idx_splitted{i};
    a = unique(segment_vector);
    out = [a,histc(segment_vector(:),a)];
end
