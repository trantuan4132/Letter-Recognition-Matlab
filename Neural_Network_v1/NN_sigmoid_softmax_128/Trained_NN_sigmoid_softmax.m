%% ================= Part 1: Load Dataset =================

load('../../emnist-letters.mat');
X_train = double(dataset.('train').('images')) / 255;
y_train = dataset.('train').('labels');
X_test = double(dataset.('test').('images')) / 255;
y_test = dataset.('test').('labels');

%% ================= Part 2: Load Model Weights =================

load('NN_sigmoid_softmax_weights.mat');

y_train_pred = predict(Theta1, Theta2, X_train);
fprintf('\nTraining Set Accuracy: %.2f %%\n', mean(double(y_train_pred == y_train)) * 100);

y_test_pred = predict(Theta1, Theta2, X_test);
fprintf('\nTest Set Accuracy: %.2f %%\n', mean(double(y_test_pred == y_test)) * 100);

%% ================= Part 3: Plot confusion matrix =================

conf_matrix = confusionmat(y_test, y_test_pred);
conf_matrix = HeatMap(conf_matrix);
conf_matrix.Annotate = true;
conf_matrix.AnnotPrecision = 3;
conf_matrix.RowLabels = num2cell('A':'Z');
conf_matrix.ColumnLabels = num2cell('A':'Z');
conf_matrix.RowLabelsRotate = 0;
conf_matrix.ColumnLabelsRotate = 0;
addTitle(conf_matrix, 'Confusion Matrix');
addXLabel(conf_matrix, 'Predicted label');
addYLabel(conf_matrix, 'True label');
plot(conf_matrix);
%saveas(gcf, 'Visualizations/Confusion_Matrix', 'fig');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================= Part 4: Implement Predict On One Example =================

m = size(X_test, 1);

%  Randomly permute examples
rp = randperm(m);

for i = 1:m
    % Display 
    fprintf('\nDisplaying Example Image\n');
    displayData(X_test(rp(i), :));

    pred = predict(Theta1, Theta2, X_test(rp(i),:));
    fprintf('\nNeural Network Prediction: %d (letter %c)\n', pred, char(pred + 64));
    
    % Pause with quit option
    s = input('Paused - press enter to continue, q to exit:','s');
    if s == 'q'
      break
    end
end