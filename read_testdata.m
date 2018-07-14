function [testdata_return, testlabel_return] = read_testdata(exist_mat_file)
    disp('����������');%����������
    if exist_mat_file%�������testdata_and_testlabel.mat�ļ�
        S = load('testdata_and_testlabel.mat');%���ص��ṹ��S����ֹ�ƻ���������
        testdata_return = S.testdata;%���ض�Ӧ�������ǩ
        testlabel_return = S.testlabel;
    else%���������testdata_and_testlabel.mat�ļ�
        testdata = [];
        testlabel = [];
         %��test0.mat-test9.mat�ļ������ϲ�������
        for i = 0:9
            str = ['test' num2str(i) '.mat'];%�����ļ����ִ�
            load(str);%���ض�Ӧ��.mat�ļ���������
            [r, ~] = size(D);%ȡ�ø����ָ���������������
            lab = zeros(r,10);%��ʼ����ǩ����
            lab(:,i+1) = 1;%��Ӧ���ֱ�ǩֵΪ1
            testdata = [testdata;D];%���������
            testlabel = [testlabel;lab];%��Ӧ��������ֵı�ǩ
        end
        %����Ϊ�ļ��������´ε���
        save('testdata_and_testlabel.mat', 'testdata', 'testlabel');
        testdata_return = testdata;
        testlabel_return = testlabel;
    end
end