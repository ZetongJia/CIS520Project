function [freq_mat, centroids] = patchCluster(k,fvec, imgPatchNum)

    %each row of frequencyMatrix is a segment, each column represents a feature
    %variable
    options = statset('UseParallel',0);
    [idx, centroids] = kmeans(fvec,k,'Replicates', 1, 'Options', options, 'Display', 'iter', 'MaxIter', 1000);

    %shapeNum is the information about how many segments each image have [1*x dim]

    [p, ~] = size(fvec);
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