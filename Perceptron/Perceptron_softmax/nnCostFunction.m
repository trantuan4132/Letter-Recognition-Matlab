function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)

% Reshape nn_params back into Theta, the weight matrix for our neural network                               
Theta = reshape(nn_params, num_labels, (input_layer_size + 1));                               
                               
% Set m to be the number of training examples
m = size(X, 1);
         
% Variables to be computed 
J = 0;
grad = zeros(size(Theta));


% Forward propagation
a1 = [ones(m, 1) X];
z2 = a1 * Theta';
a2 = softmax(z2);

% One-hot Encoding
y_n = bsxfun(@eq, y(:), 1:num_labels);

% Compute cost with regularization
J = -1/m * sum(sum(y_n .* log(a2)));
J = J + lambda/2/m * sum(sum(Theta(:, 2:end) .^ 2));


% Backward propagation
delta2 = a2 - y_n;
grad = grad + delta2' * a1;
grad = grad / m;

% Add regularization
grad(:, 2:end) = grad(:, 2:end) + (lambda/m) * Theta(:, 2:end);

% Unroll gradients
grad = grad(:);

end
