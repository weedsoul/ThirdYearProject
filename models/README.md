# Saved svm models and how they were trained.
Each of these configurations will no doubt be train over different data or with
different kernel functions for libsvm.

## 200a / 197c : 200a197k.mat
The model in this set is called _model_ and it is trained over a very small
subset of data collected from the childes data set and data from radio and podcasts
of adults talking. All data has been cherrypicked in these sets to make working
with it reasonable easy. It is not broad enough to be used in a release but it is
quite simple and useful for testing whilst building. 

This model expects data to be passed in for classification in the form of 6 frames of
an mfcc. It is trained in this way too. Most of the models will follow this rule as it
has been proven to be effective experementally. 