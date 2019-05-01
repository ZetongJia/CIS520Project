function [freq_mat, centroids, shapeClusterIdx] = segmentCluster(k,fvec, shapeNum)

    %each row of frequencyMatrix is a segment, each column represents a feature
    %variable
    [idx, centroids] = kmeans(fvec,k,'Replicates',1, 'Display', 'iter', 'MaxIter', 100000);
    
    shapeClusterIdx = idx;

    %shapeNum is the information about how many segments each image have [1*x dim]
    idx_splitted = mat2cell(idx',1, shapeNum);

    [~, numPictures] = size(shapeNum);

    freq_mat = zeros(numPictures, k);

    for i = 1:numPictures
        segment_vector = idx_splitted{i};
        a = unique(segment_vector');
        out = [a'; histc(segment_vector,a)];
        freq_mat(i,out(1,:)) = out(2,:);
    end
    return;
end
