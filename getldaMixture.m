function [mixtures, model] = getldaMixture(freq_mat, topicNum)
    model = fitlda(freq_mat, topicNum);
    mixtures = model.DocumentTopicProbabilities;
    return;
end