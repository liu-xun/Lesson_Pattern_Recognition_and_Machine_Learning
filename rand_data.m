function [data_return, label_return] = rand_data(data, label)
    disp('�����ѵ������');%�����ѵ������
    n = 60000; %ѵ��������
    id = randperm(n);%����1-60000���ظ��������������
    data = data(id,:);%��data��������
    label = label(id,:);%���ݶ�Ӧ�ı�ǩҲҪ����
    data_return = data;
    label_return = label;
end