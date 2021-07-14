function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   num_labels, ...
                                   X, y, backward)

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
a2 = sigmoid(z2, false);

% One-hot Encoding
y_n = bsxfun(@eq, y(:), 1:num_labels);

% Compute cost with regularization
J = 1/m * sum(sum(-y_n .* log(a2) - (1-y_n) .* log(1-a2)));


% Backward propagation
if backward == true
    delta2 = a2 - y_n;
    grad = grad + delta2' * a1;
    grad = grad / m;
end

% Unroll gradients
grad = grad(:);

end
