function hist = bag_of_words(data, train_count, test_count, k)
k_list = 1:k;
train_size = size(train_count, 1);
test_size = size(test_count, 1);
hist = zeros(train_size + test_size, k);

% count number of clusters in video
lower = 1;
for i = 1:train_size
    upper = lower + train_count(i) - 1;
    hist(i, k_list) = sum(data(lower:upper, :) == k_list);
    lower = lower + train_count(i);
end
for i = 1:test_size
    upper = lower + test_count(i) - 1;
    hist(i + train_size, k_list) = sum(data(lower:upper, :) == k_list);
    lower = lower + test_count(i);
end

% normalization
hist = z_standardize(hist);

end