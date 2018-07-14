function y = Sigmoid(x)
    %激活函数，选用Sigmoid函数
    y = 1./(1+exp(-x));
end