function [data_return, label_return] = read_traindata(exist_mat_file)
    disp('读训练样本');%读训练样本
    if not(exist_mat_file)
        data = [];
        label = [];
        for i = 0:9
            str = ['digit' num2str(i) '.mat'];
            load(str);
            [r, ~] = size(D);
            lab = zeros(r,10);
            lab(:,i+1) = 1;
            data = [data;D];
            label = [label;lab];
        end
        save('data_and_label_raw.mat', 'data', 'label');
        data_return = data;
        label_return = label;
    else
        S = load('data_and_label_raw.mat');
        data_return = S.data;
        label_return = S.label;
    end
end