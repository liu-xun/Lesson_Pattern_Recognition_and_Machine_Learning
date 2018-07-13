clear;
exist_mat_file = 1;
[data, label] = read_traindata(exist_mat_file);%��ѵ������
[testdata, testlabel] = read_testdata(exist_mat_file);%����������
[W1, W2 ,W3, totalEpochs] = init_W;%��ʼ��Ȩ��
%��ʼѵ��
epochs = 50;
alpha = 0.005/0.95;%ѧϰ����
disp(['��ʼѵ��:��',num2str(epochs),'��']);
for i = 1:epochs
    alpha = alpha * 0.95;
    [data, label] = rand_data(data, label);%�����ѵ������
    disp(['Now start the ',num2str(i),' th time of train (print 60 dots), alpha = ',num2str(alpha)]);
    disp('............................................................');
    [W1, W2, W3] = learn(W1, W2, W3, data, label, alpha);
    totalEpochs = totalEpochs + 1;
    correctRate = test_correctRate(W1, W2, W3, testdata, testlabel);%������ȷ��
    disp(['total learn:',num2str(totalEpochs),' times, correct rate is : ',num2str(correctRate),'%']);
    save(['log_total_',num2str(totalEpochs),'_alpha_',num2str(alpha),'_rate_',num2str(correctRate),'.mat']);
end