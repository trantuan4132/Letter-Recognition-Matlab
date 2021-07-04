# Deeper Neural Network - v1

## Architecture:

- 1 input layer (784 units)
- 1 hidden layer (1024 units, relu activation)
- 1 hidden layer (64 units, relu activation)
- 1 output layer (26 units, softmax activation)

## Training time: 

- 500 iterations for ~2h 49 minutes (CPU)
- 20.28s per iteration on average

## Loss:

- 3.642606e-01 -- Categorical Cross-Entropy Loss

![image](Visualizations/Loss_per_iterations.png)

## Accuracy:

- 89.32 % -- Training accuracy
- 87.74 % -- Test accuracy

![image](Visualizations/Confusion_Matrix.png)
