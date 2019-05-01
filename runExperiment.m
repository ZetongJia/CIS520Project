kvec = [200, 300, 400, 500, 600, 700, 800, 900, 1000];
tvec = [25, 50, 100, 150, 200, 250, 300];
load('data5.mat');
load('data1.mat');
load('labels1.mat');
load('labels5.mat');

train_data = data5(1:5000, :);
test_data = data5(5001:10000, :);
%train_shapeNum = shapeNum3;
%test_shapeNum = shapeNum2;
testlabels = labels5(5001:10000);
trainlabels = labels5(1:5000);

centroids = cell(9);
ldamodels = cell(9,7);
result = zeros(9,7);

template = templateSVM('kernelfunction', 'polynomial');

train_feat_vec = image2Patches(train_data);
test_feat_vec = image2Patches(test_data);
for k=1:9
    [train_freq_mat, centroids] = patchCluster(kvec(k), train_feat_vec, 13*13);
    test_freq_mat = patchFitToCluster(centroids, test_feat_vec, 13*13);
    for t=1:7
        [train_mixture, ldamodel] = getldaMixture(train_freq_mat, tvec(t));
        [~, test_mixture] = predict(ldamodel, test_freq_mat);
        svmmodel = fitcecoc(train_mixture, double(trainlabels+1), 'Learners', template);
        pred = predict(svmmodel, test_mixture) - 1;
        result(k,t) = sum(pred == testlabels);
    end
end