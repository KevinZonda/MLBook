# 从导数到偏导数

## 导数

我们在高中了解过 $f'(x)$ 表示 $f(x)$ 的导数。导数是函数在某一点的切线斜率，也可以理解为函数的变化率。

对于导数 $f'(x)$ 我们也可以认为其是函数 $f$ 相对于自变量 $x$ 的变化率，因此可以写成：

$$
f'(x) = \frac{d f}{d x}
$$

## 偏导数

但是如果我们的函数拥有多个自变量会怎么样呢？例如：

$$
g(x_1, x_2, x_3) = 3x_1^3x_2 + 2x_2^2 + 4x_3
$$

在此情况，如果我们需要考虑 $x_1$ 的变化率，我们需要将 $x_2$ 和 $x_3$ 视为常数，然后对 $x_1$ 求导。因此我们引入了偏导数的概念。

偏导数是多元函数在其他自变量固定的情况下，一个自变量的变化率。因此偏导数的计算方法与导数类似，只是需要将其它变量视为常数。

我们假设需要求解上文中的 $g$ 相对于 $x_1$ 的偏导数，我们可以将 $x_2$ 和 $x_3$ 视为常数，然后对 $x_1$ 求导：

$$
\begin{align}
    \frac{\partial g}{
        \partial \textcolor{red}{x_1}} 

    &=  \frac{\partial}{\partial x_1} 
    \underbrace{3\textcolor{red}{x_1}^3\overbrace{\textcolor{blue}{x_2}}^{视作常量}}_{关于 x_1的量} + \underbrace{2\overbrace{\textcolor{blue}{x_2}^2}^{视作常量} + 4\overbrace{\textcolor{blue}{x_3}}^{视作常量}}_{常量}\\
    &= 9x_2x_1^2
\end{align}
$$

某点的偏导数可以解释为该点处函数图像的切线斜率在对应方向的分量，如对于三元函数 $f(x, y, z)$关于自变量 $x$的偏导数记作 $\frac{\partial f}{\partial x_{y, z}}$，简记为 $\frac{\partial f}{\partial x}$。对于一元函数$f(x)$，其偏导数 $\frac{\partial f}{\partial x}$就是导数 $f'(x)$。

在关于自变量 $x$ 偏导数的计算中，我们只需将其它变量视为常数，然后按照一元函数求导方法进行求导即可。此外，一元函数求导的一些规则（如链式法则）同样适用于偏导数。


## $\nabla$ 算子（梯度）

Nabla 算子 $\nabla$（又叫倒三角算符，三角算子等）是我们在机器学习中常用的运算符。其是一个包含关于所有自变量偏导数的向量。

Nabla 算子听上去很抽象，实际上也很抽象。我们还是考虑上文中的函数 $g$，其拥有三个自变量 $x_1, x_2, x_3$，我们可以将其 $\nabla g$ 表示为：

$$
\nabla g(x_1, x_2, x_3) =
    \left[
        \frac{\partial g}{\partial x_1},
        \frac{\partial g}{\partial x_2},
        \frac{\partial g}{\partial x_3}
    \right]^T
$$

```admonish note title=""
这里使用了转置符号 $^T$，表示将行向量转换为列向量。
```

由于机器学习经常将多个变量表现为向量 $\mathbf{x}=[x_1, x_2,..., x_N]^T$。如果考虑函数 $L$ 为多变量函数，我们希望其对于向量 $\mathbf{w}$ 的偏导数，我们可以得到：

$$
\nabla L(\mathbf{w}) = \begin{matrix}
    \begin{bmatrix}
        \frac{\partial L}{\partial \mathbf{w}_{(1)}}\\
        \frac{\partial L}{\partial \mathbf{w}_{(2)}}\\
        \vdots\\
        \frac{\partial L}{\partial \mathbf{w}_{(n)}}
    \end{bmatrix}
\end{matrix}
$$

由于其包含了相对于所有自变量的偏导数，因此我们也称其为梯度（与一元情况的斜率类似）。

```admonish note title="电磁学"
与梯度类似，散度是纳布拉算子与场强的标积，旋度是纳布拉算子与场强的矢积，如果读者学习过电磁学可能会对此感到熟悉。
```