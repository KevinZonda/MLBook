# 卷积神经网络 CNN

![AI2](https://img.shields.io/badge/LI-Artificial%20Inteligence%202-green)
![NC](https://img.shields.io/badge/LH-Neural%20Compulation-red)
![CV](https://img.shields.io/badge/LH-Computer%20Vision-red)


卷积（Convolution）、填充（Padding）、步长(Stride)

## 卷积层 Convolutional Layer

## 动机

现实生活中，人们会根据不同特征去分辨不同的事物，例如对于香蕉是黄色的，是弯曲的长条状物体，而苹果则是红色且圆的物体
因此我们就拥有了两个特征：红色和形状
而卷积的目的则是让机器自动学习这些特征。

对于一个图片，计算机通常会有几个参数，分辨率，和每个像素的RGB值和位深。例如对于一张 1920px x 1080px 的图片。其一共有xxx像素。而每个像素有不同颜色，计算机使用RGB表示颜色，即分别存储红色，绿色，蓝色三个的值。位深则表示每个颜色的取值范围，例如8位深表示每个颜色有2^8种可能性，即256种，因此颜色取值则为 $[0, 256)$ 或 $[0,255]$。 因此对于一张500x500的图片，如果将其作为输入，则拥有 750000 个输入值。对于直接作为MLP的输入，显然会导致过大的参数量（过复杂的模型非常容易过拟合）。而这也是卷积层最重要的作用，压缩参数。

## 实现

卷积通过一个名为过滤器（filter）或者说核（kernel）进行计算。我们下称其为过滤器。

过滤器是一个为 $L \times W$ 大小的矩阵，其与原数据进行 Hadamard 乘积并将所有结果总和将 $L \times W$ 的数据映射到一个标量。

stride或者说步长表示这个过滤器每次移动几格。


需要大量配图

> CNN 不具备旋转不变性 也不具备 尺度不变性
