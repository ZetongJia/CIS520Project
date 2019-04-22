clear
close all

k = 30;

idx = kmeans(featureMatrix,k,'Replicates',5);


idx_splitted = num2cell(idx,1);

numPictures = size(idx_splitted);

% freq_mat = cell(1, numPictures);
freq_mat = zeros(k, numPictures);

for i = 1:numPictures
    segment_vector = idx_splitted{i};
    a = unique(segment_vector);
    out = [a,histc(segment_vector(:),a)];
    freq_mat(out(:,1),i) = out(:,2);
end
