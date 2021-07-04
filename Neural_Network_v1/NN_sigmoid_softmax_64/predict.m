function p = predict(Theta1, Theta2, X)

% Set m to be the number of samples
m = size(X, 1);

% Make predictions
h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = softmax([ones(m, 1) h1] * Theta2');
[dummy, p] = max(h2, [], 2);

end
