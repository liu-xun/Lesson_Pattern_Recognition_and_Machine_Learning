load('data_and_label_raw.mat');
r = 5; %5��
c = 10; %10��
pic = []; %�������ͼƬ�ľ���
for i = 1:r
    raw = []; %���ÿ�е�ͼƬ
    for j = 1:c
        %�����ȡһ������
        img = data(ceil(60000*rand), :);
        %��1x784������ת��Ϊ28x28�����ؾ���
        img = reshape(img,28,28);
        raw = [raw img]; %ƴ�ӵ�ÿ�е�ͼƬ��
    end
    pic = [pic; raw]; %ͼƬ����ƴ������
end
imshow(pic); %չʾͼƬ