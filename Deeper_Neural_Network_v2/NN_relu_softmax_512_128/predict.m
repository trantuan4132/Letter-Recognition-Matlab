function p = predict(Theta1, Theta2, Theta3, X)

% Set m to be the number of samples
m = size(X, 1);

% Make predictions
h1 = relu([ones(m, 1) X] * Theta1', false);
h2 = relu([ones(m, 1) h1] * Theta2', false);
h3 = softmax([ones(m, 1) h2] * Theta3');
[dummy, p] = max(h3, [], 2);

end
