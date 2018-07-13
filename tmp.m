clear
load('data_and_label_raw.mat');
W1 = randn(300,28*28);
W2 = randn(100,300);
W3 = randn(10,100);
load('testdata.mat');
load('testlabel.mat');

for loop = 1:10
    learning
end