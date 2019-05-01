temp = templateSVM('kernelfunction', 'polynomial');
svmmdl = fitcecoc(topicMixtures, double(labels + 1), 'Learners', temp);
pred = predict(svmmdl, topicMixtures);
pred = pred - 1;
sum(pred == labels);