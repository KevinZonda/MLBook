# 非线性变换

![NC](https://img.shields.io/badge/LH-Neural%20Compulation-red)
![ML](https://img.shields.io/badge/LH-Machine%20Learning-red)

在学完线性回归和逻辑回归后你一定会有一个疑问，我们既然定义模型为线性函数，即我们只能拟合线性的情况，例如我们进行分类任务时，只能处理线性可分的情况。那如果遇到数据不能被线性函数分割，我们该如何处理呢？例如我们应该如何用线性模型来拟合一个二次函数呢？

非线性变换 Nonlinear Transformation 可以解决这个问题。

## 定义

我们可以通过对输入进行一定变换从而使得原本的线性特征变成非线性特征。

我们定义一个变换函数 $\phi: \mathbb{R}^d \to \mathbb{R}^k$ ，将原本的 $d$ 维特征转换为 $k$ 维特征。我们可以将原本的特征 $\mathbf{x}$ 通过 $\phi(\mathbf{x})$ 映射到更高维的空间 ，然后使用线性模型拟合 $\mathbf{w}^T\phi(\mathbf{x})$。

最简单的例子是对于输入空间 $\mathbf{x}\in \mathbb{R}^1$，即 $\mathbf{x} = \{ 1, x\}$，我们可以定义一个二次变换函数 $\phi(\mathbf{x}) = \{1, x, x^2\}$ ，然后使用线性模型拟合 $\mathbf{w}^T\phi(x)$。

通过这种映射，我们可以拟合很多非线性函数。

一些其他的变换例子是：

$$
\{1, x, y\} -\phi\to \{ 1, x, y, xy, y^2, x^2\}\\
\{1, x, y\} -\phi\to \{ 1, x, y, \sin x, \cos y\}
$$

## 代价

```admonish success title=""
We take the benefit, we pay the price.  
我们享受了好处，我们也需要付出代价。
```

非线性变化允许我们拟合更多的函数，但是也有一些代价。

升高输入维度同样也会导致升高权重的维度。例如

$$
\{1, x, y\} -\phi\to \{ 1, x, y, xy, y^2, x^2\}
$$

我们原来只需要 3 维的权重，而现在需要 6 维的权重。这会导致更多的计算量。

而最严重的则是权重爆炸。当我们的特征空间变得非常大时，我们的权重也会变得非常大。模型过度复杂会导致过拟合（模型只记住了数据集的点，而不能泛化）。

## 非侵入性

非线性变换是一种非侵入性的方法。我们可以在不改变原始数据的情况下，通过变换函数 $\phi$ 来拟合非线性函数。

因此非线性变化也不会影响我们推导出的公式（包括梯度、封闭解等），我们只是需要将公式内的 $X$ 替换为 $\Phi$（或 $\mathbf{x}$ 替换为 $\phi(\mathbf{x})$）。

例如对于线性回归，我们定义的封闭解公式为：

$$
\mathbf{w}^*=(X^TX)^{-1}X^T\mathbf{y}
$$

如果我们应用非线性变化 $X -\phi(\mathbf{x})\rightarrow\Phi$，我们因此则有：

$$
\mathbf{w}^*=(\Phi^T\Phi)^{-1}\Phi^T\mathbf{y}
$$
