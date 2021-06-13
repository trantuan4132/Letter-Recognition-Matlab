# Deeper Neural Network - v2

## Architecture:

- 1 input layer (784 units)
- 1 hidden layer (64 units, relu activation)
- 1 hidden layer (64 units, relu activation)
- 1 output layer (26 units, softmax activation)

## Training time: 

- 100 iterations for ~5 minutes (CPU)
- 3.0s per iteration on average

## Loss:

- 8.243836e-01 -- Categorical Cross-Entropy Loss

![image](Visualizations/Loss_per_iterations.png)

## Accuracy:

- 76.19 % -- Training accuracy
- 76.03 % -- Test accuracy

![image](Visualizations/Confusion_Matrix.png)
