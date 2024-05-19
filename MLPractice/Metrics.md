# 机器学习中的评估指标

在每不同的机器学习任务中，我们可以选择不同的评估指标。

情感分析（sentiment analysis）是自然语言处理（NLP）领域中的一个核心任务。其希望通过一些处理将一段话（或者一句话）根据情感属性进行分类。思考一个场景，你正在运营一个餐厅并希望训练一个模型，分析用户的评价到底是好的还是坏的。在经过一些数据采集后，你获得了一个 10,0000 条评论组成的数据集。你对其进行了数据标注发现其中 9,9000 条为正向的评价而有100条为负面的。

你选择了一个模型并进行了训练。由于数据集本身的不平衡，你的模型只学会了返回正结果。而如果从朴素的概率思考
$$
\begin{align}
P(\text{Correct}) &=\frac{\text{Count(Correct)}}{\text{Count(All)}}\\
&= \frac{9,9000}{10,0000}\\
&= 99\%

\end{align}
$$
你获得了一个非常非常高得正确率，但是这个模型毫无意义，因为它根本挑不出负面的评价！

## 情况分类

<table style="text-align: center">
    <tr>
        <th colspan="2"></th>
        <th colspan="2" style="text-align: center">事实</th>
    </tr>
    <tr>
        <th colspan="2"></th>
        <th colspan="1" style="text-align: center">真</th>
        <th colspan="1" style="text-align: center">假</th>
        <th></th>
    </tr>
    <tr>
        <td rowspan="2" style="writing-mode:vertical-lr">
        模型预测
        </td>
        <td>真</td><td>真阳性</td><td>伪阳性</td><td>精确率</td>
    </tr>
    <tr>
        <td>假</td><td>伪阴性</td><td>真阴性</td><td></td>
    </tr>
    <tr>
        <td colspan="2"></td><td>召回率</td><td colspan=""></td><td>准确率</td>
    </tr>
</table>

<table style="text-align: center">
    <tr>
        <th colspan="2"></th>
        <th colspan="2" style="text-align: center">Ground Truth</th>
    </tr>
    <tr>
        <th colspan="2"></th>
        <th colspan="1" style="text-align: center">True</th>
        <th colspan="1" style="text-align: center">False</th>
        <th></th>
    </tr>
    <tr>
        <td rowspan="2" style="writing-mode:vertical-rl">
        Prediction
        </td>
        <td>True</td><td>True Positive</td><td>False Positive</td> <td>Preicision</td>
    </tr>
    <tr>
        <td>False</td><td>False Negative</td><td>True Negative</td>
        <td></td>
    </tr>
    <tr>
        <td colspan="2"></td><td>Recall</td><td colspan=""></td><td>Accuracy</td>
    </tr>
</table>

如果我们把情况分类会发现有4种情况：

- 真阳性：事实和模型预测的结果都为真
- 真阴性：事实和模型预测的结果都为假
- 伪阳性：事实是阴性，但是模型预测为真，即模型预测的真其实是错误的
- 伪阴性：事实是阳性，但是模型预测为假，即模型预测的假其实是错误的

我们最朴素的认知的名字叫**准确率（Accuracy）**，其是所有正确的数量与所有数据的数量的比值，即：
$$
\text{Accuracy} = \frac{\text{True Positive + True Negative}}
{\text{True Positive + True Negative + False Positive + False Negative}}
$$
缩写即：
$$
\text{Acc} = \frac{\text{TP + TN}}
{\text{TP+TN+FP+FN}}
$$
于此同时我们还定义了 其它两个指标**精确率（Precision）**和**召回率（Recall）**：
$$
\text{Precision} = \frac{\text{True Positive}}
{\text{True Positive + False Positive}}
$$

$$
\text{Recall} = \frac{\text{True Positive}}
{\text{True Positive + False Negative}}
$$

为平衡精确性和召回率，我们创造了 $F_\beta$ score


$$
\begin{align}
F_\beta&=
\frac{1+\beta^2}{\frac{1}{\text{Precision}}+\frac{\beta^2}{\text{Recall}}}
\\
&=\frac{(1+\beta^2)\cdot\text{Precision}\cdot\text{Recall}}
{\beta^2\cdot\text{Precision}+\text{Recall}}

\end{align}
$$
而其中最有名的参数为 F1 指标，其是对精确率和召回率的特定比例，即：
$$
\begin{align}
F_1
&=
\frac{2}{\frac{1}{\text{Precision}}+\frac{1}{\text{Recall}}}
\\
&=\frac{2\cdot\text{Precision}\cdot\text{Recall}}
{\text{Precision}+\text{Recall}}

\end{align}
$$
不同指标通常会适用于不同场景。就拿之前的场景，其精确率为 $0 / (0 + 0)$ 而其召回率为 $0 / (0 + 100) = 0$。

对于伪阴性特别敏感的任务，例如医疗中的漏诊（宁可错杀也不放过），我们通常选择召回率作为指标。  
而对于伪阳性敏感的任务，例如垃圾邮件过滤（我们不希望有任何一封普通邮件被判定为垃圾邮件，因此如果不确定则会倾向于分类为普通邮件），我们通常使用精确性作为指标。