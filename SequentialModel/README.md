# 序列模型 Sequential Model

序列信息是一类特殊的信息，考虑如下信息：

```
101010111011101110101010
```

相信很多人会意识到其是摩斯电码中表示 `SOS` 的序列。

如果我们的模型希望通过读取序列，从而识别序列内容通常会遇到很多问题。

## 挑战 1：不定长度的输入

而最基础的就是序列信息是**不定长**的。考虑我们之前几乎所有的模型，其都明确确定输入是一个 $d$ 维的向量，但是对于序列信息，例如摩斯电码信息，很多时候我们并不清楚其长度。

一些可能的做法是我训练一个其输入接受尽可能多的数据的模型。例如我们可以训练一个接受 $512$ 维度的数据的模型。但是其问题是很难训，计算消耗很大，而更重要的是可能创造出一个超过这个维度的数据。

我们将在后文讨论深度学习网络是怎么解决这个问题的。

## 挑战 2：不定长度的输出

如果我们将对话看作是序列信息的话，那么如果模型想回复一段信息的话也仍然会遇到和不定长输入相同的问题：模型可能会回复很短的话，例如 `OK!` 也可能发送一篇 300 字的作文。和不定长输入问题类似，我们可以训练一个可以输出超高输出维度的模型。而其也有和挑战 1 相同的问题。

## 挑战 3：顺序信息

序列信息通常顺序很重要，例如 `我爱你` 和 `你爱我` 虽然只是语序不同，但是其表达的含义完全不一样。因此我们需要一个模型可以理解输入的顺序。

在面对如此多的挑战，我们因此提出序列模型以解决这些问题。这一节，我们将讨论序列模型中的最经典的模型，包括 RNN、LSTM 和 Transformer。这些模型也都是目前大语言模型的基础。