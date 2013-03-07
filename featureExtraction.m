function [featureVector] = featureExtraction(audioSamples, sampleRates, windowSize)
% add the paths for the signal processing libraries: voicebox & detectvoiced
addpath voicebox;
addpath detectvoiced;


% define a variable to keep track of the number of data points created in the
% feature vector.


numberOfDataPoints = 0;


for currentSample = 1: length(sampleRates)

	%split the wave file into smaller sections of voiced portions of the audioSample
	[voiced, sampleRate] = detectVoiced(audioSamples{currentSample}, sampleRates(currentSample), 1);
	% count the number of different samples
	voicedSize = length(voiced);

	%convert each voiced section and then split each into windowSize datapoints sequentially.
	for i = 1:voicedSize
		mfcc = melcepst(voiced{i}, sampleRate);
		numberOfFrames = length(mfcc);


		%while there are still enough frames to harvest
		for j = 1:windowSize:(numberOfFrames-(windowSize + 2))
			numberOfDataPoints = numberOfDataPoints + 1;
			featureVector(numberOfDataPoints, :, :) = mfcc(j:j+windowSize, :);
		end;
	end;

end;