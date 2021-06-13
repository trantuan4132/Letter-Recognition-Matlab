function p = predict(Theta1, Theta2, Theta3, X)

% Set m to be the number of samples
m = size(X, 1);

% Make predictions
h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');
h3 = sigmoid([ones(m, 1) h2] * Theta3');
[dummy, p] = max(h3, [], 2);

end
