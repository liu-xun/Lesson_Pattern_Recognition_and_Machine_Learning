function [testdata_return, testlabel_return] = read_testdata(exist_mat_file)
    disp('¶Á²âÊÔÑù±¾');%¶Á²âÊÔÑù±¾
    if exist_mat_file
        S = load('testdata_and_testlabel.mat');
        testdata_return = S.testdata;
        testlabel_return = S.testlabel;
    else
        testdata = [];
        testlabel = [];
        for i = 0:9
            str = ['test' num2str(i) '.mat'];
            load(str);
            [r, c] = size(D);
            lab = zeros(r,10);
            lab(:,i+1) = 1;
            testdata = [testdata;D];
            testlabel = [testlabel;lab];
        end
        save('testdata_and_testlabel.mat', 'testdata', 'testlabel');
        testdata_return = testdata;
        testlabel_return = testlabel;
    end
end