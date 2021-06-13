function p = predict(Theta, X)

% Set m to be the number of samples
m = size(X, 1);

% Make predictions
h = sigmoid([ones(m, 1) X] * Theta');
[dummy, p] = max(h, [], 2);

end
