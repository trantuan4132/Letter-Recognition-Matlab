# Letter-Recognition-Matlab

This repository compare models used to recognize letters from images via performance (training time, accuracy). 
The models are coded from scratch in Matlab programming language.

## Sample:

![image](Sample.png)

## Available models:

- [Perceptron:](Perceptron)

| Model              |  Input Layer  | Output Layer                        | Total Parameters | No. Iterations |  Duration  | Training Accuracy | Test Accuracy |
|--------------------|:-------------:|:-----------------------------------:|:----------------:|:--------------:|:----------:|:-----------------:|:-------------:|
| Perceptron_sigmoid |   784 units   |   26 units <br>  Sigmoid activation |      20,410      |       100      | ~3 minutes |      71.60 %      |    71.06 %    |
| Perceptron_softmax |   784 units   |   26 units <br>  Softmax activation |      20,410      |       100      | ~4 minutes |      72.83 %      |    72.29 %    |

- [Neural Network - v1:](Neural_Network_v1)

| Model           |  Input Layer  | Hidden Layer                          | Output Layer                        | Total Parameters | No. Iterations |   Duration  | Training Accuracy | Test Accuracy |
|-----------------|:-------------:|:-------------------------------------:|:-----------------------------------:|:----------------:|:--------------:|:-----------:|:-----------------:|:-------------:|
| NN_sigmoid_64   |   784 units   |   64 units <br>  Sigmoid activation   |   26 units <br>  Sigmoid activation |      51,930      |       100      |  ~7 minutes |      81.15 %      |    80.45 %    |
| NN_sigmoid_128  |   784 units   |   128 units <br>  Sigmoid activation  |   26 units <br>  Sigmoid activation |     103,834      |       100      | ~13 minutes |      85.05 %      |    84.33 %    |
| NN_sigmoid_256  |   784 units   |   256 units <br>  Sigmoid activation  |   26 units <br>  Sigmoid activation |     207,642      |       100      | ~23 minutes |      85.23 %      |    84.32 %    |
| NN_sigmoid_512  |   784 units   |   512 units <br>  Sigmoid activation  |   26 units <br>  Sigmoid activation |     415,258      |       100      | ~38 minutes |      81.22 %      |    80.69 %    |
| NN_sigmoid_1024 |   784 units   |   1024 units <br>  Sigmoid activation |   26 units <br>  Sigmoid activation |     830,490      |       100      | ~54 minutes |      76.94 %      |    76.42 %    |

- [Neural Network - v2:](Neural_Network_v2)

| Model                |  Input Layer  | Hidden Layer                       | Output Layer                        | Total Parameters | No. Iterations |   Duration  | Training Accuracy | Test Accuracy |
|----------------------|:-------------:|:----------------------------------:|:-----------------------------------:|:----------------:|:--------------:|:-----------:|:-----------------:|:-------------:|
| NN_relu_softmax_64   |   784 units   |   64 units <br>  ReLU activation   |   26 units <br>  Softmax activation |      51,930      |       100      |  ~4 minutes |      82.44 %      |    81.92 %    |
| NN_relu_softmax_128  |   784 units   |   128 units <br>  ReLU activation  |   26 units <br>  Softmax activation |     103,834      |       100      | ~5 minutes  |      85.32 %      |    84.14 %    |
| NN_relu_softmax_256  |   784 units   |   256 units <br>  ReLU activation  |   26 units <br>  Softmax activation |     207,642      |       100      | ~13 minutes |      88.15 %      |    86.99 %    |
| NN_relu_softmax_512  |   784 units   |   512 units <br>  ReLU activation  |   26 units <br>  Softmax activation |     415,258      |       100      | ~27 minutes |      89.69 %      |    88.03 %    |
| NN_relu_softmax_1024 |   784 units   |   1024 units <br>  ReLU activation |   26 units <br>  Softmax activation |     830,490      |       100      | ~54 minutes |      90.11 %      |    88.27 %    |

- [Deeper Neural Network - v1:](Deeper_Neural_Network_v1)

| Model              |  Input Layer  | Hidden Layer 1                       | Hidden Layer 2                       | Output Layer                        | Total Parameters | No. Iterations |   Duration  | Training Accuracy | Test Accuracy |
|--------------------|:-------------:|:------------------------------------:|:------------------------------------:|:-----------------------------------:|:----------------:|:--------------:|:-----------:|:-----------------:|:-------------:|
| NN_sigmoid_64_64   |   784 units   |   64 units <br>  Sigmoid activation  |   64 units <br>  Sigmoid activation  |   26 units <br>  Sigmoid activation |      56,090      |       100      | ~12 minutes |      78.58 %      |    78.03 %    |
| NN_sigmoid_128_128 |   784 units   |   128 units <br>  Sigmoid activation |   128 units <br>  Sigmoid activation |   26 units <br>  Sigmoid activation |     120,346      |       100      | ~12 minutes |      79.36 %      |    78.68 %    |
| NN_sigmoid_256_256 |   784 units   |   256 units <br>  Sigmoid activation |   256 units <br>  Sigmoid activation |   26 units <br>  Sigmoid activation |     273,434      |       100      | ~28 minutes |      75.88 %      |    75.63 %    |
| NN_sigmoid_512_512 |   784 units   |   512 units <br>  Sigmoid activation |   512 units <br>  Sigmoid activation |   26 units <br>  Sigmoid activation |     677,914      |       100      | ~1h 6 minutes |      73.91 %      |    74.03 %    |

- [Deeper Neural Network - v2:](Deeper_Neural_Network_v2)

| Model                   |  Input Layer  | Hidden Layer 1                    | Hidden Layer 2                    | Output Layer                        | Total Parameters | No. Iterations |   Duration  | Training Accuracy | Test Accuracy |
|-------------------------|:-------------:|:---------------------------------:|:---------------------------------:|:-----------------------------------:|:----------------:|:--------------:|:-----------:|:-----------------:|:-------------:|
| NN_relu_softmax_64_64   |   784 units   |   64 units <br>  ReLU activation  |   64 units <br>  ReLU activation  |   26 units <br>  Softmax activation |      56,090      |       100      |  ~5 minutes |      76.19 %      |    76.03 %    |
| NN_relu_softmax_128_128 |   784 units   |   128 units <br>  ReLU activation |   128 units <br>  ReLU activation |   26 units <br>  Softmax activation |     120,346      |       100      | ~7 minutes  |      81.80 %      |    81.05 %    |
| NN_relu_softmax_256_256 |   784 units   |   256 units <br>  ReLU activation |   256 units <br>  ReLU activation |   26 units <br>  Softmax activation |     273,434      |       100      | ~12 minutes |      85.67 %      |    84.77 %    |
| NN_relu_softmax_512_512 |   784 units   |   512 units <br>  ReLU activation |   512 units <br>  ReLU activation |   26 units <br>  Softmax activation |     677,914      |       100      | ~47 minutes |      88.97 %      |    87.57 %    |