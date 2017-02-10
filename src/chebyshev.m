function distance = chebyshev(X, Y)
distance = max(abs(X - Y), [], 2);
end