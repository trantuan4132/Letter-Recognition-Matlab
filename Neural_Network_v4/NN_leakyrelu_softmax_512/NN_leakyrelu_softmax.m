%% =========== Part 1: Loading and Visualizing Data =============

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

load('../../emnist-letters.mat');
X = double(dataset.('train').('images'));
y = dataset.('train').('labels');
X_test = double(dataset.('test').('images'));
y_test = dataset.('test').('labels');

% Shuffle indices of data
sel = randperm(size(X, 1));

% Split data into training set and validation set
train_ratio = 0.8;
train_size = round(size(X, 1) * train_ratio);
X_train = X(sel(1:train_size), :);
y_train = y(sel(1:train_size), :);
X_val = X(sel(train_size+1:end), :);
y_val = y(sel(train_size+1:end), :);

% Display sample data
displayData(X_train(1:100, :));

% Plot data distribution
figure();
bar([histc(y_train, 1:26), histc(y_val, 1:26), histc(y_test, 1:26)], 'stacked');
legend('Training Set', 'Validation Set', 'Test Set');
xlabel('Class');
ylabel('Count');

% Rescale both training, validation and test set
X_train = X_train / 255;
X_val = X_val / 255;
X_test = X_test / 255;

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 2: Define NN Parameters ===================

input_layer_size = 784;    % 28x28 Input Images
hidden_layer_size = 512;   % 512 hidden units
num_labels = 26;           % 26 labels, from A to Z  

%% =================== Part 3: Initialize Weights ===================

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%% =================== Part 4: Training NN ===================

fprintf('\nTraining Neural Network... \n');

alpha = 0.5;                     % Learning rate
num_iters = 500;                 % Number of iterations
J_train = zeros(1, num_iters);   % History of cost function's output on training set
J_val = zeros(1, num_iters);     % History of cost function's output on validation set

% Early Stopping when validation loss goes up
patience = 50;
best_nn_params = nn_params;
idxmin = 1;

for i = 1:num_iters
    % Compute cost and gradient
    [J_train(i), grad] = nnCostFunction(nn_params, ...
                                        input_layer_size, ...
                                        hidden_layer_size, ...
                                        num_labels, ...
                                        X_train, y_train, true); 
                                    
    [J_val(i), dummy] = nnCostFunction(nn_params, ...
                                       input_layer_size, ...
                                       hidden_layer_size, ...
                                       num_labels, ...
                                       X_val, y_val, false);                                                            
    % Print cost
    fprintf('Iteration %4i | Cost: %4.6e | Val_Cost: %4.6e\r', i, J_train(i), J_val(i));
    
    % Check if validation loss decrease
    if J_val(i) < J_val(idxmin)
        best_nn_params = nn_params;
        idxmin = i;
    end 
    
    % Update model weights
    nn_params = nn_params - alpha * grad;
       
    % Early stopping if validation loss does not decrease for max number of
    % iterations to wait
    if i - idxmin > patience
        break
    end
end

% Obtain model parameters from where validation loss is minimal
nn_params = best_nn_params;

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Save Model Weights
%save('NN_leakyrelu_softmax_weights.mat', 'Theta1', 'Theta2');

%% ================= Part 5: Visualize Training Loss =================

J_train = J_train(1:i);
J_val = J_val(1:i);

figure();
plot(J_train);
hold on;
plot(J_val, 'r');
title('Loss per iterations');
xlabel('Number of iterations'); 
ylabel('Loss');
legend('Training Loss', 'Validation Loss');
%saveas(gcf, 'Visualizations/Loss_per_iterations', 'fig');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================= Part 6: Implement Predict =================

y_train_pred = predict(Theta1, Theta2, X_train);
fprintf('\nTraining Set Accuracy: %.2f %%\n', mean(double(y_train_pred == y_train)) * 100);

y_val_pred = predict(Theta1, Theta2, X_val);
fprintf('\nValidation Set Accuracy: %.2f %%\n', mean(double(y_val_pred == y_val)) * 100);

y_test_pred = predict(Theta1, Theta2, X_test);
fprintf('\nTest Set Accuracy: %.2f %%\n', mean(double(y_test_pred == y_test)) * 100);