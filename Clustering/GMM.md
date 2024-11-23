# 高斯混合模型 GMM

高斯混合模型 GMM 是一个无监督学习，假设数据是由多个高斯分布混合而成的。

我们假设将数据分成 $K$ 个高斯分布，我们可以写作 $\mathcal{N}(\mu_k, \Sigma_k)$，其中 $\mu_k$ 是均值，$\Sigma_k$ 是协方差矩阵，简记作 $\theta_k = (\mu_k, \Sigma_k), \mathcal{N}_k = \mathcal{N}(\mu_k, \Sigma_k)$。

因此我们可以把数据 $x$ 对于第 $k$ 个高斯分布的概率写作：

$$
p(x \mid \theta_k) = \mathcal{N}_k(x)
= \mathcal{N}(x \mid \mu_k, \Sigma_k)
$$

如果我们用指示变量（indicator variable），表示某个数据点属于哪个高斯分量，则可以写作：

$$
p(x \mid z = k) = \mathcal{N}_k(x)
$$

考虑 $z$ 和 $x$ 是 iid 的，因此其联合分布可以写作：

$$
p(x, z)
= p(x \mid z) p(z)
$$

而 $z$ 并非是观测出来的值，因此我们称其为隐变量（latent variable）。

考虑我们有 $k$ 个高斯分布，我们需要知道我们怎么混合这个高斯分布。我们可以用 $\phi$ 表示，即我们可以认为 $\phi_j$ 为数据点属于第 $j$ 个高斯分布权重，假设有 3 个高斯分布，且 $\phi = [0.3, 0.5, 0.2]$，则数据点属于第 1 个高斯分布的概率为 0.3，属于第 2 个高斯分布的概率为 0.5，属于第 3 个高斯分布的概率为 0.2。$\phi$ 控制着各个高斯分量在混合模型中的"比重"，实际上定义了多项分布（Multinomial）的参数，这个分布用于随机选择使用哪个高斯分量。即：

$$
z \sim \text{Multinomial}(\phi) \text{ where }\sum ^k _{j=1 } \phi_j = 1
$$


