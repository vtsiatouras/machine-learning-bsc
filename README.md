# Machine Learning & Pattern Recognition

Copyright (C) 2018 Vangelis Tsiatouras

## About 

This repository contains the assignments for the course "Machine Learning & Pattern Recognition" of the dept. Informatics & Telecommunications of University of Athens. The directories `ml_assignment_1` and `ml_assignment_2` contain 2 optional assignments which are introductory at MATLAB and in some classification algorithms.

## Project

In the main project of the course I had to implement 3 supervised classification algorithms that classify elements(pixels) of a [hyperspectral image](https://en.wikipedia.org/wiki/Hyperspectral_imaging). The image that was given for the training and for the testing was the following:

![Hyperspectral Image](https://github.com/VangelisTsiatouras/machine-learning-di/blob/master/project/outputs/Peek%202018-10-04%2004-19.gif)

This image displays 5 different crops in the area of Salinas,California. From this image I extracted the attributes of each pixel and then I split this data into 3 datasets, the train dataset which is the smallest, the test dataset and the operational dataset which are used for the classification. Also each pixel has 204 spectrum channels (from 0,2μm to 2,4μm) and the image is composed from 22.500 pixels.

## Classification Algorithms

The requested classification algorithms were Naive Bayes, minimum Euclidean Distance and k-Nearest Neighbors. All the algorithms were implemented by me and I didn't use MATLAB's libraries (instructor's commands).

### Naive Bayes

The implementation of Naive Bayes was split in the following parts. Initially for the training, I had to calculate the [Maximum Likelihood estimations](https://en.wikipedia.org/wiki/Maximum_likelihood_estimation) and the [a priori probabilities](https://en.wikipedia.org/wiki/A_priori_probability) for each category using the training dataset. After that I applied the [Naive Bayes rule](https://en.wikipedia.org/wiki/Naive_Bayes_classifier) for each element of the test/operational dataset with the 5 normal distribution probabilities that describe the 5 categories. The estimated category is choosen by the largest probability of Naive Bayes rule.

**Execution Results:**

![Naive Bayes Image](https://github.com/VangelisTsiatouras/machine-learning-di/blob/master/project/outputs/naive_bayes.jpg)

```
##########################
        TEST SET
##########################
Accuracy: 98.43%
Errors: 34
   652     0     0     0     0
     0   333     8     0     1
     0     1   548     0     0
     0     0     0   267     8
     0     2     0    14   331

##########################
      OPERATIONAL SET
##########################
Accuracy: 98.23%
Errors: 64
  1156     0     0     0     1
     0   521    11     0     2
     0     8   950     0     0
     0     0     0   440    11
     0     4     3    24   478

Classification Execution Time: 0.911583 seconds
```

### Minimum Euclidean Distance

For the training of this algorithm I simply calculated the means for the 5 categories of the train dataset. Then I calculate the [minimum Euclidean distance](https://en.wikipedia.org/wiki/Euclidean_distance) between all elements of the test/operational dataset and the means of the categories. To select the category of each element we choose the shortest distance of the 5 distances.

**Execution Results:**

![Minimum Euclidean Distance Image](https://github.com/VangelisTsiatouras/machine-learning-di/blob/master/project/outputs/euclidean.jpg)

```
##########################
        TEST SET
##########################
Accuracy: 97.55%
Errors: 53
   652     0     0     0     0
     0   321    21     0     0
     0     0   549     0     0
     0     0     0   270     5
     0     2     0    25   320
##########################
      OPERATIONAL SET
##########################
Accuracy: 97.20%
Errors: 101
  1155     0     0     1     1
     0   505    29     0     0
     0     0   958     0     0
     0     0     0   446     5
     0     4     0    61   444

Classification Execution Time: 2.508502 seconds
```

### k-Nearest Neighbors

The k-NN algorithm is pretty simple. For each element of test/operation set calcucate all the distances with the elements of the train set. Then sort these distances and choose the k shortest distances. In these k shortest distances, choose the category that has the majority of these k train set elements.

Also for the k-NN implementation it was necessary to use [k-fold cross validation](https://en.wikipedia.org/wiki/Cross-validation_(statistics)). At first I split the train set into 5 sets (5-folds) that are unique and I applied the k-NN algorithm to these. The 80% of the train set was the train-validation-set and the rest 20% was the test-validation-set. With this process I extracted the most optimal k for the k-NN that gives the best accuracy. Using k=3 we take the below results.

**Execution Results:**

![k-NN Image](https://github.com/VangelisTsiatouras/machine-learning-di/blob/master/project/outputs/knn.jpg)

```
##########################
        TEST SET
##########################
Accuracy: 98.66%
Errors: 29
   652     0     0     0     0
     0   334     8     0     0
     0     1   548     0     0
     0     0     0   266     9
     0     1     0    10   336


##########################
      OPERATIONAL SET
##########################
Accuracy: 98.75%
Errors: 45
  1155     0     0     0     2
     0   530     4     0     0
     0     0   958     0     0
     0     0     0   438    13
     0     4     0    22   483

Classification Execution Time (cross validation execution time is excluded): 625.136409 seconds
```
