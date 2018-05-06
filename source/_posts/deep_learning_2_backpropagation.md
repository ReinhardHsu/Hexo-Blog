---
title: Deep Learning - 2 反向传播
date: 2018-05-03 10:15:23
categories:
- Deep Learning
tags:
- Data Analysis
- Machine Learning
- Deep Learning
- Neural Networks
- Backpropagation
---

深度神经网络的学习基于两个关键技术：

- Stochastic Gradient Descent
- Backpropagation

利用 SGD 算法学习 Weights 和 Biases，利用 Backpropagation 算法来快速计算 Cost Function 的 Gradient 。

反向传播是一种快速的学习算法，能够让我们深入地了解改变 Weights 和 Biases 的值，是如何改变整个网络的行为的。

## Weights

![Weights](https://ws4.sinaimg.cn/large/006tKfTcgy1fr09c43bcqj30gz076jrp.jpg)

- $W_{jk}^{l}$表示从第 $l-1$ 层的第 k 个神经元，到第 $l$ 层的第 $j$ 个神经元的**连接**的权重。

## Biases and Activations

![Biases and Activations](https://ws2.sinaimg.cn/large/006tKfTcgy1fr09gjqhsmj308l071aa5.jpg)

- $b_j^l$ 表示第 $l$ 层第 $j$ 个**神经元的 Biases**
- $a_j^l$ 表示第 $l$ 层第 $j$ 个**神经元的 Activations（激活值）**

## 神经元的视角

每个神经元的激活值可以这样表示：
$$
a_j^l = \sigma \left(\sum_k w_{jk}^{l} a_{k}^{l-1}+b_{j}^{l}\right)
$$

## 层视角

通过使用矩阵：

- 每一层 $l$ 定义一个权重矩阵 $w^l$ ，$w^l$ 中的第 $j$ 行第 $k$ 列的元素就是 $w_{jk}^{l}$  。
- $b^l$ 代表第 $l$ 层的 Biases 向量。
- 将 $\sigma$ 函数向量化，即对向量 $v$ 中的每一项，都单独地应用 $\sigma$ 函数，记为 $\sigma(v)$ 。
- $a^l$代表第 $l$ 层的神经元的激活值向量。

每层的激活值可以这样表示：
$$
a^l = \sigma ( w^l a^{l-1} + b^l )
$$

1. 将权值矩阵作用于上一层的激活值
2. 然后加上偏置向量
3. 最后用 $\sigma$ 函数作用于这个结果
4. 就得到了本层的激活值

### Weighted Input

$z^l \equiv w^l a^{l-1} + b^l$ ，$z^l$ 成为对第 $l$ 层神经元激活函数的加权输入。
$$
a^l = \sigma (z^l)
$$

## Cost Function 的两个假设

MSE代价函数：
$$
C = \frac{1}{2n} \sum_x ||y(x)-a^L(x)||^2
$$

- n是训练样本数量
- $\sum_x$是对每个独立训练样本 $x$ 求和
- $y=y(x)$ 是每个独立训练样本 $x$ 的预期输出结果
- $L$ 是神经网络的层数
- $a^L = a^L (x)$是输入为 $x$ 时网络的激活函数的输出向量

为了能够使用反向传播，我们需要对代价函数C进行两个假设。

### 假设一

假设代价函数能够写成这样的形式
$$
C = \frac{1}{n} \sum_x C_x
$$

- $C_x$ 是每个独立训练样本 $x$ 的代价函数。

当代价函数是MSE时，$C_x = \frac{1}{2} ||y-a||^2$ 。

### 假设二

假设代价函数可以**写成关于神经网络输出结果的函数**。

![](https://ws4.sinaimg.cn/large/006tKfTcgy1fr0affaln8j30dx06f0sv.jpg)

MSE代价函数满足这个要求，因为单一训练样本x的二次代价可以表示为：
$$
C = \frac{1}{2} ||y-a^L||^2 = \frac{1}{2} \sum_j ( y_j - a_j^L )^2
$$
因为输入的训练样本 x 是固定的，所以期望的输出 y 也是固定的。x 和 y 不是神经网络所学习的东西，我们不能通过改变 Weights 和 Biases 来修改它。

所以这里可以把 C 视为是只关于输出 $a^L$ 的函数。

## Hadamard Product

反向传播会用到 Hadamard Product ，假设 s 和 t 两个向量有相同的维数
$$
( s \odot t )_j = s_j t_j
$$
其中，$s \odot t$ 表示两个向量的对应元素相乘

## 反向传播背后的四个基本等式

$$
\delta^L = \nabla a C \odot \sigma'(z^L) \\
\delta^l = ((w^{l+1})^T \delta^{l+1}) \odot \sigma' (z^l) \\
\frac{\partial C}{\partial b_j^l} = \delta_j^l \\
\frac{\partial C}{\partial w_{jk}^l} = a_{k}^{l-1} \delta_j^l
$$

## 反向传播算法

### 输入一组训练数据

### 对于训练数据中的每个样本 x

计算输入层的激活函数值 $a^{x,1}$，并执行下面的步骤：

#### Feedforward（正向传播）

计算样本x在每一层的激活函数值 $a^{x,l}$
$$
l=2,3,\dots ,L \\
z^{x,l} = w^l a^{x,l-1} + b^l \\
a^{x,l} = \sigma ( z^{x,l} )
$$

#### 输出层的误差

计算样本x在输出层的误差向量
$$
\delta^{x,L} = \nabla_a C_x \odot \sigma' ( z^{x,L} )
$$

#### 将误差反向传播

使用输出层的误差，计算样本x在之前每一层的误差
$$
l = L-1,L-2,\dots ,2 \\
\delta^{x,l} = (( w^{l+1} )^T \delta^{x,l+1} ) \odot \sigma'( z^{x,l} )
$$

### Gradient Descent

使用样本x在每一层的误差，更新 Weights 和 Biases
$$
l = L,L-1,\dots,2 \\
w^l \rightarrow w^l - \frac{\eta}{m} \sum_x \delta^{x,l} (a^{x,l-1})^T\\
b^l \rightarrow b^l - \frac{\eta}{m} \sum_x \delta^{x,l}
$$

## 反向传播算法的实现

### 初始化网络

```python
self.num_layers = len(sizes)
self.sizes = sizes
self.biases = [np.random.randn(y, 1) for y in sizes[1:]]
self.weights = [np.random.randn(y, x)
                for x, y in zip(sizes[:-1], sizes[1:])]
```

对于5层的神经网络，初始化后 Weights 和 Biases 的结构如下

```python
size = [748, 40, 30, 20, 10]

biases  [(40, 1), (30, 1), (20, 1), (10, 1)]
weights [(40, 784), (30, 40), (20, 30), (10, 20)]
```

### 随机梯度下降

#### 随机

```python
def SGD(self, training_data, epochs, mini_batch_size, eta,
            test_data=None):
    for j in range(epochs):
        # 随机打散
        random.shuffle(training_data)
        # 分批
        mini_batches = [
            training_data[k:k+mini_batch_size]
            for k in range(0, n, mini_batch_size)]
        for mini_batch in mini_batches:
            # 使用小批样本快速学习
            self.update_mini_batch(mini_batch, eta)
            if test_data:
                print("Epoch {} : {} / {}"
                    .format(j,self.evaluate(test_data),n_test));
            else:
                print("Epoch {} complete".format(j))
```

#### 梯度下降

```python
def update_mini_batch(self, mini_batch, eta):
    # 每一层每个神经元的偏置和权值
    nabla_b = [np.zeros(b.shape) for b in self.biases]
    nabla_w = [np.zeros(w.shape) for w in self.weights]
    
    for x, y in mini_batch:
        # 对于每一个样本x，反向传播，计算每一层每个神经元的梯度
        delta_nabla_b, delta_nabla_w = self.backprop(x, y)
        # 将样本x的误差梯度汇总到批次梯度上
        nabla_b = [nb+dnb for nb, dnb 
                   in zip(nabla_b, delta_nabla_b)]
        nabla_w = [nw+dnw for nw, dnw 
                   in zip(nabla_w, delta_nabla_w)]
        
    # 使用批次梯度更新权值和偏置
	self.weights = [w-(eta/len(mini_batch))*nw
                        for w, nw in zip(self.weights, nabla_w)]
	self.biases = [b-(eta/len(mini_batch))*nb
                       for b, nb in zip(self.biases, nabla_b)]
```

#### 反向传播

```python
def backprop(self, x, y):
    # 每一层的偏置向量和权值矩阵
    nabla_b = [np.zeros(b.shape) for b in self.biases]
    nabla_w = [np.zeros(w.shape) for w in self.weights]
    
    # 正向传播
    activation = x
    activations = [x] # 样本x在每一层的激活值向量
    zs = [] # 样本x在每一层的加权输入向量
    
    # 逐层计算样本x在加权输入向量和激活值向量
    for b, w in zip(self.biases, self.weights):
        z = np.dot(w, activation)+b
        zs.append(z)
        activation = sigmoid(z)
        activations.append(activation)
        
    # 反向传播
    
    # 计算样本x在输出层的误差和梯度
    delta = self.cost_derivative(activations[-1], y) * \
    sigmoid_prime(zs[-1])
    nabla_b[-1] = delta
    nabla_w[-1] = np.dot(delta, activations[-2].transpose())

    # 使用输出层的误差和梯度，逐层向前计算样本x在每一层的误差梯度和权值梯度
    for l in range(2, self.num_layers):
        z = zs[-l]
        sp = sigmoid_prime(z)
        delta = np.dot(self.weights[-l+1].transpose(), delta) * sp
        nabla_b[-l] = delta
        nabla_w[-l] = np.dot(delta, activations[-l-1].transpose())
    return (nabla_b, nabla_w)
```

## 反向传播算法为什么更高效

待更新

## 反向传播整体描述

我们对 $w_{jk}^{l}$ 作出一个小的改变$\triangle w_{jk}^l$ 

![](https://ws3.sinaimg.cn/large/006tKfTcgy1fr0xrdb02qj30gg07tglv.jpg)

这个改变量会导致与它相连的神经元的输出激活值改变

![](https://ws2.sinaimg.cn/large/006tKfTcgy1fr0xu1ob6pj30ge079weq.jpg)

然后，这个激活着会影响下一层的所有激活值

![](https://ws2.sinaimg.cn/large/006tKfTcgy1fr0xxn08p3j30ge06d74i.jpg)

这样一层一层地，最终引起代价函数的改变，并且这个改变我们可以算出。