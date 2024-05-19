# 机器学习中的评估指标

<table style="text-align: center">
    <tr>
        <th colspan="2"></th>
        <th colspan="2" style="text-align: center">事实</th>
    </tr>
    <tr>
        <th colspan="2"></th>
        <th colspan="1" style="text-align: center">真</th>
        <th colspan="1" style="text-align: center">假</th>
    </tr>
    <tr>
        <td rowspan="2" style="writing-mode:vertical-lr">
        模型预测
        </td>
        <td>真</td><td>真阳性</td><td>伪阳性</td> <td>精确率</td>
    </tr>
    <tr>
        <td>假</td><td>伪阴性</td><td>真阴性</td>
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
    </tr>
    <tr>
        <td rowspan="2" style="writing-mode:vertical-rl">
        Prediction
        </td>
        <td>True</td><td>True Positive</td><td>False Positive</td> <td>Preicision</td>
    </tr>
    <tr>
        <td>False</td><td>False Negative</td><td>True Negative</td>
    </tr>
    <tr>
        <td colspan="2"></td><td>召回率</td><td colspan=""></td><td>Accuracy</td>
    </tr>
</table>