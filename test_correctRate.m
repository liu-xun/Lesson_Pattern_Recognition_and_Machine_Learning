function [correctRate] = test_correctRate(W1, W2, W3, testdata, testlabel)
    disp(['开始测试 (print 50 dots)',char(10),'..................................................']);
    testN = 10000;%测试样本数量
    correctN = 0;%测试正确的样本数量
    for k = 1:testN
        if mod(k,200)==0
            fprintf('.');%每测试200个样本在屏幕上输出一个点
        end
        x = testdata(k,:);%取测试数据
        t = testlabel(k,:);%取测试数据标签
        %依次代入各层神经网络前向算法
        vz = W1*x';
        z = Sigmoid(vz);
        vy = W2*z;
        y = Sigmoid(vy);
        o = W3*y;
        %结果用softmax函数转为概率
        a = (exp(o)./sum(exp(o)))';
        if find(a == max(a)) == find(t == 1)%若概率最大的数字正好对应标签中为1的数字
            correctN = correctN + 1;%则说明该数字识别正确
        end
    end
    fprintf(1,'\n');
    correctRate = 100*correctN/testN;%返回成功率百分数值
end