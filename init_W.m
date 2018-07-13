function [W1, W2 ,W3, totalEpochs] = init_W
    disp('初始化权重');%初始化权重
    W1 = randn(300,28*28);
    W2 = randn(100,300);
    W3 = randn(10,100);
    totalEpochs = 0;
end