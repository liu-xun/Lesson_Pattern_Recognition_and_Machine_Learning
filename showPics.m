load('data_raw.mat');
r = 10;
c = 10;
pic = [];
for i = 1:r
    raw = [];
    for j = 1:c
        img = data(ceil(60000*rand), :);
        img = reshape(img,28,28);
        raw = [raw img];
    end
    pic = [pic; raw];
end
imshow(pic);