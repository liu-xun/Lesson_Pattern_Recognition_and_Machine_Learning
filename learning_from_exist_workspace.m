%���д˽ű�ǰҪ�ȼ������еĹ�������¼�ļ�
epochs = 1;%����ѵ������
disp(['��ʼѵ��:��',num2str(epochs),'��']);
for i = 1:epochs
    alpha = alpha * 0.95;%ѧϰ���ʶ�̬��С����ʱ���������Լ��غ�ԭalphaֵ��
    %[data, label] = rand_data(data, label);%�����ѵ������
    disp(['Now start the ',num2str(i),' th time of train (print 60 dots), alpha = ',num2str(alpha)]);
    disp('............................................................');
    [W1, W2, W3] = learn(W1, W2, W3, data, label, alpha);%����ѵ����������ѵ�������Ȩ��ϵ��
    totalEpochs = totalEpochs + 1;%�Ѿ�ѵ���Ĵ���totalEpochs+1
    correctRate = test_correctRate(W1, W2, W3, testdata, testlabel);%����Ŀǰ����ȷ��
    disp(['total learn:',num2str(totalEpochs),' times, correct rate is : ',num2str(correctRate),'%']);
    %���浱ǰ����������ֹ���������Ҳ�������ϵ�����
    save(['log_total_',num2str(totalEpochs),'_alpha_',num2str(alpha),'_rate_',num2str(correctRate),'.mat']);
end