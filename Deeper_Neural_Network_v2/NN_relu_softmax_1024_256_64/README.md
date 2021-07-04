# Deeper Neural Network - v2

## Architecture:

- 1 input layer (784 units)
- 1 hidden layer (1024 units, relu activation)
- 1 hidden layer (256 units, relu activation)
- 1 hidden layer (64 units, relu activation)
- 1 output layer (26 units, softmax activation)

## Training time: 

- 500 iterations for ~3h 9 minutes (CPU)
- 22.68s per iteration on average

## Loss:

- 2.973669e-01 -- Categorical Cross-Entropy Loss

![image](Visualizations/Loss_per_iterations.png)

## Accuracy:

- 91.08 % -- Training accuracy
- 88.99 % -- Test accuracy

![image](Visualizations/Confusion_Matrix.png)
