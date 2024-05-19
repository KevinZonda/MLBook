# 符号表

不同的人有不同的符号标记，而在这节中，我们将会介绍本读物一些常见的符号标记。

## 基础运算

| 符号 | 含义 | 符号 | 含义 |
| --- | --- | --- | --- |
| $\sum$ | 连加 | $\prod$ | 连乘 |
| $\max$ | 最大值 | $\min$ | 最小值 |
| $\argmax$ | 最大值的参数 | $\argmin$ | 最小值的参数 |
| $\log$ | 自然对数（通常底数为 $e$） | $\ln$ | 自然对数 |
| $\exp(x)$ | 指数函数 $e^x$ | $\sqrt{\cdot}$ | 开方 |
| $\frac{a}{b}$ | 分数 $\frac{a}{b}$ | $\mid{\cdot}\mid$| 绝对值 |
| $\infty$ | 无穷 | $e$ | 自然常数 |

## 集合

| 符号 | 含义 | 符号 | 含义 |
| --- | --- | --- | --- |
| $\mathbb{R}$ | 实数集 | $\mathbb{N}$ | 自然数集 |
| $\mathbb{Z}$ | 整数集 | $\mathbb{Q}$ | 有理数集 |
| $\mathbb{R}^+/\mathbb{R}^*$ | 正实数集 | $\mathbb{N}^+/\mathbb{N}^*$ | 正自然数集 |
| $\mathbb{R}^d$ | 由 $d$ 个属于 $\mathbb{R}$ 空间的元素组成的向量 | ||
| $\in$ | 属于 | $\notin$ | 不属于 |
| $\subset$ | 子集 | $\subseteq$ | 真子集 |
| $\cup$ | 并集 | $\cap$ | 交集 |
| $\emptyset$ | 空集 | $\mid \cdot \mid$ | 集合的基数（集合的长度） |

## 条件与逻辑

| 符号 | 含义 | 符号 | 含义 |
| --- | --- | --- | --- |
| $\forall$ | 对于所有 | $\exists$ | 存在 |
| $\rightarrow$ | 可以推导出（充分条件） | $\Leftrightarrow$ / $\leftrightarrow$ | 等价（充要条件） |

## 导数

| 符号 | 含义 | 符号 | 含义 |
| --- | --- | --- | --- |
| $f'(x)$ | 函数 $f$ 对 $x$ 的导数 | $f''(x)$ | 函数 $f$ 对 $x$ 的二阶导数 |
| $\frac{\partial f}{\partial x}$ | 对 $f$ 求 $x$ 的偏导数 |||
| $\nabla f(x)$ | 函数 $f$ 位于 $x$ 的梯度 | $H_f(x)$ | 函数 $f$ 位于 $x$ 的海森矩阵 |

## 线性代数

| 符号 | 含义 | 符号 | 含义 |
| --- | --- | --- | --- |
| $x$ | 实数  $x$  | $X$ | 矩阵 |
| $\mathbf{x}$ | 向量 $\mathbf{x}$ | $X_i$ | 矩阵 $X$ 的第 $i$ 行 |
| $\mathbf{x}^{(i)}$ | 向量 $\mathbf{x}$ 的第 $i$ 个元素 | $X_{i, j}$ | 矩阵 $X$ 第 $i$ 行 第 $j$ 列的元素 |
| $\mathbf{x}_i$ / $x_i$| 第 $i$ 个向量 $\mathbf{x}$ / 实数 $x$ | $X_{, j}$ | 矩阵 $X$ 第 $j$ 列 |
| $\vert \mathbf{x} \vert$ | 向量 $\mathbf{x}$ 的模（几何长度） | $\vert\vert \mathbf{x} \vert\vert$ | 向量 $\mathbf{x}$ 的范数（向量的模长是L2范数，即 $\vert \mathbf{x} \vert = \vert\vert \mathbf{x} \vert\vert_2 $）|
| $\mathbf{x}^T$ | 向量 $\mathbf{x}$ 的转置 | $X^T$ | 矩阵 $X$ 的转置 |

## 概率

| 符号 | 含义 | 符号 | 含义 |
| --- | --- | --- | --- |
| $P(A)$ | 事件 $A$ 的概率 | $P(A\mid B)$ | 在事件 $B$ 发生的条件下，事件 $A$ 发生的概率 |
| $P(A,B)$ | 事件 $A$ 和 $B$ 同时发生的概率 | $P(A\cup B)$ | 事件 $A$ 和 $B$ 至少有一个发生的概率 |
| $P(A\cap B)$ | 事件 $A$ 和 $B$ 同时发生的概率 | |
| $\mathbb{E}(X)$ | 随机变量 $X$ 的期望 | $\text{Var}(X)$ | 随机变量 $X$ 的方差 |
| $\sigma$ | 标准差 | $\sigma^2$ | 方差 |
| $\mu$ | 均值 |||
| $x \sim P$ | 随机变量 $x$ 服从概率分布 $P$ | $\mathcal{N}$ | 正态分布 |
| $\epsilon$ | 随机误差 |||

## 机器学习中的特定缩写

| 缩写 | 含义 | 缩写 | 含义 |
| --- | --- | --- | --- |
| $\mathcal{D}$ | 数据集 | $\mathcal{X}$ | 输入空间 |
| $\mathcal{Y}$ | 输出空间 | $\mathcal{Z}$ | 隐空间/特征空间 |
| $\mathbf{w}$ | 权重 | $\mathbf{x}$ | 输入数据 |
| $y$ | 输出数据 | $\hat{y}$ | 预测数据 |
| $f$ | 函数 | $h$ | 通常表示假说函数 |
| $\eta$ | 学习率 | | |


## 缩写

| 缩写 | 含义 | 缩写 | 含义 |
| --- | --- | --- | --- |
| $s.t.$ | subject to | $i.e.$ | 换句话说 |
| $w.r.t.$ | with respect to/关于 | $e.g.$ | 例如 |
| $i.i.d.$ | independent and identically distributed/独立且同分布 | |
