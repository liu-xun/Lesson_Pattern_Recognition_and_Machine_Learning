epochs = 10;
disp(['开始训练:共',num2str(epochs),'次']);
for i = 1:epochs
    alpha = alpha * 0.95;
    %[data, label] = rand_data(data, label);%随机化训练样本
    disp(['Now start the ',num2str(i),' th time of train (print 60 dots), alpha = ',num2str(alpha)]);
    disp('............................................................');
    [W1, W2, W3] = learn(W1, W2, W3, data, label, alpha);
    totalEpochs = totalEpochs + 1;
    correctRate = test_correctRate(W1, W2, W3, testdata, testlabel);%测试正确率
    disp(['total learn:',num2str(totalEpochs),' times, correct rate is : ',num2str(correctRate),'%']);
    save(['log_total_',num2str(totalEpochs),'_alpha_',num2str(alpha),'_rate_',num2str(correctRate),'.mat']);
end