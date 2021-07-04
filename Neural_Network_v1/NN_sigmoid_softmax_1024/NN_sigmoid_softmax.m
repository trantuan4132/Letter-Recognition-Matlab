%% =========== Part 1: Loading and Visualizing Data =============

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

load('../../emnist-letters.mat');
X_train = double(dataset.('train').('images'));
y_train = dataset.('train').('labels');
X_test = double(dataset.('test').('images'));
y_test = dataset.('test').('labels');

% Randomly select 100 data points to display
sel = randperm(size(X_train, 1));
sel = sel(1:100);

% Display sample data
displayData(X_train(sel, :));

% Plot data distribution
figure();
bar([histc(y_train, 1:26) histc(y_test, 1:26)], 'stacked');
legend('Training Set', 'Test Set');
xlabel('Class');
ylabel('Count');

% Rescale both training and test set
X_train = X_train / 255;
X_test = X_test / 255;

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 2: Define NN Parameters ===================

input_layer_size = 784;    % 28x28 Input Images 
hidden_layer_size = 1024;  % 1024 hidden units
num_labels = 26;           % 26 labels, from A to Z  
lambda = 1;                % Regularization parameter

%% =================== Part 3: Initialize Weights ===================

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%% =================== Part 4: Training NN ===================

fprintf('\nTraining Neural Network... \n');

alpha = 0.5;                  % Learning rate
num_iters = 500;              % Number of iterations
cost = zeros(1, num_iters);   % History of cost function's output

for i = 1:num_iters
    % Compute cost and gradient
    [cost(i), grad] = nnCostFunction(nn_params, ...
                                     input_layer_size, ...
                                     hidden_layer_size, ...
                                     num_labels, X_train, y_train, lambda);                               
    % Print cost
    fprintf('Iteration %4i | Cost: %4.6e\r', i, cost(i));
                                
    % Update model weights
    nn_params = nn_params - alpha * grad;
end

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Save Model Weights
%save('NN_sigmoid_softmax_weights.mat', 'Theta1', 'Theta2');

%% ================= Part 5: Visualize Training Loss =================

figure();
plot(cost);
title('Loss per iterations');
xlabel('Number of iterations'); 
ylabel('Loss');
%saveas(gcf, 'Visualizations/Loss_per_iterations', 'fig');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================= Part 6: Implement Predict =================

y_train_pred = predict(Theta1, Theta2, X_train);
fprintf('\nTraining Set Accuracy: %.2f %%\n', mean(double(y_train_pred == y_train)) * 100);

y_test_pred = predict(Theta1, Theta2, X_test);
fprintf('\nTest Set Accuracy: %.2f %%\n', mean(double(y_test_pred == y_test)) * 100);