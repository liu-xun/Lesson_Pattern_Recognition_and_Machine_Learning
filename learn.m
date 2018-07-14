function [W1, W2, W3] = learn(W1, W2, W3, X, D, alpha)%SGD
    tic;%tic-toc命令对用来计算一次训练的耗时
    N = 60000;%训练样本数量
    for k = 1:N
        if mod(k,1000)==0
            fprintf('.');%每训练一千个样本屏幕上输出一个点
        end
        x = X(k,:);%x:[1x784]训练数据，方括号内为矩阵size，下同
        t = D(k,:);%t:[1x10]训练数据标签
        %前向算法
        %x->w1*x->g(w1*x)->w2*g(w1*x)->g(w2*g(w1*x))->w3*g(w2*g(w1*x))->a
        %x->vz--->z------->vy--------->y------------->o---------------->a
        vz = W1*x';%[300x784]*[1x784]'=[300x1]第一层隐含层 对输入加权，下同
        z = Sigmoid(vz);%yz:[300x1]激活函数处理后输出，下同
        vy = W2*z;%[100x300]*[300x1]=[100x1]第二隐含层
        y = Sigmoid(vy);%yy:[100x1]
        o = W3*y;%[10x100]*[100x1]=[10x1]输出层
        a = (exp(o)./sum(exp(o)));%a:[10x1]用softmax函数转换为概率
        %反向传播算法 参考https://www.cnblogs.com/charlotte77/p/5629865.html
        %lost函数L=-sum(ti*ln(ai))
        delta = a - t';%@L/@o:[10x1] 符号'@'这里用作为求偏导符号，下同
        e2 = W3'*delta;%@L/@y = @o/@y * @L/@o:[10x100]'*[10x1]=[100x1]
        delta2 = y.*(1-y).*e2;%@L/@vy=g'*@L/@y:[100x1]
        e1 = W2'*delta2;%@L/@z = @vy/@z * @L/@vy:[300x1]
        delta1 = z.*(1-z).*e1;%@L/@vz=g'*@L/@z:[300x1]
        %更新权重系数W1、W2、W3
        dW1 = delta1*x;%@L/@w1=@L/@vz * @vz/@w1=[300x1]*[1x784] 梯度方向，下同
        W1 = W1 - alpha*dW1;%[300x784] 学习速率alpha体现沿梯度方向行进的步长，下同
        dW2 = delta2*z';%@L/@w2=@L/@vy * @vy/@w2=[100x1]*[300x1]'
        W2 = W2 - alpha*dW2;%[100x300]
        dW3 = delta*y';%@L/@w3=@L/@o * @o/@w3=[10x1]*[100x1]'
        W3 = W3 - alpha*dW3;%[10x100]
    end
    disp(['time:',num2str(toc),'s']);%tic-toc命令对用来计算一次训练的耗时
end