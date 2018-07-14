function [data_return, label_return] = read_traindata(exist_mat_file)
    disp('读训练样本');%读训练样本
    if not(exist_mat_file)%如果不存在data_and_label_raw.mat文件
        data = [];
        label = [];
        %从digit0.mat-digit9.mat文件中整合训练数据
        for i = 0:9
            str = ['digit' num2str(i) '.mat'];%生成文件名字串
            load(str);%加载对应的.mat文件到工作区
            [r, ~] = size(D);%取得该数字个数（数据行数）
            lab = zeros(r,10);%初始化标签矩阵
            lab(:,i+1) = 1;%对应数字标签值为1
            data = [data;D];%存入该数字
            label = [label;lab];%对应存入该数字的标签
        end
        %保存为文件，方便下次调用
        save('data_and_label_raw.mat', 'data', 'label');
        data_return = data;
        label_return = label;
    else%如果存在data_and_label_raw.mat文件
        S = load('data_and_label_raw.mat');%加载到结构体S（防止破坏工作区）
        data_return = S.data;%返回对应数据与标签
        label_return = S.label;
    end
end