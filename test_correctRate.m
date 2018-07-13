function [correctRate] = test_correctRate(W1, W2, W3, testdata, testlabel)
    disp(['开始测试 (print 50 dots)',char(10),'..................................................']);
    testN = 10000;%测试样本数量
    correctN = 0;
    for k = 1:testN
        if mod(k,200)==0
            fprintf('.');
        end
        x = testdata(k,:);
        t = testlabel(k,:);
        vz = W1*x';
        z = Sigmoid(vz);
        vy = W2*z;
        y = Sigmoid(vy);
        o = W3*y;
        a = (exp(o)./sum(exp(o)))';
        if find(a == max(a)) == find(t == 1)
            correctN = correctN + 1;
        end
    end
    fprintf(1,'\n');
    correctRate = 100*correctN/testN;
end