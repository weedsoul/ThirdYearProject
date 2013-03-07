function [result] = RemoveSilence(wav, fs)
    %run the voice activity detector to determine where a voice can be
    %heard.
    mask = vadsohn(wav(:,1), fs);
    %find the indexes of the frames where voice is detected.
    notSilentI = find(mask==1);
    %pull the values of thoes voices frames out of the recording.
    result = wav(notSilentI);
    result = result(find(abs(result)>0));
end