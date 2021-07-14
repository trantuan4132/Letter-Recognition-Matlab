function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_1_size, ...
                                   hidden_layer_2_size, ...
                                   num_labels, ...
                                   X, y, backward)

% Reshape nn_params back into the parameters Theta1, Theta2, Theta3, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_1_size * (input_layer_size + 1)), ...
                 hidden_layer_1_size, (input_layer_size + 1));

Theta2 = reshape(nn_params(1 + hidden_layer_1_size * (input_layer_size + 1): ...
                 hidden_layer_1_size * (input_layer_size + 1) + ...
                 hidden_layer_2_size * (hidden_layer_1_size + 1)), ...
                 hidden_layer_2_size, (hidden_layer_1_size + 1));             
             
Theta3 = reshape(nn_params(1 + hidden_layer_1_size * (input_layer_size + 1) + ...
                 hidden_layer_2_size * (hidden_layer_1_size + 1):end), ...
                 num_labels, (hidden_layer_2_size + 1));

% Set m to be the number of training examples
m = size(X, 1);
         
% Variables to be computed 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));
Theta3_grad = zeros(size(Theta3));


% Forward propagation
a1 = [ones(m, 1) X];
z2 = a1 * Theta1';
a2 = swish(z2, false);
a2 = [ones(m, 1) a2];
z3 = a2 * Theta2';
a3 = swish(z3, false);
a3 = [ones(m, 1) a3];
a4 = softmax(a3 * Theta3');

% One-hot Encoding
y_n = bsxfun(@eq, y(:), 1:num_labels);

% Compute cost with regularization
J = -1/m * sum(sum(y_n .* log(a4)));

                  
% Backward propagation
if backward == true
    delta4 = a4 - y_n;
    delta3 = (delta4 * Theta3) .* swish([ones(m, 1) z3], true);
    delta3 = delta3(:, 2:end);
    delta2 = (delta3 * Theta2) .* swish([ones(m, 1) z2], true);
    delta2 = delta2(:, 2:end);

    Theta3_grad = Theta3_grad + delta4' * a3;
    Theta2_grad = Theta2_grad + delta3' * a2;
    Theta1_grad = Theta1_grad + delta2' * a1;

    Theta3_grad = Theta3_grad / m;
    Theta2_grad = Theta2_grad / m;
    Theta1_grad = Theta1_grad / m;
end

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:) ; Theta3_grad(:)];

end
