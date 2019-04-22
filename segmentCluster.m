clear
close all

k = 30;

%each row of frequencyMatrix is a segment, each column represents a feature
%variable
idx = kmeans(frequencyMatrix,k,'Replicates',5);

%shapeNum is the information about how many segments each image have [1*x dim]
idx_splitted = mat2cell(idx',1, shapeNum);

[~, numPictures] = size(shapeNum);
 
freq_mat = zeros(k, numPictures);

for i = 1:numPictures
    segment_vector = idx_splitted{i};
    a = unique(segment_vector');
    out = [a,histc(segment_vector(:),a)];
    freq_mat(out(:,1),i) = out(:,2);
end
