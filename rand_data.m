function [data_return, label_return] = rand_data(data, label)
    disp('�����ѵ������');%�����ѵ������
    n = 60000; 
    id = randperm(n);
    data = data(id,:);
    label = label(id,:);
    data_return = data;
    label_return = label;
end