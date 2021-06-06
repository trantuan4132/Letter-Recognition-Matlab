%% =========== Part 1: Loading and Visualizing Data =============

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

load('../emnist-letters.mat');
X_train = double(dataset.('train').('images'));
y_train = dataset.('train').('labels');
X_test = double(dataset.('test').('images'));
y_test = dataset.('test').('labels');

% Randomly select 100 data points to display
sel = randperm(size(X_train, 1));
sel = sel(1:100);

displayData(X_train(sel, :));

% Rescale both training and test set
X_train = X_train / 255;
X_test = X_test / 255;

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 2: Define NN Parameters ===================

input_layer_size = 784;    % 28x28 Input Images of Digits
hidden_layer_size = 1024;  % 1024 hidden units
num_labels = 26;           % 26 labels, from A to Z  
lambda = 1;                % Regularization parameter

%% =================== Part 3: Initialize Weights ===================

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%% =================== Part 4: Training NN ===================

fprintf('\nTraining Neural Network... \n');

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X_train, y_train, lambda);

% Minimize cost function 
options = optimset('MaxIter', 100);
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Save Model Weights
save('NN_relu_softmax_weights.mat', 'Theta1', 'Theta2');

%% ================= Part 5: Visualize Training Loss =================

figure();
plot(cost);
title('Loss per iterations');
xlabel('Number of iterations'); 
ylabel('Loss');
saveas(gcf, 'Visualizations/Loss_per_iterations', 'fig');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================= Part 6: Implement Predict =================

y_train_pred = predict(Theta1, Theta2, X_train);
fprintf('\nTraining Set Accuracy: %.2f %%\n', mean(double(y_train_pred == y_train)) * 100);

y_test_pred = predict(Theta1, Theta2, X_test);
fprintf('\nTest Set Accuracy: %.2f %%\n', mean(double(y_test_pred == y_test)) * 100);