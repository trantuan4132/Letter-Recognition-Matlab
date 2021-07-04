function p = predict(Theta1, Theta2, Theta3, Theta4, X)

% Set m to be the number of samples
m = size(X, 1);

% Make predictions
h1 = relu([ones(m, 1) X] * Theta1');
h2 = relu([ones(m, 1) h1] * Theta2');
h3 = relu([ones(m, 1) h2] * Theta3');
h4 = softmax([ones(m, 1) h3] * Theta4');
[dummy, p] = max(h4, [], 2);

end
