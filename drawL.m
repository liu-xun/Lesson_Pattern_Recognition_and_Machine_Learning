clear;
disp('读训练样本');%读训练样本
data = [];
label = [];
for i = 0:9
    str = ['digit' num2str(i) '.mat'];
    load(str);
    [r, c] = size(D);
    lab = zeros(r,10);
    lab(:,i+1) = 1;
    data = [data;D];
    label = [label;lab];
end
disp('随机化训练样本');%随机化训练样本
n = 60000; 
id = randperm(n);
data = data(id,:);
label = label(id,:);
disp('初始化权重');%初始化权重
W1 = randn(300,28*28);
W2 = randn(100,300);
W3 = randn(10,100);
%开始训练
epochs = 300;
disp(['开始训练:共',num2str(epochs),'次']);
X=data;
D=label;
alpha = 0.005;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L = [];
E = [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:epochs
%     disp(['Now start the ',num2str(i),' th time of train (print 60 dots)',char(10),'............................................................']);
    tic;
    alpha = alpha * 0.95;%学习速率
    disp([num2str(i),' th train, alpha = ',num2str(alpha)]);
    N = 1000;%训练样本数量
    L2=0;
    
    n = 60000; 
    id = randperm(n);
    data = data(id,:);
    label = label(id,:);

    for k = 1:N
%         if mod(k,1000)==0
%             fprintf('.');
%         end
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
        L1 = - sum(t'.*log(a));
        L = [L,L1];
        L2 = L2 + (t' - a)'*(t' - a);
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
    E = [E,L2/N];
end
%测试正确率
disp('读测试样本');%读测试样本
testdata = [];
testlabel = [];
for i = 0:9
    str = ['test' num2str(i) '.mat'];
    load(str);
    [r, c] = size(D);
    lab = zeros(r,10);
    lab(:,i+1) = 1;
    testdata = [testdata;D];
    testlabel = [testlabel;lab];
end
%开始测试
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
disp(['correct rate is : ',num2str(100*correctN/testN),'%']);