$$
f(\mathbf{x})=\mathbf{w}^T\mathbf{x}
$$

$$
\mathcal{D}= \{(\mathbf{x}_1,y_1),\ldots,(\mathbf{x}_n,y_n)\}
$$

$$
\mathcal{X} : \mathbb{R}^d\\
\mathcal{Y} : \mathbb{R}\\
$$

$$
f(\mathbf{x}) : \mathcal{X} : \mathbb{R}^d \rightarrow
                \mathcal{Y} : \mathbb{R}\\
\mathbf{x} \in \mathbb{R}^d, \mathbf{w} \in \mathbb{R}^d, y \in \mathbb{R}
$$

那我们应该如何去寻找到最终最佳的$\mathbf{w}$呢？我们需要定义一个函数，叫损失函数。其用于衡量我们的预测值与真实值之间的差距。如果我们能通过某些手段最小化这个损失函数，我们也就相当于让模型可以学习到最佳的$\mathbf{w}$。这个过程就是我们所说的训练过程。

而线性回归模型的损失应该怎么定义呢？相信聪明的小朋友已经知道了！我们可以通过计算预测值与真实值之间的差距来定义损失函数。我们可以考虑 $y_i-\bar{y}_i$ 的距离。那么我们可以定义损失函数为：

$$
J(y, \bar{y}) = \frac{1}{n}\sum_{i=1}^{n}(y_i - \bar{y}_i)^2\\
 = \frac{1}{n}\sum_{i=1}^{n}(y_i - \mathbf{w}^T\mathbf{x})^2\\
$$

因此目前我们尝试最小化成本函数

$$
\min \frac{1}{n}\sum_{i=1}^{n}(y_i - \mathbf{w}^T\mathbf{x})^2\\
\downarrow\\
\min \frac{1}{2n}\sum_{i=1}^{n}(y_i - \mathbf{w}^T\mathbf{x})^2
$$

优化目标函数
$$
\begin{align}

\frac{\partial J}{\partial \mathbf{w}} &=
\frac{\partial}{\partial \mathbf{w}}    \frac{1}{2n}\sum_{i=1}^{n}(\mathbf{w}^T\mathbf{x}_i - y_i)
\\
&= \frac{\partial}{\partial \mathbf{w}}    \frac{1}{2n}\sum_{i=1}^{n}(\mathbf{w}^T\mathbf{x}_i\mathbf{w}^T\mathbf{x}_i + y_i^2-2\mathbf{w}^T\mathbf{x}_iy_i)
\\
&=\frac{1}{2n}\sum_{i=1}^{n}(2\mathbf{x}_i^2\mathbf{w}-2\mathbf{x}_iy_i)
\\
&=\frac{1}{n}\sum_{i=1}^{n}(\mathbf{x}_i^2\mathbf{w}-\mathbf{x}_iy_i)

\end{align}
$$

考虑一个函数的极值点只存在于导数为0的点，因此
$$
\begin{align}

\frac{\partial J}{\partial \mathbf{w}}&=0\\
\frac{1}{n}\sum_{i=1}^{n}(\mathbf{x}_i^2\mathbf{w}-\mathbf{x}_iy_i)&=0\\
\sum_{i=1}^{n}(\mathbf{x}_i^2\mathbf{w}-\mathbf{x}_iy_i)&=0\\
\sum_{i=1}^{n}(\mathbf{x}_i^2\mathbf{w})-\sum_{i=1}^{n}(\mathbf{x}_iy_i)&=0\\
\mathbf{w}\sum_{i=1}^{n}(\mathbf{x}_i^2)-\sum_{i=1}^{n}(\mathbf{x}_iy_i)&=0\\
\mathbf{w}&=\frac{\sum_{i=1}^{n}(\mathbf{x}_iy_i)}{\sum_{i=1}^{n}(\mathbf{x}_i^2)}

\end{align}
$$
