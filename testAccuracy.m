function [accuracy] = testAccuracy(centroids, ldamodel, svmmdl, data, labels)
    [dataNum, ~] = size(data);
    patches = image2Patches(labels);
    freq_mat = patchFitToCluster(centroids, patches, 169);
    [~, test_mixture] = predict(ldamodel, freq_mat);
    pred = predict(svmmdl, test_mixture) - 1;
    accuracy = (sum(pred == testlabels)) / dataNum;
end

