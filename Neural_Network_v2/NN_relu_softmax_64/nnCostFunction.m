function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Set m to be the number of training examples
m = size(X, 1);
         
% Variables to be computed 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));


% Forward propagation
a1 = [ones(m, 1) X];
z2 = a1 * Theta1';
a2 = relu(z2);
a2 = [ones(m, 1) a2];
a3 = softmax(a2 * Theta2');

% One-hot Encoding
y_n = bsxfun(@eq, y(:), 1:num_labels);

% Compute cost with regularization
J = -1/m * sum(sum(y_n .* log(a3)));
J = J + lambda/2/m * (sum(sum(Theta1(:, 2:end) .^ 2)) + sum(sum(Theta2(:, 2:end) .^ 2)));


% Backward propagation
delta3 = a3 - y_n;
delta2 = (delta3 * Theta2) .* reluGradient([ones(m, 1) z2]);
delta2 = delta2(:, 2:end);

Theta2_grad = Theta2_grad + delta3' * a2;
Theta1_grad = Theta1_grad + delta2' * a1;

Theta2_grad = Theta2_grad / m;
Theta1_grad = Theta1_grad / m;

% Add regularization
Theta2_grad(:, 2:end) = Theta2_grad(:, 2:end) + (lambda/m) * Theta2(:, 2:end); 
Theta1_grad(:, 2:end) = Theta1_grad(:, 2:end) + (lambda/m) * Theta1(:, 2:end);

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end