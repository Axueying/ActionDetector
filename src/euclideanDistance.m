function distance = euclideanDistance(X, Y)
distance = sqrt(sum((X - Y) .^ 2, 2));
end