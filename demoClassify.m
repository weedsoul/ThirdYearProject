function [result] = demoClassify(wave, fs)
	addpath libsvm/matlab;
	load models/morekids.mat;
	features = featureExtraction(wave,fs, 6);
	labels(1:length(features),1) = 0;
	[predictions] = svmpredict(labels, features, model);
    result = predictions;