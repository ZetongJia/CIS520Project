function [freq_mat] = patchFitToCluster(centroids, feature_vec, imgPatchNum)
    [m, ~] = size(feature_vec);
    [k, ~] = size(centroids);
    idx = zeros(m, 1);
    for i=1:m
        diff = centroids - feature_vec(i,:);
        norms = vecnorm(diff');
        [~, idx(i)] = min(norms);
    end
    
    [p, ~] = size(feature_vec);
    numPictures = p / imgPatchNum;

    freq_mat = zeros(numPictures, k);

    counter = 1;
    for i = 1:numPictures
        segment_vector = idx(counter:(counter+imgPatchNum-1))';
        disp(segment_vector);
        a = unique(segment_vector');
        out = [a'; histc(segment_vector,a)];
        disp(out);
        freq_mat(i,out(1,:)) = out(2,:);
        counter = counter + imgPatchNum;
    end
    return;
end

