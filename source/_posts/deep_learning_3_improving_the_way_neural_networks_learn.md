---
title: Deep Learning - 3 改进神经网络的学习方式
date: 2018-05-06 11:28:23
categories:
- Deep Learning
tags:
- Data Analysis
- Machine Learning
- Deep Learning
- Neural Networks
- Backpropagation
---

反向传播算法是大多数神经网络的基础，我们应该多花点时间掌握它。

还有一些技术能够帮助我们改进反向传播算法，从而改进神经网络的学习方式，包括：

- 选取更好的代价函数
- 正则化方法
- 初始化权重的方法
- 如何选择网络的超参

## Cost Function

这里来看一个非常简单的神经元，我们输入1，期望它输出0。

![](https://ws1.sinaimg.cn/large/006tKfTcgy1fr1gu9e1glj308v03bjr7.jpg)

我们看看 Gradient Descent 是如何帮助我们学习 Weights 和 Biases 的。

### Round 1

我们的初始值如下：
$$
Weight = 0.6 \\
Bias = 0.9 \\
\eta = 0.15
$$
![](https://ws1.sinaimg.cn/large/006tKfTcgy1fr1gtjoj3hj30e3084q32.jpg)

这个神经元的初始输出是 0.82 。

我们看到神经元能够迅速地学习 Weights 和 Biases ，经过300 epoch 的学习，最终输出是 0.09，已经很接近我们的预期 0 ，这个结果已经足够好了。

### Round 2

我们修改下初始值，再来看下：
$$
Weight = 2 \\
Bias = 2 \\
\eta = 0.15
$$
![](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1h35f8i6j30e4080aa7.jpg)

这个神经元的初始输出是 0.98 。

尽管 Learning Rate 一样，但是我们看到学习在一开始非常缓慢。看起来在前150 epoch ，Weights 和 Biases 都没有改变太多。

从这个例子我们可以看出，人工神经元在误差很大的时候，学习遇到了问题，学习速度变慢了。

### 为什么学习速度变慢

神经元的学习方式：

通过计算代价函数的偏导 $\frac{\partial C}{\partial w}$ 和 $\frac{\partial C}{\partial b}$ 来改变 Weights 和 Biases 。

我们说学习速度变慢，实际上是在说偏导很小。

### 为什么偏导很小

我们的代价函数是均方误差代价函数
$$
C = \frac{ (y-a)^2 }{2}
$$

- a是x=1时神经元的输出
- y=0是期待的输出

在激活函数是Sigmoid函数时
$$
a = \sigma(z) \\
z = wx+b
$$
代价函数的偏导是
$$
\frac{\partial C}{\partial w} = (a-y) \sigma'(z) x \\
\frac{\partial C}{\partial b} = (a-y) \sigma'(z) \\
$$
当x=1，y=0时
$$
\frac{\partial C}{\partial w} = a \sigma'(z) \\
\frac{\partial C}{\partial b} = a \sigma'(z) \\
$$
我们来看下Sigmoid函数的形状

![](https://ws1.sinaimg.cn/large/006tKfTcgy1fr1iygklo3j30bj07tdfw.jpg)

当神经元的输出接近1时，曲线变得非常平缓，$\sigma'(z)$ 就变得非常小，从而 代价函数的偏导 $\frac{\partial C}{\partial w}$ 和 $\frac{\partial C}{\partial b}$ 也会变得非常小。

这就是学习速度变慢的根源。

### Cross Entropy Cost Function

那么，我们换个代价函数能不能解决上面的问题？

再看拥有多个输入变量神经元模型

![](https://ws2.sinaimg.cn/large/006tKfTcgy1fr1jc75wypj308j0480sl.jpg)
$$
z = \sum_j w_j x_j + b
$$

- 这里 z 是输入的加权求和。

我们为这个神经元定义交叉熵代价函数如下：
$$
  C = -\frac{1}{n} \sum_x \left[y \ln a + (1-y ) \ln (1-a) \right]
$$

- n是训练数据的个数
- 求和是针对所有训练输入样本x
- y是我们对每个样本x所期望的相应地输出

#### 均方误差代价函数和交叉熵代价函数都有两个特点

##### 交叉熵是正数

1. 由Sigmoid激活函数的特性可以知道，激活值a的取值介于0和1之间，它们的对数是负数
2. 求和后的数是负数
3. 整个等式前面有一个符号，最终$C>0$

##### 当所有输入x的输出都能接近期望输出y时，代价函数接近0

比如对于样本x，它的
$$
y = 0 \\
a \approx 0
$$
这样，等式的第一项就是0

![](https://ws2.sinaimg.cn/large/006tKfTcgy1fr1kv1gy4ej30ba0cmtaa.jpg)

从图上可以看出，等式的第二项$\ln(1-a) \approx 0$

对于样本x
$$
y = 1 \\
a \approx 1
$$
等式的第二项为0

等式的第一项$\ln a \approx 0$

上面两种情况，交叉熵代价函数都约等于0

#### 交叉熵独有的特点

先看下交叉熵关于权重的偏导
$$
\begin{eqnarray}
  \frac{\partial C}{\partial w_j} & = & -\frac{1}{n} \sum_x \left(
    \frac{y }{\sigma(z)} -\frac{(1-y)}{1-\sigma(z)} \right)
  \frac{\partial \sigma}{\partial w_j} \tag{58}\\
 & = & -\frac{1}{n} \sum_x \left( 
    \frac{y}{\sigma(z)} 
    -\frac{(1-y)}{1-\sigma(z)} \right)\sigma'(z) x_j.
\tag{59}\end{eqnarray}
$$
通分简化后
$$
\begin{eqnarray}
  \frac{\partial C}{\partial w_j} & = & \frac{1}{n}
  \sum_x \frac{\sigma'(z) x_j}{\sigma(z) (1-\sigma(z))}
  (\sigma(z)-y).
\tag{60}\end{eqnarray}
$$
我们知道$\sigma'$
$$
\sigma(z) = \frac{1}{1+e^{-z}} \\
\sigma'(z) = \sigma(z)(1-\sigma(z))
$$
代入到上面的公式中
$$
\frac{\partial C}{\partial w_j} = \frac{1}{n} \sum_x x_j(\sigma(z)-y)
$$
从交叉熵关于权重的偏导中，我们看到权重的学习速率可以是被输出结果的误差所控制。

之前均方误差关于权重的偏导中，误差太大导致$\sigma'(z)$非常小，造成学习速度非常慢。

现在交叉熵关于权重的偏导中，$\sigma'(z)$被抵消掉了，因此不会担心误差太大会导致学习速度慢。相反，误差越大我们的神经元学习速率越大。

### Round 3

再来看看使用交叉熵代价函数时的学习速度。
$$
Weight = 0.6 \\
Bias = 0.9 \\
\eta = 0.15
$$
![](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1mj5ladyj30e7081aa5.jpg)

对于交叉熵代价函数而言，Learning Rate = 0.15 太高了，学得太快，以至于我们看不清楚代价函数的值是如何变化的。

这里将 Learning Rate 换成 0.005 再看一次。
$$
Weight = 0.6 \\
Bias = 0.9 \\
\eta = 0.005
$$
![](https://ws3.sinaimg.cn/large/006tKfTcgy1fr1mmeoonvj30e407v74e.jpg)

我们看到和之前一样好。

### Round 4

$$
Weight = 2 \\
Bias = 2 \\
\eta = 0.005
$$

![](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1mnswupfj30e907ut8u.jpg)

我们看到误差太大没有导致学习速度变慢。

## Softmax

激活函数除了Sigmoid，还有Softmax。

第j个输出神经元的激活值 $a_j^L$ 是
$$
a_j^L = \frac{e^{z_j^L}}{\sum_k e^{z_k^L}}
$$
分母是对所有输出神经元求和。

从公式我们可以看出，Softmax层的所有输出激活值都是正数，并且它们加起来和为1。

这样就可以把Softmax层得到的输出看作是一个概率分布，将数据激活值 $a_j^L$看作是神经网络认为结果是 j 的概率。

### Softmax的单调性

函数的单调性，指函数的自变量增大或减小，函数值也增大或减小。

Softmax也有这样的特性，当加权输入 $z_j^L$ 增加时，激活值 $a_j^L$ 也增加。

### Softmax的非局部性

sigmoid层的第j个神经元的输出是
$$
a_j^L = \sigma(z_j^L)
$$
它是只关于第j个神级元的加权输入的一个函数。

而 Softmax 层的任何一个 $a_j^L$ ，都要依赖该层所有神经元的加权输入。

### 反转Softmax层

我们有一个带有Softmax层的神经网络，已知激活值，那么加权输入为：
$$
z_j^L = \ln a_j^L + C
$$

### Log-Likelihood Cost Function

Sigmoid 输出层与 Cross-Entropy 代价函数搭配

Softmax 输出层与 Log-Likelihood 代价函数搭配

Log-Likelihood 代价函数的公式是：
$$
C \equiv - \ln a_y^L
$$

- x表示输入网络的训练样本
- y是期待的输出，用One-Hot向量表示。y=7表示向量的第7位是1，其余位是0

如果输入的是数字 7 对应的图像，那么 Log-Likelihood 代价是 
$$
-\ln a_7^L
$$
如果网络工作很好，对输出 7 非常自信，$a_7^L$ 会非常接近1，那么$-\ln a_7^L$ 就会很小。

如果网络工作不好，概率 $a_7^L$ 会很小，而 $-\ln a_7^L$ 会很大。

### 学习速度不会衰退

$$
\begin{eqnarray}
  \frac{\partial C}{\partial b^L_j} & = & a^L_j-y_j  \tag{81}\\
  \frac{\partial C}{\partial w^L_{jk}} & = & a^{L-1}_k (a^L_j-y_j) 
\tag{82}\end{eqnarray}
$$

这些表达式确保我们不会遇到学习速度衰退的问题。

### 反向传播

$\delta_j^L = a_j^L - y_j$

## 过拟合和正则化

Johnny von Neumann 说四个参数可以模拟一头大象，五个参数可以让它摇动鼻子。

Enrico Fermi 认为，拥有大量自由参数的模型能够描述一个足够宽泛的现象。即使这样的模型与现有数据拟合得非常好，但它并没有真正地洞察到现象背后的本质，以至于不能普及到新的情况上。

训练数据的代价

![](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1pplyz13j30cv0a5dgh.jpg)

测试数据的准确度

![](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1pq7tjvvj30cz0acab8.jpg)

测试数据的代价

![](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1pqnuvj9j30cm0ajgmi.jpg)

训练数据的准确度

![](https://ws1.sinaimg.cn/large/006tKfTcgy1fr1pu2k3h3j30ch0a9gma.jpg)



我们看到，训练数据的代价一直在下降，这可能让我们觉得模型似乎一直在改进。

但是从测试数据的准确度来看，280 epoch 后就几乎停止改善。

从测试数据的代价来看，更直观，在15 epoch前代价一直在降低，但之后却开始变大。而训练数据的代价是一直在降低的。

从训练数据的准确度来看，训练数据的准确率上升到100%，能正确分类所有的训练数据，但是在测试数据上的准确率却直邮82.27% 。

以上种种迹象表明，280 epoch 开始的网络产生了 OverFitting 。

在含有大量 Weights 和 Biases 参数时，神经网络很容易过拟合。我们需要跟踪网络训练过程中测试数据的准确度，如果测数据集的准确度不在提高，就应该停止训练。

### Validation Data

我们引入 Validation Data，每一步训练后，计算 Validation Data 的分类准确度，一旦分类准确度达到饱和，就停止训练。这种策略叫做 Early Stopping（提前终止）。

#### 为什么使用 Validation Data 而不是使用 Test Data 来苹果结果去设置超参

如果基于 Test Data 去做，有可能我们最后的网络是对 Test Data 过拟合的，网络的性能不能推广到其它数据集。

可以将 Validation Data 看作帮助我们学习合适超参的一种训练数据。

这里超参是指网络层数，隐藏层神经元个数，学习率，批次大小。

### 增加数据训练数据

增加训练数据是降低过拟合的最好方法之一。

![](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1qdg6xk7j30cm0abq3p.jpg)

一样的超参，只是训练图片从1000增加到50000，测试数据和训练数据的准确度更加接近，差距从之前17.73%降低到1.53% 。

虽然过拟合依然存在，但已经大大降低，我们的网络能从训练数据更好地泛化到测试数据。

### Regularization

除了增加训练数据，还能通过减小网络规模去避免过拟合。但是我们觉得大型网络更有潜力，不愿意减小规模。

在固定网络规模和固定训练数据大小的时候，我们还可以选择 Regularization（正则化）技术。

Weight Decay

权重衰减是最常用的正则化技术，也叫 L2 Regularization（L2 正则）。它的思想是在代价函数中加入一个额外的正则化项。
$$
C = C_0 + \frac{\lambda}{2n} \sum_w w^2
$$

- $C_0$ 是原本没有正则化的代价函数
- 第二项是网络中所有 Weights 的平方和
- $\lambda$ 是 *regularization parameter*（正则化参数），并且 $\lambda > 0$

当 $\lambda$ 较小时，我们偏好最小化原来的代价函数，当 $\lambda$ 较大时，我们让网络偏好学习更小的 Weights 。

#### 在随机梯度下降算法中应用正则化

在正则化的网络中应用随机梯度下降算法，对上面的公式求偏导可知：
$$
\frac{\partial C}{\partial w} = \frac{\partial C_0}{\partial w} + \frac{\lambda}{n} w \\
\frac{\partial C}{\partial b} = \frac{\partial C_0}{\partial b}
$$
只要照常使用反向传播，并把 $\frac{\lambda}{n} w$ 代入
$$
b \rightarrow b - \eta \frac{\partial C_0}{\partial b} \\
w \rightarrow w - \eta \frac{\partial C_0}{\partial w} - \frac{\eta \lambda}{n} w \\
= \left(1 - \frac{\eta \lambda}{n}\right) w - \eta \frac{\partial C_0}{\partial w}
$$
我们看到，跟之前唯一的变化时，我们用 $\left(1 - \frac{\eta \lambda}{n}\right) $ 来调整 Weights ，这种调叫做 Weight Decay（权重衰减）。

之前我们的随机梯度下降，时在包含m个训练样本的mini-batch数据中进行平均以估计$\frac{\partial C_0}{\partial w}$，现在对于随机梯度下降法而言正则化的学习方法变成了：
$$
w \rightarrow \left(1 - \frac{\eta \lambda}{n}\right) w - \frac{\eta}{m} \sum_x \frac{\partial C_x}{\partial w} \\
b \rightarrow b - \frac{\eta}{m} \sum_x \frac{\partial C_x}{\partial wb}
$$
$\sum$ 是针对mini-batch中所有训练样本进行求和

$C_x$ 是每个样本未进行正则化的代价

我们看到，正则化只是增加了权重衰减。

#### Round 1

我们使用 $n = 1000$ 个训练样本再跑一次，这次由30个隐藏层神经元，每个mini-batch的大小是10，学习率是0.5，使用交叉熵代价函数，正则化参数 $\lambda = 0.1$。使用1000个训练样本。

![](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1rnh7l1tj30d70agjs3.jpg)

我们看到训练数据的代价函数一直在下降，与之前没有进行正则化时一样。

![](https://ws3.sinaimg.cn/large/006tKfTcgy1fr1rqik8uej30cw0amdh2.jpg)

但是从测试数据的准确度，我们看到应用正则化抑制了过拟合。

准确度也从之前的82.27上升到87.1 。

#### Round 2

这次将训练样本增加到 $n=50000$ ，相应的，也需要调整正则化参数 $\lambda = 5$，让权重衰减跟之前保持一样。

![](https://ws2.sinaimg.cn/large/006tKfTcgy1fr1rxfhc2gj30cm0aqaax.jpg)

我们之前看到过，对于50000样本量的训练数据，过拟合已经不再是个大问题了。但是应用正则化后，我们在测试数据上的准确度从95.49%提升到96.49% 。

从经验来看，正则化让我们的网络声称得更好，并有效地减弱了过拟合效应。

#### 正则化的好处

- 减弱过拟合，
- 提升分类准确率，
- 避免陷入代价函数的局部最优中

使用随机 Weights 初始化时，经常卡在代价函数的局部最优中，结果就是每次运行可能产生相当不同的结果。

而应用了正则化后，每次运行可以提供更容易复现的结果。

#### 为什么正则化能够降低过拟合

一般的说法是：某种程度上，越小的权重复杂度越低，能更简单有效地描绘数据，所以我们倾向于选择这样的权重。