function [centers, reconstructed] = kmeans(data, k)

% data: frame count x 4500
frame_count = size(data, 1);
data = reshape(data, frame_count, 4500);

%% initialize cluster centers
id = randperm(size(data, 1));
centers = data(id(1:k), :); % choose k random rows from data
distance = zeros(frame_count, k);

%% alternate between steps until convergence
for i = 1:10
   % assign data points to closest center
   for j = 1:k
       % store distance of all points to cluster center
       distance(:, j) = euclideanDistance(data, centers(j, :));
   end
   
   % get cluster id and value with minimum distance
   [closest_center, closest_id] = min(distance, [], 2);
   
   % update centers
   for j = 1:k
       % average all points assigned to cluster
       member1 = (closest_id == j); % count all assigned data points for cluster
       centers(j, :) = sum(data(member1, :), 1) ./ sum(member1); % average data points
   end
   
end

reconstructed = zeros(frame_count, 1);
for i = 1:frame_count
    [dummy, reconstructed(i)] = min(euclideanDistance(data(i, :), centers));
end

end