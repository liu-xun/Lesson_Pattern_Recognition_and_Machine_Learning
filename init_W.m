function [W1, W2 ,W3, totalEpochs] = init_W
    disp('��ʼ��Ȩ��');%��ʼ��Ȩ��
    %W1��W2��W3����̬�ֲ���ʼ��
    W1 = randn(300,28*28);
    W2 = randn(100,300);
    W3 = randn(10,100);
    %totalEpochs��ʾW1��W2��W3�Ѿ���ѵ���Ĵ�������ʼΪ0
    totalEpochs = 0;
end