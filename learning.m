clear;
exist_mat_file = 1;%不存在.mat文件（存在则该值设为1，可减少读取数据的时间）
[data, label] = read_traindata(exist_mat_file);%读训练样本
[testdata, testlabel] = read_testdata(exist_mat_file);%读测试样本
[W1, W2 ,W3, totalEpochs] = init_W;%初始化权重系数W1、W2、W3，初始化已训练次数为0
%开始训练
epochs = 10;%训练次数
alpha = 0.005/0.95;%学习速率
disp(['开始训练:共',num2str(epochs),'次']);
for i = 1:epochs
    alpha = alpha * 0.95;%学习速率动态减小
    [data, label] = rand_data(data, label);%随机化训练样本
    disp(['Now start the ',num2str(i),' th time of train (print 60 dots), alpha = ',num2str(alpha)]);
    disp('............................................................');
    [W1, W2, W3] = learn(W1, W2, W3, data, label, alpha);%调用训练函数进行训练与更新权重系数
    totalEpochs = totalEpochs + 1;%已经训练的次数totalEpochs+1
    correctRate = test_correctRate(W1, W2, W3, testdata, testlabel);%测试目前的正确率
    disp(['total learn:',num2str(totalEpochs),' times, correct rate is : ',num2str(correctRate),'%']);
    %保存当前工作区，防止程序崩溃，也可用来断点续算
    save(['log_total_',num2str(totalEpochs),'_alpha_',num2str(alpha),'_rate_',num2str(correctRate),'.mat']);
end