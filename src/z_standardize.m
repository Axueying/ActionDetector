function Z = z_standardize(X)
Z = (X - mean(X)) ./ std(X);
end