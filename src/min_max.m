function Z = min_max(X)
Z = (X - min(X)) ./ (max(X) - min(X));
end