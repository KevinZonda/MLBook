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

而 $z$ 并非是观测出来的值，因此我们称其为隐变量（latent variable）。