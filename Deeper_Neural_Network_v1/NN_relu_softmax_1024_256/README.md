# Deeper Neural Network - v1

## Architecture:

- 1 input layer (784 units)
- 1 hidden layer (1024 units, relu activation)
- 1 hidden layer (256 units, relu activation)
- 1 output layer (26 units, softmax activation)

## Training time: 

- 500 iterations for ~3h 8 minutes (CPU)
- 22.56s per iteration on average

## Loss:

- 3.277922e-01 -- Categorical Cross-Entropy Loss

![image](Visualizations/Loss_per_iterations.png)

## Accuracy:

- 90.53 % -- Training accuracy
- 88.44 % -- Test accuracy

![image](Visualizations/Confusion_Matrix.png)
