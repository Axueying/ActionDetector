function predicted = knn(train_data, train_label, test_data, k)
train_size = size(train_data, 1);
test_size = size(test_data, 1);
distance = zeros(test_size, train_size);

% compute distance between train and test data
for i = 1:test_size
    distance(i, :) = manhattanDistance(train_data, test_data(i, :));
end

% find k closest neighbors
kclosest = zeros(test_size, k);
[neighbor, neighbor_id] = sort(distance, 2);
for i = 1:test_size
    for j = 1:k
        kclosest(i , j) = train_label(neighbor_id(i, j).');
    end
end

predicted = mode(kclosest, 2);

end
