function [data_return, label_return] = read_traindata(exist_mat_file)
    disp('��ѵ������');%��ѵ������
    if not(exist_mat_file)%���������data_and_label_raw.mat�ļ�
        data = [];
        label = [];
        %��digit0.mat-digit9.mat�ļ�������ѵ������
        for i = 0:9
            str = ['digit' num2str(i) '.mat'];%�����ļ����ִ�
            load(str);%���ض�Ӧ��.mat�ļ���������
            [r, ~] = size(D);%ȡ�ø����ָ���������������
            lab = zeros(r,10);%��ʼ����ǩ����
            lab(:,i+1) = 1;%��Ӧ���ֱ�ǩֵΪ1
            data = [data;D];%���������
            label = [label;lab];%��Ӧ��������ֵı�ǩ
        end
        %����Ϊ�ļ��������´ε���
        save('data_and_label_raw.mat', 'data', 'label');
        data_return = data;
        label_return = label;
    else%�������data_and_label_raw.mat�ļ�
        S = load('data_and_label_raw.mat');%���ص��ṹ��S����ֹ�ƻ���������
        data_return = S.data;%���ض�Ӧ�������ǩ
        label_return = S.label;
    end
end