%运行此脚本前要先加载已有的工作区记录文件
epochs = 1;%继续训练次数
disp(['开始训练:共',num2str(epochs),'次']);
for i = 1:epochs
    alpha = alpha * 0.95;%学习速率动态减小（此时工作区中以加载好原alpha值）
    %[data, label] = rand_data(data, label);%随机化训练样本
    disp(['Now start the ',num2str(i),' th time of train (print 60 dots), alpha = ',num2str(alpha)]);
    disp('............................................................');
    [W1, W2, W3] = learn(W1, W2, W3, data, label, alpha);%调用训练函数进行训练与更新权重系数
    totalEpochs = totalEpochs + 1;%已经训练的次数totalEpochs+1
    correctRate = test_correctRate(W1, W2, W3, testdata, testlabel);%测试目前的正确率
    disp(['total learn:',num2str(totalEpochs),' times, correct rate is : ',num2str(correctRate),'%']);
    %保存当前工作区，防止程序崩溃，也可用来断点续算
    save(['log_total_',num2str(totalEpochs),'_alpha_',num2str(alpha),'_rate_',num2str(correctRate),'.mat']);
end