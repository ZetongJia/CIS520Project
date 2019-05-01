function [freq_mat] = fitToCluster(centroids, feature_vec, shapeNum)
    [m, ~] = size(feature_vec);
    [k, ~] = size(centroids);
    idx = zeros(m, 1);
    for i=1:m
        diff = centroids - feature_vec(i,:);
        norms = vecnorm(diff');
        [~, idx(i)] = min(norms);
    end
    
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

