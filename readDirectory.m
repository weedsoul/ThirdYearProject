%This method reads all the files in a directory of wav files and writes the
%results into a cell array which will be essentailly an array of wav files
%ready to be processed by a feature extraction algorithm
function [data, fss] = readDirectory(cdir)
    Files=dir(cdir);
    %define the size of the cell array to store the files
    for k = 1:length(Files)
        fname=fullfile(fileparts(cdir), Files(k).name);
        [wave, fs] = wavread(fname);
        data{k} = wave;
        fss(k) = fs;
    end
end 