# Classification of Tiny Images with LDA Model

To tackle the problem of tiny image classification or image classification in general, convolutional neural network is usually used for the task. In this project, we propose an alternative approach by using the Latent Dirichlet Allocation model to classify images by analyzing the topics contained within each image and treating clusters of image segments as vocabulary. We are able to achieve a classification accuracy of $36\%$, which is significantly higher than the accuracy of using a pre-trained neural network for feature extraction and applying the same SVM classification algorithm.

##  Training 
### Set Up 
1. Download CIFAR-10 MATLAB version from http://www.cs.toronto.edu/~kriz/cifar.html. 
2. Open one batch in MATLAB. 
3. Do the following step by step. 

### Color Clustering 
1. Run colorClustering.m. 

### Sliding Window 
1.  

### CNN feature extraction 
1.  Run ShapeFeatureExtractor3.py. (This file is for batch 3. To use for other batches, simple change the file path).

### Cluster Words
1. Load output feature file. 
2. Run segmentCluster.m.

###  LDA
1. Run LDA.m

###  Accuracy 
1. Run accuracy.m to get the total number of correct predictions. 
2. Run category_accuracy.m to get accuracy for each category. 

##  Testing
1. 
