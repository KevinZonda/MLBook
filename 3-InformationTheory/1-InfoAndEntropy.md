# 信息与熵

## 自信息（Self-Informaiton）

自信息是一个事件的信息量，用来衡量一个事件发生的意外程度。其是通过事件 $x$ 的概率来定义的。当 $P(x)$ 越大，事件发生的概率越大，那么自信息越小，其信息量越小。因此我们可以直觉定义如下：

$$
I'(x) = - P(x)
$$

由于引入对数函数不会影响函数的单调性，因此我们可以引入对数函数来定义自信息。

$$
I'(x) = - P(x)
\\
\downarrow
\\
I'(x) = -\log P(x)
$$

更严谨的定义是：对于随机变量 $x$，其拥有概率质量函数（PMF） $P_X(x)$，则其自信息定义为：

$$
\begin{align}
I_X(x) &= -\log P_X(x) \\
&= \log \frac{1}{P_X(x)}
\end{align}
$$

考虑 Logit，其定义用于表示一个事件发生的概率比，我们可以改写其公式：

$$
\begin{align}
\text{Logit}(P_X(x)) &= \log \frac{P_X(x)}{1-P_X(x)}
\\
&= \log P_X(x) - \log (1-P_X(x))
\\
&= \log P_X(x) - \log (P_X(\neg x))
\\
&= -I_X(x) + I_X(\neg x)
\\
&= I_X(\neg x) - I_X(x)
\end{align}
$$

## 熵（Entropy）

熵是用于衡量随机变量的不确定性（uncertainty）的度量。而不确定性我们可以认为是我们对低概率事件发生概率的期望。

换句话说，对于事件 $X$，如果发生我们低概率其发生的事件次数很多，则说明其越不确定。

因此我们可以认为熵是自信息的期望，即我们可以将熵定义为：

对于随机**离散**变量 $X$，其值域为 $\mathcal{R}_X=\{ x_1, x_2, \dots, x_n\}$，其概率密度函数为 $P_X(x)$，则其熵定义为：

$$
\begin{align}
H(X)
&\equiv \mathbb{E}[I_X(x)]\\
&\equiv -\sum_{x\in \mathcal{R}_X} P_X(x) \log P_X(x)\\


&\equiv \mathbb{E}\left[
    \log \frac{1}{P_X(x)}
\right]\\
&\equiv - \mathbb{E}\left[
    \log {P_X(x)}
\right]\\
\end{align}
$$

> 对于连续变量，我们会使用不同公式。具体请参照 [Wikipedia](https://en.wikipedia.org/wiki/Entropy_(information_theory)#Entropy_for_continuous_random_variables)。