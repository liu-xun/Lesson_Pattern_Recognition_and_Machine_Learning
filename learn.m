function [W1, W2, W3] = learn(W1, W2, W3, X, D, alpha)
    tic;
    N = 600;%训练样本数量
    for k = 1:N
        if mod(k,1000)==0
            fprintf('.');%每训练一千个样本打一个点
        end
        x = X(k,:);%x:[1x784]
        t = D(k,:);%t:[1x10]
        
        %x->w1*x->g(w1*x)->w2*g(w1*x)->g(w2*g(w1*x))->w3*g(w2*g(w1*x))->a
        %x->vz--->z------->vy--------->y------------->o---------------->a
        vz = W1*x';%[300x784]*[1x784]'=[300x1]
        z = Sigmoid(vz);%yz:[300x1]
        vy = W2*z;%[100x300]*[300x1]=[100x1]
        y = Sigmoid(vy);%yy:[100x1]
        o = W3*y;%[10x100]*[100x1]=[10x1]
        %yo = Sigmoid(o);%yo:[10x1]
        a = (exp(o)./sum(exp(o)));%a:[10x1]
        
        %反向传播算法参考https://www.cnblogs.com/charlotte77/p/5629865.html
        %lost函数L=-sum(ti*ln(ai))
        delta = a - t';%@L/@o:[10x1]
        e2 = W3'*delta;%@L/@y = @o/@y * @L/@o:[10x100]'*[10x1]=[100x1]
        delta2 = y.*(1-y).*e2;%@L/@vy=g'*@L/@y:[100x1]
        e1 = W2'*delta2;%@L/@z = @vy/@z * @L/@vy:[300x1]
        delta1 = z.*(1-z).*e1;%@L/@vz=g'*@L/@z:[300x1]
        
        dW1 = delta1*x;%@L/@w1=@L/@vz * @vz/@w1=[300x1]*[1x784]
        W1 = W1 - alpha*dW1;%[300x784]
        dW2 = delta2*z';%@L/@w2=@L/@vy * @vy/@w2=[100x1]*[300x1]'
        W2 = W2 - alpha*dW2;%[100x300]
        dW3 = delta*y';%@L/@w3=@L/@o * @o/@w3=[10x1]*[100x1]'
        W3 = W3 - alpha*dW3;%[10x100]
    end
    disp(['time:',num2str(toc),'s']);
end