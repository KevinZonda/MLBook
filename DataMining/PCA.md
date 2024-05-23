# PCA 降维

PCA 算法是一个经典的降维算法，即其是将一个高维数据通过一系列运算得到一个低维运算。用数学表示为：

$$
\begin{align}
&\text{PCA} : \mathcal{X} \in \mathbb{R}^{n \times m} \to \mathcal{Y} \in \mathbb{R}^{r \times m}
\\
\text{where } &r < n
\end{align}
$$


因此当 $X \in \mathcal{X}$，$Y = \mathcal{Y}$，我们最直觉的想法是寻找一个矩阵 $P$ 使得：

$$
Y = P X
$$

其中 $X$ 是原始数据，$Y$ 是降维后的数据。而 $P$ 是我们需要寻找的矩阵。

因此我们可以定义 $P \in \mathbb{R}^{r \times n}$。（即 $Y_{(r \times m)} = P_{(r\times n)} \cdot X_{(n\times m)}$）

## 基变换

基变换是一个复杂的概念，其解释了线性系统中的向量如何在不同的坐标系中表示。

## Reference

- [【机器学习】降维——PCA（非常详细） - 知乎](https://zhuanlan.zhihu.com/p/77151308)