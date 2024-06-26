# 向量和矩阵

这一节我们将会讨论向量和矩阵的基础概念，这些概念在机器学习中是非常重要的。

## 向量 Vector

高中中，可能不少同学已经接触过向量的概念，不过我们还是简单的复习一下。

向量在数学中表示一个有方向和大小的量，通常在坐标系用一个箭头表示，箭头的长度表示向量的大小，箭头的方向表示向量的方向。与向量相对应的是标量，标量是只有大小而没有方向的量。

```admonish note title="来自作者的建议"
你可以将向量看作是一个有序的数列，这个数列中的每一个元素都是一个标量。  
在机器学习中的绝大多数时间，我们将向量看待成一个存储了 $d$ 个数值的列表，而不去担心其具体的几何意义。
```

对于一个 $d$ 维的向量 $\mathbf{v}$ 其形式为：

$$
\mathbf{v} = \begin{bmatrix} v_1 \\ v_2 \\ \vdots \\ v_d \end{bmatrix}
$$

在机器学习中，我们通常认为向量是一个列向量，即是竖着的向量，而不是横着的。

```admonish note title="符号标记"
在高中，我们通常使用 $\overrightarrow{v}$ 或者 $\bar{v}$ 来表示向量，而在机器学习中，我们通常使用 $\mathbf{v}$ （粗体小写） 来表示向量。
```

向量的长度被定义为几何距离，即每一个维度的平方和的平方根：

$$
\left\| \mathbf{v} \right\| = \sqrt{v_1^2 + v_2^2 + \cdots + v_d^2}
$$

### 向量运算

向量的基础运算包括：

- 向量的加法
- 向量的减法
- 向量的乘法

#### 向量的加法

向量的加法是指两个向量的对应元素相加，即：

$$
\mathbf{v} + \mathbf{u} = \begin{bmatrix} v_1 \\ v_2 \\ \vdots \\ v_d \end{bmatrix} + \begin{bmatrix} u_1 \\ u_2 \\ \vdots \\ u_d \end{bmatrix} = \begin{bmatrix} v_1 + u_1 \\ v_2 + u_2 \\ \vdots \\ v_d + u_d \end{bmatrix}
$$

#### 向量的减法

向量的减法是指两个向量的对应元素相减，即：

$$
\mathbf{v} - \mathbf{u} = \begin{bmatrix} v_1 \\ v_2 \\ \vdots \\ v_d \end{bmatrix} - \begin{bmatrix} u_1 \\ u_2 \\ \vdots \\ u_d \end{bmatrix} = \begin{bmatrix} v_1 - u_1 \\ v_2 - u_2 \\ \vdots \\ v_d - u_d \end{bmatrix}
$$

#### 向量的乘法

向量的乘法是一个复杂的系统我们可以将其分为很多种情况。

向量的数乘：标量与向量的乘法是将标量与向量的每一个元素相乘，即：

$$
\alpha \mathbf{v} = \alpha \begin{bmatrix} v_1 \\ v_2 \\ \vdots \\ v_d \end{bmatrix} = \begin{bmatrix} \alpha v_1 \\ \alpha v_2 \\ \vdots \\ \alpha v_d \end{bmatrix}
$$

**向量的点乘（Dot Product）**：又叫内积（inner product）。点乘是指两个向量对应元素相乘再相加，即：

$$
\mathbf{v} \cdot \mathbf{u} = \begin{bmatrix} v_1 \\ v_2 \\ \vdots \\ v_d \end{bmatrix} \cdot \begin{bmatrix} u_1 \\ u_2 \\ \vdots \\ u_d \end{bmatrix} = v_1u_1 + v_2u_2 + \cdots + v_du_d
$$

向量的点乘有一个重要的性质，即：

$$
\mathbf{v} \cdot \mathbf{u} = \left\| \mathbf{v} \right\| \left\| \mathbf{u} \right\| \cos\theta
$$

其中 $\theta$ 为两个向量之间的夹角。

```admonish note title="符号标记"
在高中，我们通常使用 $\cdot$ 来表示点乘，而在机器学习中，我们通常使用 $\mathbf{v}^T\mathbf{u}$ 来表示点乘。我们将在后面的章节中详细介绍这个符号的含义。  
有些书籍中也使用 $\langle \mathbf{v}, \mathbf{u}\rangle$ 来表示两个向量的点乘。
```

#### 向量的转置（Transpose）

看到转置这个词，你可能会很困惑，不过不用担心，这个概念很简单。

简单来说，转置是将整个向量逆时针旋转 90 度。

对于向量的转置，对于向量来说就是将一个行向量转换为列向量，或者将一个列向量转换为行向量。即：

$$
\mathbf{v} = \begin{bmatrix} v_1 \\ v_2 \\ \vdots \\ v_d \end{bmatrix} \Rightarrow \mathbf{v}^T = \begin{bmatrix} v_1 & v_2 & \cdots & v_d \end{bmatrix}
$$

$$
\mathbf{v}^T = \begin{bmatrix} v_1 & v_2 & \cdots & v_d \end{bmatrix} \Rightarrow {\mathbf{v}^T}^T = \begin{bmatrix} v_1 \\ v_2 \\ \vdots \\ v_d \end{bmatrix}
$$

因此我们有一个非常良好的性质：

$$
\mathbf{v} = {\mathbf{v}^T}^T
$$

即转置的转置等于原向量。

我们通常使用转置来表示向量的点乘，即：

$$
\begin{align}
\mathbf{v}^T\mathbf{u} &= \mathbf{v} \cdot \mathbf{u}\\
&= \begin{bmatrix}
v_1,  v_2, \cdots, v_d
\end{bmatrix}
\begin{bmatrix}
u_1 \\ u_2 \\ \vdots \\ u_d
\end{bmatrix}\\

&= v_1u_1 + v_2u_2 + \cdots + v_du_d
\end{align}
$$

## 矩阵 Matrix

如果你已经掌握了向量的知识，那么矩阵就是一个非常简单的概念了。

矩阵是很多向量的集合，其表示为：

$$
M = \begin{bmatrix}
\vert & \vert&  & \vert\\

\mathbf{v}_1 & \mathbf{v}_2 & \cdots & \mathbf{v}_n\\
\vert & \vert&  & \vert\\

\end{bmatrix}
$$

我们通常使用大写字母来表示矩阵。

矩阵的大小通常表示为 $m \times n$，即有 $m$ 行 $n$ 列。因此我们也可以认为$d$ 维向量是一个 $d \times 1$ 的矩阵。

**方阵**是指行数和列数相等的矩阵，即 $m = n$。

### 矩阵运算

#### 转置 Transpose

矩阵的转置和向量的转置类似，即将矩阵的行和列互换：

$$
M = \begin{bmatrix}
\bigg| & \bigg|&  & \bigg|\\
\mathbf{v}_1 & \mathbf{v}_2 & \cdots & \mathbf{v}_n\\
\bigg\downarrow & \bigg\downarrow&  & \bigg\downarrow\\

\end{bmatrix}
\Rightarrow
M^T = \begin{bmatrix}
––– & \mathbf{v}_1^T &  \longrightarrow\\
––– & \mathbf{v}_2^T &  \longrightarrow\\
& \vdots         &  \\
––– & \mathbf{v}_n^T & \longrightarrow\\
\end{bmatrix}
$$

转置会让一个 $m \times n$ 的矩阵变为一个 $n \times m$ 的矩阵。其中，原本位于 $a$ 行 $b$ 列的元素，会在转置后位于 $b$ 行 $a$ 列。

和向量一样，矩阵的转置也有 $M = {M^T}^T$。


#### 矩阵的加法和减法

矩阵的加法和减法是指两个矩阵的对应元素相加或相减。因此两个矩阵必须有相同的大小。考虑两个矩阵 $A$ 和 $B$，其大小均为 $m \times n$，则：

$$
\begin{align}
    
A + B &= \begin{bmatrix}
a_{1,1} & a_{1,2} & \cdots & a_{1,n}\\
a_{2,1} & a_{2,2} & \cdots & a_{2,n}\\
\vdots & \vdots & \ddots & \vdots\\
a_{m,1} & a_{m,2} & \cdots & a_{m,n}\\
\end{bmatrix} + \begin{bmatrix}
b_{1,1} & b_{1,2} & \cdots & b_{1,n}\\
b_{2,1} & b_{2,2} & \cdots & b_{2,n}\\
\vdots & \vdots & \ddots & \vdots\\
b_{m,1} & b_{m,2} & \cdots & b_{m,n}\\
\end{bmatrix} \\
&= \begin{bmatrix}
a_{1,1} + b_{1,1} & a_{1,2} + b_{1,2} & \cdots & a_{1,n} + b_{1,n}\\
a_{2,1} + b_{2,1} & a_{2,2} + b_{2,2} & \cdots & a_{2,n} + b_{2,n}\\
\vdots & \vdots & \ddots & \vdots\\
a_{m,1} + b_{m,1} & a_{m,2} + b_{m,2} & \cdots & a_{m,n} + b_{m,n}\\
\end{bmatrix}

\end{align}
$$

减法同理。

#### 矩阵的数乘

矩阵的数乘是指一个标量与矩阵的每一个元素相乘。考虑一个矩阵 $A$，其大小为 $m \times n$，标量为 $\alpha$ 则：

$$
\alpha A

= \alpha \begin{bmatrix}
a_{1,1} & a_{1,2} & \cdots & a_{1,n}\\
a_{2,1} & a_{2,2} & \cdots & a_{2,n}\\
\vdots & \vdots & \ddots & \vdots\\
a_{m,1} & a_{m,2} & \cdots & a_{m,n}\\
\end{bmatrix}

= \begin{bmatrix}
\alpha a_{1,1} & \alpha a_{1,2} & \cdots & \alpha a_{1,n}\\
\alpha a_{2,1} & \alpha a_{2,2} & \cdots & \alpha a_{2,n}\\
\vdots & \vdots & \ddots & \vdots\\
\alpha a_{m,1} & \alpha a_{m,2} & \cdots & \alpha a_{m,n}\\
\end{bmatrix}
$$

#### 矩阵的乘法（点积）

矩阵的乘法是一个比较复杂的运算，其的运算规则被作者称为**横平竖直**。

考虑两个矩阵 $A$ 和 $B$，其大小分别为 $m \times n$ 和 $n \times p$，则其乘积 $C = AB$ 的大小为 $m \times p$。

矩阵的乘法的规则是：

$$
A = \begin{bmatrix}
a_{1,1} & a_{1,2} & \cdots & a_{1,n}\\
a_{2,1} & a_{2,2} & \cdots & a_{2,n}\\
\vdots & \vdots & \ddots & \vdots\\
a_{m,1} & a_{m,2} & \cdots & a_{m,n}\\
\end{bmatrix}

\quad
B = \begin{bmatrix}
b_{1,1} & b_{1,2} & \cdots & b_{1,p}\\
b_{2,1} & b_{2,2} & \cdots & b_{2,p}\\
\vdots & \vdots & \ddots & \vdots\\
b_{n,1} & b_{n,2} & \cdots & b_{n,p}\\
\end{bmatrix}
$$

$$
A = \begin{bmatrix}
- & A_{1,} & -\\
- & A_{2,} & -\\
 & \vdots & \\
- & A_{m,} & -\\
\end{bmatrix}

\quad

B = \begin{bmatrix}
| & | & \cdots & |\\
B_{,1} & B_{,2} & \cdots & B_{,p}\\
| & | & \cdots & |\\
\end{bmatrix}
$$


$$
\begin{align}
C &= AB\\
&= 
\begin{bmatrix}
- & A_{1,} & -\\
- & A_{2,} & -\\
 & \vdots & \\
- & A_{n,} & -\\
\end{bmatrix}
\begin{bmatrix}
| & | & \cdots & |\\
B_{,1} & B_{,2} & \cdots & B_{,n}\\
| & | & \cdots & |\\
\end{bmatrix}
\\
&= \begin{bmatrix}
A_{1,}B_{,1} & A_{1,}B_{,2} & \cdots & A_{1,}B_{,p}\\
A_{2,}B_{,1} & A_{2,}B_{,2} & \cdots & A_{2,}B_{,p}\\
\vdots & \vdots & \ddots & \vdots\\
A_{m,}B_{,1} & A_{m,}B_{,2} & \cdots & A_{m,}B_{,p}\\
\end{bmatrix}
\end{align}
$$

我们可以改写成：

$$
A = \begin{bmatrix}
- & \alpha_1 & -\\
- & \alpha_2 & -\\
 & \vdots & \\
- & \alpha_m & -\\
\end{bmatrix}

\quad

B = \begin{bmatrix}
| & | &  & |\\
\beta_1 & \beta_2 & \cdots & \beta_p\\
| & | &  & |\\
\end{bmatrix}
$$

$$
\begin{align}
C &= AB\\
&= 
\begin{bmatrix}
- & \alpha_1 & -\\
- & \alpha_2 & -\\
 & \vdots & \\
- & \alpha_m & -\\
\end{bmatrix}
\begin{bmatrix}
| & | &  & |\\
\beta_1 & \beta_2 & \cdots & \beta_p\\
| & | &  & |\\
\end{bmatrix}
\\
&= \begin{bmatrix}
\alpha_1 \beta_1 & \alpha_1 \beta_2 & \cdots & \alpha_1 \beta_p\\
\alpha_2 \beta_1 & \alpha_2 \beta_2 & \cdots & \alpha_2 \beta_p\\
\vdots & \vdots & \ddots & \vdots\\
\alpha_m \beta_1 & \alpha_m \beta_2  & \cdots & \alpha_m \beta_p \\
\end{bmatrix}
\end{align}
$$

上文描述了内积中的规则，即 $m \times n$ 的矩阵和 $n \times p$ 的矩阵相乘得到一个 $m \times p$ 的矩阵。记作 $(m \times n) \cdot (n\times p) \to (m \times p)$。

```admonish note title="为什么我们使用转置表示向量的点积?"
如果我们将向量看作一个 $d \times 1$ 的矩阵，则如果想使用和矩阵一致的乘法规则，则需要使得将原来 $(1\times d) \cdot (1\times d)$ 的运算其转化为 $(1 \times d) \cdot (d \times 1)$，最终会得到一个 $1 \times 1$ 的矩阵，即一个标量。而这个对于第一个乘子，我们就需要使用转置，即 $(d \times 1)^T \cdot (d \times 1) = (1 \times d) \cdot (d \times 1) = (1 \times 1)$。这也是为什么我们使用 $\mathbf{v}^T\mathbf{u}$ 来表示向量的点乘。
```