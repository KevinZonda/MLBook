# 多层感知机（MLP）aka FFNet

![NC](https://img.shields.io/badge/LH-Neural%20Compulation-red)

![](./img/MLP.png)

多层感知机（Multilayer Perceptron, MLP）又叫前馈神经网络（Feed-Forward Network, FFNet）是一个通过多个层组成的神经网络，每个层有多个神经元。其拥有输入层、隐藏层和输出层。每个神经元接收上一层的输出，通过加权和激活函数输出到下一层。如果这个网络拥有超过一层隐藏层，我们则称之为深度神经网络（Deep Neural Network, DNN）。

## 工作机制

![](./img/MLP-forward.png)

上图表示了输入层第一个元素向前传播（forward pass）的过程。输入层接收输入信号，通过加权和激活函数输出到隐藏层。隐藏层接收上一层的输出，通过加权和激活函数输出到下一层。输出层接收隐藏层的输出，通过加权和激活函数输出到输出层。

## 全连接层（FC Layer）

TODO

## 激活函数

## 实践上的差异

尽管我们可以一个一个分别实现每个感知机和其输出层之间的连接（和权重），但是实际上我们通常使用矩阵运算来实现。

考虑层输入参数为 $x_1, x_2, \cdots, x_m$，其输出为 $y_1, y_2, \cdots, y_n$。那么我们可以制作权重矩阵 $W_{m \times n}$，偏置矩阵 $b_{n\times 1}$，即 `W : (n_feature, n_output), b : (n_output,)`。

考虑输入矩阵 `X : (n_sample, n_feature)`，其输出矩阵 `Y : (n_sample, n_output)`。那么我们可以通过矩阵运算来计算输出矩阵。

$$
Y = XW + b
$$

其矩阵形状的变化可以被描述为 `(n_sample, n_feature) x (n_feature, n_output) + (n_feature,) -> (n_sample, n_output)`。


## 优化

如果我们把原图中的输出当作预测值，最直觉的方法我们可以通过计算预测值和真实值的差距来优化网络。我们可以通过梯度下降来优化网络。

但是我们应该怎么样去求梯度变成了问题，我们可以通过反向传播（Backpropagation）来求解。反向传播是一种通过计算图的方式来求解梯度的方法。我们可以通过链式法则来求解梯度。我们将在下一章介绍。