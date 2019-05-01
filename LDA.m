K = 100;
rng('default');
mdl = fitlda(freq_mat,K, 'DocumentsIn', 'columns');
topicMixtures = mdl.DocumentTopicProbabilities;
figure
bar(topicMixtures(1,:))
title("Document 1 Topic Probabilities")
xlabel("Topic Index")
ylabel("Probability")