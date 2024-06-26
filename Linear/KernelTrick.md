# 核技巧 Kernel Trick

![ML](https://img.shields.io/badge/LH-Machine%20Learning-red)

```admonish warning title="依赖提醒"
这一节内容依赖于 SVM 内容。如果你跳过了 SVM 也请跳过这一节。
```

上一节 SVM，我们定义了 $\kappa(\mathbf{x}, \mathbf{z})=\phi(\mathbf{x})^T\phi(\mathbf{z})$ 作为核函数。这里我们将在这一节更细节地讨论核技巧。

```admonish info title=""
核方法和核技巧本质上是相同的概念，只是在不同语境下使用的不同术语。
```


```admonish warning title=""
请不要将其和 CNN 中的卷积核混淆。它们是不同的概念。
```

## 空间变换

如果简单的去看待核函数，我们可以认为核函数是一个函数，其输入是两个向量，输出是一个标量。即 $\kappa: \mathcal{X} \times \mathcal{X} \rightarrow \mathbb{R}$。

从空间角度来看，其是将两个位于 $\mathcal{X}$ 空间的向量映射到一个新的标量空间 $\mathbb{R}$。而我们也称这个新的空间为再生核希尔伯特空间（RKHS）。

通过定义不同的输入空间 $\mathcal{X}$ 和映射函数 $\phi$，我们可以得到不同的核函数 $\kappa$。如果我们考虑图片、文本等等空间为  $\mathcal{X}$，如果我们能寻找到一个 $\phi$ 或者 $\kappa$，我们就可以对这些数据进行处理。例如对于自然语言处理领域，我们希望读取文本去进行一些操作，我们可以使用 TF-IDF 核以处理。

总的来说，核函数除了让我们可以处理非线性问题也可以让我们处理不同种类点数据。


## Mercer's Condition

直接寻找一个 $\phi$ 是一个困难的问题，甚至很多 $\phi$ 难以用方程表达出来。但是我们可以通过直接构建 $\kappa$ 而不去寻找 $\phi$ 来解决这个问题。

Mercer's Condition 是一个充分条件，如果一个函数 $M(\mathbf{x}, \mathbf{z})$ 满足 Mercer's Condition，那么我们可以认为 $M$ 是一个合法的核函数。因此我们就跳过寻找 $\phi$ 的过程，直接寻找 $\kappa$。

其定义为：
考虑所有点 $\mathbf{x}_i \in \mathcal{X}$，令定义函数 $M(\mathbf{x}, \mathbf{z})$ 的类 Gram 矩阵 $K$ 为 $K_{i, j}=M(\mathbf{x}_i,\mathbf{x}_j)$。我们假设 $\mathcal{X}$ 是有 $n$ 个元素的集合，那么 $K$ 是一个 $n \times n$ 的方阵，即

$$
K = \begin{bmatrix}
M(\mathbf{x}_1, \mathbf{x}_1) & M(\mathbf{x}_1, \mathbf{x}_2) & \cdots & M(\mathbf{x}_1, \mathbf{x}_n) \\
M(\mathbf{x}_2, \mathbf{x}_1) & M(\mathbf{x}_2, \mathbf{x}_2) & \cdots & M(\mathbf{x}_2, \mathbf{x}_n) \\
\vdots & \vdots & \ddots & \vdots \\
M(\mathbf{x}_n, \mathbf{x}_1) & M(\mathbf{x}_n, \mathbf{x}_2) & \cdots & M(\mathbf{x}_n, \mathbf{x}_n) \\
\end{bmatrix}
$$

那么，如果矩阵 $K$ 是
- 对称的（symmetric），即：
  - $K=K^T$ 或者说 $K_{i, j}=K_{j, i}$ 或者说 $M(\mathbf{x}, \mathbf{z})=M(\mathbf{z}, \mathbf{x})$
- 且是半正定的（Positive Semidefinite, PSD）记作 $K\succcurlyeq 0$
  - 即对于任何 $\alpha \in \mathbb{R}^n$，有 $\alpha^T K \alpha \geq 0$

则 $M$ 是一个合法的核函数。


## 组合核 Compositional Kernels

如果我们有两个核函数 $\kappa_1$ 和 $\kappa_2$，我们可以通过以下方式构建新的核函数：

$$
\begin{align}
\kappa(\mathbf{x}, \mathbf{z}) &= c \cdot \kappa_1(\mathbf{x}, \mathbf{z}) & \text{其中 } c\geq 0 \text{ 是常量}\\
\kappa(\mathbf{x}, \mathbf{z}) &= \kappa_1(\mathbf{x}, \mathbf{z}) + \kappa_2(\mathbf{x}, \mathbf{z}) & \\
\kappa(\mathbf{x}, \mathbf{z}) &= \kappa_1(\mathbf{x}, \mathbf{z}) \cdot \kappa_2(\mathbf{x}, \mathbf{z}) & \\
\kappa(\mathbf{x}, \mathbf{z}) &= e^{\kappa_1(\mathbf{x}, \mathbf{z})} &\\
\kappa(\mathbf{x}, \mathbf{z}) &= f(\mathbf{x}) \cdot \kappa_1(\mathbf{x}, \mathbf{z}) \cdot f(\mathbf{z}) & \text{其中 } f \text{ 是任意函数}\\
\kappa(\mathbf{x}, \mathbf{z}) &= q(\kappa_1(\mathbf{x}, \mathbf{z})) & \text{其中 } q \text{ 是任意非负系数多项式}
\end{align}
$$
