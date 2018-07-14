load('data_and_label_raw.mat');
r = 5; %5行
c = 10; %10列
pic = []; %存放所有图片的矩阵
for i = 1:r
    raw = []; %存放每行的图片
    for j = 1:c
        %随机抽取一个数字
        img = data(ceil(60000*rand), :);
        %将1x784的数据转换为28x28的像素矩阵
        img = reshape(img,28,28);
        raw = [raw img]; %拼接到每行的图片中
    end
    pic = [pic; raw]; %图片按行拼接起来
end
imshow(pic); %展示图片