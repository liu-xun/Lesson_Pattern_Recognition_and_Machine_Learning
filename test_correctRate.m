function [correctRate] = test_correctRate(W1, W2, W3, testdata, testlabel)
    disp(['��ʼ���� (print 50 dots)',char(10),'..................................................']);
    testN = 10000;%������������
    correctN = 0;%������ȷ����������
    for k = 1:testN
        if mod(k,200)==0
            fprintf('.');%ÿ����200����������Ļ�����һ����
        end
        x = testdata(k,:);%ȡ��������
        t = testlabel(k,:);%ȡ�������ݱ�ǩ
        %���δ������������ǰ���㷨
        vz = W1*x';
        z = Sigmoid(vz);
        vy = W2*z;
        y = Sigmoid(vy);
        o = W3*y;
        %�����softmax����תΪ����
        a = (exp(o)./sum(exp(o)))';
        if find(a == max(a)) == find(t == 1)%�����������������ö�Ӧ��ǩ��Ϊ1������
            correctN = correctN + 1;%��˵��������ʶ����ȷ
        end
    end
    fprintf(1,'\n');
    correctRate = 100*correctN/testN;%���سɹ��ʰٷ���ֵ
end