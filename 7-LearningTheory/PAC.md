# PAC 框架

PAC 框架，即 Probably Approximately Correct。它提供了一种理论保证，即在一定的置信水平下，学习算法能够在有限的样本上近似地学习目标概念。

我们继续考虑霍夫定不等式：

$$
P[|E_{\text{in}}(h) - E_{\text{out}}(h)| > \epsilon] \leq 2Me^{-2\epsilon^2N}
$$

## Probably

从 Probably 来说：

$$
\textcolor{red}{P[}
|E_{\text{in}}(h) - E_{\text{out}}(h)|> \epsilon
\textcolor{red}{]}
 \leq 2Me^{-2\epsilon^2N}
$$

霍夫定不等式使用概率去作为计量方式去量化错误。

## Approximately

$$
P[|
\textcolor{red}{E_{\text{in}}(h) - E_{\text{out}}(h)} 
|> \epsilon ]\leq 2Me^{-2\epsilon^2N}
$$

样本内错误（$E_{\text{in}}$）是样本外错误（$E_{\text{out}}$）的近似值（approximation）。而近似的误差使用 $\epsilon$ 控制。

## Correct

$$
P[|E_{\text{in}}(h) - E_{\text{out}}(h)|> \epsilon ]

\textcolor{red}{\leq 2Me^{-2\epsilon^2N}}
$$

样本内错误是样本外错误近似值的误差是用右侧的霍夫定不等式去约束的。精度是由 $N$ 和固定的 $\epsilon$ 进行控制。

