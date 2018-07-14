function [data_return, label_return] = rand_data(data, label)
    disp('随机化训练样本');%随机化训练样本
    n = 60000; %训练样本数
    id = randperm(n);%产生1-60000不重复的随机整数数列
    data = data(id,:);%对data重新排序
    label = label(id,:);%数据对应的标签也要更新
    data_return = data;
    label_return = label;
end