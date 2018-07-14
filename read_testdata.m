function [testdata_return, testlabel_return] = read_testdata(exist_mat_file)
    disp('读测试样本');%读测试样本
    if exist_mat_file%如果存在testdata_and_testlabel.mat文件
        S = load('testdata_and_testlabel.mat');%加载到结构体S（防止破坏工作区）
        testdata_return = S.testdata;%返回对应数据与标签
        testlabel_return = S.testlabel;
    else%如果不存在testdata_and_testlabel.mat文件
        testdata = [];
        testlabel = [];
         %从test0.mat-test9.mat文件中整合测试数据
        for i = 0:9
            str = ['test' num2str(i) '.mat'];%生成文件名字串
            load(str);%加载对应的.mat文件到工作区
            [r, ~] = size(D);%取得该数字个数（数据行数）
            lab = zeros(r,10);%初始化标签矩阵
            lab(:,i+1) = 1;%对应数字标签值为1
            testdata = [testdata;D];%存入该数字
            testlabel = [testlabel;lab];%对应存入该数字的标签
        end
        %保存为文件，方便下次调用
        save('testdata_and_testlabel.mat', 'testdata', 'testlabel');
        testdata_return = testdata;
        testlabel_return = testlabel;
    end
end