function [accuracy, FEE] = CrossValidate(data, label, c,g)
    addpath libsvm/matlab

    %split data into 5 different subsets
    for i = 0:5:length(label)
        for j = 1:5
            if(i+j <= length(label)) 
                sets{j}(floor(i/5)+ 1, :, :) = data(i+j, :, :);
                labels{j}(floor(i/5) + 1, :, :) = label(i+j, 1);
            end
        end
    end

    %train with 1-4 test with 5
    
    %set the kernel properties
    trainString = sprintf('-t 2 -q -c %f -g %f', c,g);


    not5 = [sets{1} ; sets{2} ; sets{3} ; sets{4}];
    not5l = [labels{1} ; labels{2} ; labels{3} ; labels{4}];
    modeln5 = svmtrain(not5l, not5, trainString);
    [res, acc5] = svmpredict(labels{5}, sets{5}, modeln5,'-q');


    not4 = [sets{1} ; sets{2} ; sets{3} ; sets{5}];
    not4l = [labels{1} ; labels{2} ; labels{3} ; labels{5}];
    modeln4 = svmtrain(not4l, not4, trainString);
    [res, acc4] = svmpredict(labels{4}, sets{4}, modeln4, '-q');


    not3 = [sets{1} ; sets{2} ; sets{5} ; sets{4}];
    not3l = [labels{1} ; labels{2} ; labels{5} ; labels{4}];
    modeln3 = svmtrain(not3l, not3, trainString);
    [res, acc3] = svmpredict(labels{3}, sets{3}, modeln3, '-q');


    not2 = [sets{1} ; sets{5} ; sets{3} ; sets{4}];
    not2l = [labels{1} ; labels{5} ; labels{3} ; labels{4}];
    modeln2 = svmtrain(not2l, not2, trainString);
    [res, acc2] = svmpredict(labels{2}, sets{2}, modeln2,'-q');


    not1 = [sets{5} ; sets{2} ; sets{3} ; sets{4}];
    not1l = [labels{5} ; labels{2} ; labels{3} ; labels{4}];
    modeln1 = svmtrain(not1l, not1, trainString);
    [res, acc1] = svmpredict(labels{1}, sets{1}, modeln1,'-q');


    accuracy = (acc1(1) + acc2(1) + acc3(1) + acc4(1) + acc5(1)) / 5;

end