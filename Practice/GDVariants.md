# 梯度下降的变种

![NC](https://img.shields.io/badge/LH-Neural%20Compulation-red)
![ML](https://img.shields.io/badge/LH-Machine%20Learning-red)

梯度下降被定义为

$$
\mathbf{w} = \mathbf{w} - \eta \nabla J
$$

经典梯度下降通过对数据集所有数据进行遍历，计算梯度并更新参数。即对于整个数据集 $\nabla J$ 的期望，即其：

$$
\nabla J=
\mathbb{E}_{\mathbf{x}\in \mathcal{X}}\nabla{J_{\mathbf{w}}(\mathbf{x})}
=
\frac{1}{N}\sum^N_{i=1}\nabla{J_{\mathbf{w}}(\mathbf{x}_i)}
$$

这种做法在数据集很大的情况下，一次更新需要非常大量的计算。因此，有很多变种的梯度下降算法被提出，以减少计算量。


## 随机梯度下降（SGD）

随机梯度下降（Stochastic Gradient Descent, SGD）是梯度下降的一种变种。在每次迭代中，随机梯度下降只使用一个样本来计算梯度。这样，每次迭代的计算量大大减少。但是由于只使用一个样本，所以每次下降可能不一定总是指向最优方向。因此，SGD的收敛速度可能会变慢。

我们定义梯度的为：

$$
\nabla J=\nabla{J_{\mathbf{w}}(\mathbf{x}_i)}
$$

其中 $\mathbf{x}_i$ 是从数据集中随机抽取的一个样本。

## 小批量梯度下降（Mini-batch Gradient Descent）

SGD 因为每次只有一个样本，所以训练抖动很大。而传统梯度下降因为每次都要计算整个数据集，所以计算量很大。我们提出一个折中的方案：小批量梯度下降（Mini-batch Gradient Descent）。即每次迭代使用一个小批量的样本来计算梯度。这样，每次迭代的计算量虽然比SGD要大，但比传统梯度下降要小。而且小批量梯度下降的收敛速度通常比SGD要快。

我们定义每次采样 $b$ 个样本作为一个batch $B_t$，梯度为因此被定义为：

$$
\nabla J=
\mathbb{E}_{\mathbf{w}\in B_t}\nabla{J_{\mathbf{w}}(\mathbf{x})}
=
\frac{1}{|B_t|}\sum_{\mathbf{x}_i\in B_t}\nabla{J_{\mathbf{w}}(\mathbf{x}_i)}
$$

有两种方式从数据集中采样：
- replacement：在取出数据点后放回，即可以重复取
- without replacement：在取出数据点后不放回

通常来说 $b\in \{32, 64, 128\}$