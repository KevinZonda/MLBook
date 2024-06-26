# 逻辑回归

![AI1](https://img.shields.io/badge/LC-Artificial%20Inteligence%201-blue)
![NC](https://img.shields.io/badge/LH-Neural%20Compulation-red)

在学习完线性回归后，我们来学习逻辑回归。逻辑回归（Logistic Regression）是一种二元分类（Binary Classification）算法。分类算法故名思议就是将数据分为不同的类别。而二元则是表示分的类别总共由 2 个，我们可以将其命名为正类（Positive）和负类（Negative）。

## 定义问题

我们定义正类的标签 $y=1$ ，负类的标签 $y=0$。因此我们可以定义数据集为：

$$
\mathcal{D} = \{(\mathbf{x}_1, y_1), (\mathbf{x}_2, y_2), \ldots, (\mathbf{x}_n, y_n)\}
\\
\text{where } y_i \in \{0, 1\}
$$

理想情况下我们的模型接受输入一个向量 $\mathbf{x}\in \mathbb{R}^d$ ，输出一个其所属的分类 $y\in \{0, 1\}$。换句话说，我们想要寻找一个模型 $f: \mathcal{X}: \mathbb{R}^d\to \mathcal{Y}: \{0, 1\}$。

而对于直接输出一个类别，是很困难的。因此我们可以尝试输出一个概率值，用于表示样本属于正类的概率。这样我们可以通过设置一个阈值来判断样本属于哪个类别。因此我们将问题转化为：寻找一个模型 $f: \mathcal{X}\in\mathbb{R}^d\to \mathcal{Y}\in (0, 1)$。

逻辑回归被定义为一个线性模型，线性函数被定义为：

$$
\begin{align}
f(\mathbf{x}) &= \mathbf{w}^T\mathbf{x}
\end{align}
$$

## 从线性方程获得概率 $P(y=1)$

想从一个线性方程 $f(\mathbf{x}) = \mathbf{w}^T\mathbf{x}$ 获得一个概率$P$ 需要一些魔法操作，这是因为我们可以认为线性方程接受一个向量 $\mathbf{x}$ 并输出一个实数 $y\in \mathbb{R}$，而概率的定义域为 $[0, 1]$ 并不相同。我们需要一些额外操作来实现。

我们假设正类的概率为 $P(y=1)$ ，负类的概率为 $P(y=0)$。考虑我们只进行二元分类，因此我们可以认为：

$$
\begin{align}
P(y=0) + P(y=1) &= 1
\\
P(y=0) &= 1 - P(y=1)
\end{align}
$$

我们定义正负比 $\text{Odds}$ ，即正概率和负概率的比值为：

$$
\begin{align}
\text{odds}
&= \frac{P(y=1)}{P(y=0)}
\\
&= \frac{P(y=1)}{P(y\neq 1)}
\\
&= \frac{P(y=1)}{1-P(y=1)}
\end{align}
$$

我们可以将 $\text{odds}$ 转换为对数形式，即 $\text{Logit}$ 函数：

$$
\begin{align}
\text{Logit}(P(y=1))
&= \log \text{odds}
\\
&= \log \frac{P(y=1)}{1-P(y=1)}
\end{align}
$$

如果我们将 $P(y=1)$ 记为 $p$ 且令 $\log$ 为 $\ln$，则有：

$$
\begin{align}
\text{Logit}
&= \ln \frac{p}{1-p}
\end{align}
$$

考虑到 $\ln$ 函数的定义，其输出值为实数域 $\mathbb{R}$（即 $(-\infty, \infty)$），考虑其和线性模型输出空间一致，因此我们可以把这两个函数的输出进行拼接：

$$
\begin{align}
f(\mathbf{x}) = \mathbf{w}^T\mathbf{x} &= \text{Logit}
\\
\mathbf{w}^T\mathbf{x} &= \ln \frac{p}{1-p}
\\
e^{\mathbf{w}^T\mathbf{x}} &= e^{\frac{p}{1-p}}
\\
\exp(\mathbf{w}^T\mathbf{x}) &= \frac{p}{1-p}
\\
\frac{1-p}{p} &= \frac{1}{\exp(\mathbf{w}^T\mathbf{x})}
\\
\frac{1}{p} -1 &= \frac{1}{\exp(\mathbf{w}^T\mathbf{x})}
\\
\frac{1}{p} &=1+ \frac{1}{\exp(\mathbf{w}^T\mathbf{x})}
\\
p &=\frac{1}{1+ \frac{1}{\exp(\mathbf{w}^T\mathbf{x})}}
\\
p &=\frac{\exp(\mathbf{w}^T\mathbf{x})}{1+ \exp(\mathbf{w}^T\mathbf{x})}
\\
P(y=1) &=\frac{\exp(\mathbf{w}^T\mathbf{x})}{1+ \exp(\mathbf{w}^T\mathbf{x})}
\end{align}
$$

即如果线性函数的输出能学习到 $\text{Logit}$ 函数的输出，那么我们就可以得到一个概率值。

我们定义下列函数为 Sigmoid 函数：

$$
\begin{align}
\sigma(z) &= \frac{1}{1+e^{-z}}
\end{align}
$$

则我们可以将 $P(y=1)$ 表示为：

$$
\begin{align}
P(y=1) &= \sigma(\mathbf{w}^T\mathbf{x})
\end{align}
$$

因此我们可以定义我们最终的模型为：

$$
\begin{align}
f(\mathbf{x}) &= \sigma(\mathbf{w}^T\mathbf{x})
\end{align}
$$

其中 $\sigma$ 为 Sigmoid 函数。

这个模型接受一个向量 $\mathbf{x}$ 并输出一个分类为正类的概率值。

## 定义优化问题

定义完了这个模型该怎么算，我们该想想我们怎么去优化这个函数。对于逻辑回归，我们可以使用一个名为极大似然估计法的技术来优化这个函数。

考虑我们的数据集分为两类，即标签为正的数据集和标签为负的数据集。我们先从标签为正的数据集开始：

考虑这些标签为正，因此我们希望对于所有的标签，我们的模型输出的概率值越大越好。即我们可以尝试最大化所有正标签点的概率：

$$
\begin{align}
\max L^+ &= \prod_{\mathbf{x}_i\in \mathcal{X}, y_i = 1} f(\mathbf{x}_i)
\end{align}
$$

我们使用 $\log$ 函数来将其转换为求和形式：

$$
\begin{align}
\max \ln L^+ &= \ln \left( \prod_{\mathbf{x}_i\in \mathcal{X}, y_i = +1} f(\mathbf{x}_i) \right)\\
&= \sum_{\mathbf{x}_i\in \mathcal{X}, y_i = 1} \ln f(\mathbf{x}_i)\\
\end{align}
$$

考虑这些点 $y_i = 1$ ，而其余点 $y_i = 0$，因此我们可以将其改写为：

$$
\begin{align}
\max \ln L^+ &= \sum^{n}_{i=1} y_i\ln  f(\mathbf{x}_i)
\end{align}
$$

在此公式，对于所有负标签点 $\mathbf{x}^-$（$y^- = 0$），其在上式中的项会变成： $y^-\ln f(\mathbf{x}^-) = 0\times\ln f(\mathbf{x}^-) = 0$，即其对于上述式子并不会有什么影响。


而对于负样本，我们希望其被分类为负类的概率越大越好。而负标签的概率被定义 $1 - f(\mathbf{x})$，因此我们可以将其改写为：

$$
\max L^-=\prod_{\mathbf{x}_i\in \mathcal{X}, y_i = 0} (1-f(\mathbf{x}_i) )
$$

$$
\begin{align}
\max \ln L^- &= \ln \left( \prod_{\mathbf{x}_i\in \mathcal{X}, y_i = 0} (1-f(\mathbf{x}_i) )\right)\\
&= \sum_{\mathbf{x}_i\in \mathcal{X}, y_i = 0} \ln (1-f(\mathbf{x}_i))\\
\end{align}
$$

与正样本类似，我们可以改写当前式为：

$$
\begin{align}
\max \ln L^- &= \sum^{n}_{i=1} (1-y_i)\ln (1-f(\mathbf{x}_i))
\end{align}
$$

和正样本类似，对于正样本点 $\mathbf{x}^+$（$y^+ = 1$），其在上式中的项会变成： $(1-y^+)\ln (1-f(\mathbf{x}^+)) = 0\times\ln (1-f(\mathbf{x}^+)) = 0$，即其对于上述式子并不会有什么影响。而对于负样本点，其 $y^- = 0$，其在计算中的 $1-y_i$ 会变成 $1-0 = 1$，因此其对于上述式子会有影响。

于是我们可以将优化问题定义为：

$$
\begin{align}
\max \ln L &= \ln L^+ + \ln L^-\\
&= \sum^{n}_{i=1}
\left(
    y_i\ln  f(\mathbf{x}_i) + (1-y_i)\ln (1-f(\mathbf{x}_i))
\right)
\\

\left(
    y_i\ln  f(\mathbf{x}_i) + (1-y_i)\ln (1-f(\mathbf{x}_i))
\right)

\end{align}
$$

由于在机器学习中，我们更擅长最小化问题（我们有梯度下降，可以轻松优化最小化问题），因此我们可以将其转换为最小化问题：

$$
\begin{align}
\min -\sum^{n}_{i=1}
\left(
    y_i\ln  f(\mathbf{x}_i) + (1-y_i)\ln (1-f(\mathbf{x}_i))
\right)
\end{align}
$$

在此我们定义 $J$ 为损失函数，即：

$$
\begin{align}
J(\mathbf{w}) &= -\sum^{n}_{i=1}
\left(
    y_i\ln  f(\mathbf{x}_i) + (1-y_i)\ln (1-f(\mathbf{x}_i))
\right)
\end{align}
$$

我们使用梯度下降优化这个损失函数，以获得最佳的参数 $\mathbf{w}$：

$$
\begin{align}
\mathbf{w} &= \mathbf{w} -\eta
 \frac{\partial}{\partial \mathbf{w}}
 \left[-
\left(
    y_i\ln  f(\mathbf{x}_i) + (1-y_i)\ln (1-f(\mathbf{x}_i))
\right)
\right]

\\

&= \mathbf{w} -\eta
 \frac{\partial}{\partial \mathbf{w}}
 \left[-
\left(
    y_i\ln  \sigma(\mathbf{w}^T\mathbf{x}_i) + (1-y_i)\ln (1-\sigma(\mathbf{w}^T\mathbf{x}_i))
\right)
\right]
\end{align}
$$

## 伯努利视角

TODO: