clc
clearvars
format longg

%% prepare training data
if exist('./zdata.mat', 'file')
    loaded = load('./zdata.mat');
    train_data = loaded.train;
    train_count = loaded.train_count;
    train_label = loaded.train_label;
    test_data = loaded.test;
    test_count = loaded.test_count;
    test_label = loaded.test_label;
else
   [train_data, train_count, train_label, test_data, test_count, test_label] = load_and_split();
end

train_size = size(train_count, 1);
test_size = size(test_count, 1);

%% kmeans
% data: number of all frames x 90 x 50
data = permute(cat(3, train_data, test_data), [3 1 2]);
[centers, clustered] = kmeans(data, 10);

%% bag of frames
bagged = bag_of_words(clustered, train_count, test_count, 10);
train_data = bagged(1:train_size, :);
test_data = bagged((train_size + 1):(train_size + test_size), :);

%% knn
predicted = knn(train_data, train_label, test_data, 1);

%% accuracy
[accuracy, loss, confusion] = evaluate(predicted, test_label);