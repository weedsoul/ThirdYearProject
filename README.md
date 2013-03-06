# Project Demonstration
In the project demonstration we have a graphical user interface which will 
show the wave compared to the activation of the classifier to determine the
period of the speech which the classifier has determined to be children's speech
and which it has determined to be adults speech. 

### The Grapical User Interface
This provides the user with the option to either record some speech or to 
select a .wav file to be ran through the classifier. From there the GUI
will update with the wave form giving the user to option to play or pause 
the playback of of the audio file. 

There will also be a graph showing the activiation of the classifier over 
the intervals defined in the program along with an overall classification value 
of the result. 

### Change to the classification algorithm
Rather than training the classifier over whole files as individual data points
the nature of the problem has changed with the use of the classifier to determine
the classification of parts of the recording. Because of this the classifier should
now be trained over a variance of different parts. As the experemental results of
the previous solution revealed that using 4 frame windows achieved the best result
for other examples. For this reason i'm going to train over 4 frames in the new 
application of the problem.

### The inclusion of a new external bit of code: voice activity detection
Rather than removing silence based on low signal strength and voice activity 
detection I want to find examples of speech that is voiced rather than other
slightly less descriptive utterances. The new library will ensure that.
