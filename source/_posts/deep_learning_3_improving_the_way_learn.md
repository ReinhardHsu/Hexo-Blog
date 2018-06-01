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

#### L2 Weight Decay

权重衰减是最常用的正则化技术，也叫 L2 Regularization（L2 正则）。它的思想是在代价函数中加入一个额外的正则化项。
$$
C = C_0 + \frac{\lambda}{2n} \sum_w w^2
$$

- $C_0$ 是原本没有正则化的代价函数
- 第二项是网络中所有 Weights 的平方和
- $\lambda$ 是 *regularization parameter*（正则化参数），并且 $\lambda > 0$

当 $\lambda$ 较小时，我们偏好最小化原来的代价函数，当 $\lambda$ 较大时，我们让网络偏好学习更小的 Weights 。

##### 在随机梯度下降算法中应用正则化

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

##### Round 1

我们使用 $n = 1000$ 个训练样本再跑一次，这次由30个隐藏层神经元，每个mini-batch的大小是10，学习率是0.5，使用交叉熵代价函数，正则化参数 $\lambda = 0.1$。使用1000个训练样本。

![](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1rnh7l1tj30d70agjs3.jpg)

我们看到训练数据的代价函数一直在下降，与之前没有进行正则化时一样。

![](https://ws3.sinaimg.cn/large/006tKfTcgy1fr1rqik8uej30cw0amdh2.jpg)

但是从测试数据的准确度，我们看到应用正则化抑制了过拟合。

准确度也从之前的82.27上升到87.1 。

##### Round 2

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

#### L1

$$
C = C_0 + \frac{\lambda}{n} \sum_w |w|
$$

我们再来看下L2正则的代价函数
$$
C = C_0 + \frac{\lambda}{2n} \sum_w w^2
$$
对L1代价函数求偏导
$$
\frac{\partial C}{\partial w} = \frac{\partial C_0}{\partial w} + \frac{\lambda}{n} sgn(w)
$$
$sgn(w)$是取w的符号，当w为正数时，$sgn(w) = +1$。当w为负数时，$sgn(w) = -1$。

对反向传播进行修改，使用基于L1正则化的随机梯度下降进行学习。
$$
w \rightarrow w' = w - \frac{\eta \lambda}{n} sgn(w) - \eta \frac{\partial C_0}{\partial w}
$$
我们可以使用 mini-batch 的均值去估计 $\frac{ \partial C_0}{\partial w}$，
$$
w \rightarrow w' = (1 - \frac{\eta \lambda}{n}) w - \eta \frac{\partial C_0}{\partial w}
$$
我们再来看下L2正则的：
$$
w \rightarrow w' =  \left(1 - \frac{\eta \lambda}{n}\right) w - \frac{\eta}{m} \sum_x \frac{\partial C_x}{\partial w}
$$

##### 共同点

L1 和 L2 的共同点是都惩罚大的权重。

##### 不同点

L1 中，权值通过一个**常量**向 0 缩小。

L2中，权值通过一个**和 w 成比例的量**进行缩小。

- 当 $|w|$ 很大时，L1 比 L2 缩小得少。
- 当 $|w|$ 很小时，L1 比 L2 缩小得多。

结果是，L1 会将权值保留在少量的高重要度的连接上，其它权值会趋向0接近。

## Dropout 弃权

L1 和 L2 正则化是对代价函数的修改。Dropout 是改变网络本身。

假设我们有训练数据 x，和输出 y，一般会通过在网络中正向传播 x 进行训练，再反向传播确定梯度的贡献。

当使用 Dropout 时：

1. 我们先随机临时删除网络中的一半的隐藏神经元，同时输入层和输出层的神经元保持不变。
2. 在一个 mini-batch 中，前向传播输入 x ，通过修改后的网络，然后反向传播结果，并通过这个修改后的网络。然后对有关权值和偏置进行更新。
3. 重复上面的过程，先重置弃权的神经元，再选择一个新的隐藏神经元的随机子集，对这个不同的 mini-batch 估计它的梯度，然后再更新权值和偏置。

我们弃权掉不同的神经元几何，这样就像是我们在训练不同的神经元集合。弃权过程如同大量不同网络的效果的平均。不同的网络会以不同的方式过度拟合，所以弃权过的网络效果会减轻过拟合。

比如我们训练了五个网络，其中三个把数字分类为3，那很可能就是3了。

在图像、语音识别、自然语言处理时，很有效。大规模深度网络时也很有用，因为这样的网络过拟合问题特别突出。

## 人为扩展训练数据

一般我们认为大量的训练数据会得到更好的性能。

但这个代价很大。有时我们可以人为扩展训练数据，比如图片5，将其做一个旋转，转换，扭曲，都懂，使用扩展后的训练数据来提升网络的性能。

更多的训练数据能补偿不同算法的差距。

## 权值初始化

之前我们一直用均值为0，标准差为1的独立高斯随机变量来选择权值和偏置。

其实用归一化的高斯分布不是最好的。

跟以前的归一化问题一样，如果权值大，$z$ 也大，$\sigma ( z )$ 就接近 1 或 0，隐藏层神经元会饱和，梯度下降算法学习慢。

之前我们通过选择不同的代价函数来解决，但那只是对输出神经元有效，对隐藏神经元不起作用。

假设我们有一个神经元，它的输入权值是 $n_{in}$，然后我们用均值是0，标准差是 $\frac{1}{\sqrt{n_{in}}}$ 的高斯随机变量来初始化这些权值。

这样，$z = \sum_j w_j x_j +b$ 的取值更小。

这样的神经元更不容易饱和，也更不可能使学习速度下降。

$\frac{1}{\sqrt{n_{in}}}$ 权值初始化，可以加快训练速度，有时也能提升网络的最终性能。

## 如何选择超参数

每一 epoch 的精确度一直下降，但是我们一开始并不知道哪些超参数应该被调整。

- 也许问题在于无论我们怎么选择超参数，30个隐藏神经元网络永远都不会工作得很好。
- 我们可能真的需要至少100个隐藏神经元？或300个隐藏神经元？或多个隐藏层？
- 可能我们的网络正在学习，但是需要更多的 epoch。
- 可能 mini-batch 太小了。
- 可能我们我们应该换回 均方误差代价函数。
- 可能我们需要尝试一个不同的途径来初始化权值。
- 等等。

我们很容易就会迷失方向。这里我们解释一些启发式的方法，帮助你开发一个工作流，能让你更好地设置超参数。

###  Broad Strategy 宽泛策略

宽泛策略不好。

### Learning Rate

![Different Learning Rate](https://ws4.sinaimg.cn/large/006tKfTcgy1fri7540jx1j30ct0a80tk.jpg)

- $\eta = 0.025$，代价函数平滑下降到最后回合。

- $\eta = 0.25$ ，代价在20回合时接近饱和。后面微震荡和随机抖动。
- $\eta = 2.5$，代价一直震荡。

震荡的原因是$\eta$太大，使算法在接近最小值时，又越过谷底。

随机梯度下降期望我们能够逐渐地抵达代价函数的谷底。

学习率太大，代价一直震荡，太小又算法变慢，如果可变学习速度会更好。开始时使用$\eta = 0.25$，接近谷底换成$\eta = 0.025$。

策略是：

- 一开始就找到使代价震荡的 $\eta$ 的量级，也就是 $\eta$ 的 threshold。
- 如果0.01没有震荡，加到0.1, 1.0。
- 如果0.01就震荡，减到0.001，0.0001。
- 先找量级，再确定 threshold，再将 $\eta$ 设为 threshold 的一半。

### Early Stopping

在每个 epoch 结束时，我们都会在验证数据上计算分类精度。当分类精度不再提升时，我们就结束它。Early Stopping 会自动防止过拟合。但是在试验的早期阶段，我们会关闭 Early Stopping ，这样我们能够看到任何过拟合的信号，并用这些信息去选择正则化算法。

即使是总体趋势在提升的情况下，我们也能看到精度在抖动和震荡。如果我们在精度刚开始下降的时候就终止它，我们肯定会错过更好的模型。一个更好的准则是当最好的分类精度一段时间都没有提升时，再终止它。这样既不会错过什么，也不会等太久。

这里有一个准则：连续十次没有提升就终止。但是网络有时会在很长一段时间内，分类精度很平缓，然后才会有提升。如果你想要获得更好的性能，这个准则就太草率了。

### Learning Rate Schedule

我们一直将 $\eta$ 设置为常量。一开始，我们会使用一个大的学习速率，让权值变化地快一点。然后，我们减小学习速率，这样可以对权值做出更加精良的调整。

一个观点是保持学习速率不变，直到验证数据集精度开始变差时，按照 1/2 或 1/10 去降低学习速率。这样重复几次，直到学习学习速率变为初始值的 1/1000，就停止。



