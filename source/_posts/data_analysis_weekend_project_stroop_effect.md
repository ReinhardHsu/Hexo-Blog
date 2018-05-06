---
title: Data Analysis Weekend Project 斯特鲁普效应(Stroop effect)
categories:
- Data Analysis
tags:
- Data Analysis
- Statistics
- Weekend Project
date: 2016-10-22 21:07
---
# 斯特鲁普效应(Stroop effect)
[Reinhard](http://reinhardhsu.com/)得到了一份斯特鲁普效应试验的数据，我们来分析下，文字的颜色，是否会影响受试者的反应。  
这里先看看什么是斯特鲁普效应：
>斯特鲁普效应(Stroop effect)是指在心理学中干扰对反应时间影响的实验。这是1935年实验心理学家史楚普（John Ridley Stroop）所提出的著名的发现之一，指出环境刺激物理的各项特征，如果相融，则会使辨识加速，反应时间缩短；但若互不相融，则会造成干扰，使反应时间拉长。例如当测试者被要求说出某个颜色和其字面意义不符的词语时，被测者往往会反应速度下降，出错率上升。  

我们再来来看看下面这个例子：  
尽可能以最快的速度说出下面两组文字的颜色  
- - -
<font color=green>绿色</font> <font color=red>红色</font> <font color=blue>蓝色  
<font color=yellow>黄色</font> <font color=blue>蓝色</font> <font color=yellow>黄色</font>  
- - -
<font color=red>蓝色</font> <font color=green>黄色</font> <font color=blue>红色</font>  
<font color=blue>绿色</font> <font color=red>黄色</font> <font color=yellow>绿色</font>  
- - -
## 参考文献
[Stroop Effect - Wikipedia](https://en.wikipedia.org/wiki/Stroop_effect)
## 变量

* 自变量是文字与颜色是否匹配
* 因变量是受试者的反应时间

## 假设
适当的假设是，当文字和颜色匹配时，受试者所花费的反应时间要更少。  

这里，零假设是，文字和颜色的匹配与不匹配，对受试者而言在反应时间上没有差别。   
对立假设是，文字和颜色匹配时，受试者的反应时间上比不匹配时更少。  

这里，用$H_0$表示零假设，用$H_A$表示对立假设。用$\mu_C$表示文字与颜色匹配的总体的均值。用$\mu_I$表示文字与颜色不匹配的总体的均值。  

$H_0:\mu_C=\mu_I$  
$H_A:\mu_C<\mu_I$

## 统计测试类型
z-test适用于知道总体参数（如$\mu,\sigma$)的情况。  
这里，我们并不知道总体参数。我们只有样本，需要比较两个样本之间的区别，并以此来推断总体的情况，所以需要使用t-test。  

由数据集的描述可以得知，这是一组受试者参加两次测试所得到的两个样本，也就是相依样本。  
在相依样本t检验的测试类型中，有一种叫做重复衡量设计，是在试验中对同一名受试者进行不同的测试。  

这里，将采用负方向的单尾检验。  
因为我们的对立假设是文字和颜色匹配时，受试者的反应时间少。所以检验必须具有方向行，不能使用双尾检验，只能使用单尾检验。从我们对立假设$\mu_C-\mu_I<0$可以得知，检测的方向是负方向。
## 样本数据可视化
### 直方图

![StroopEffect.jpg](https://ws2.sinaimg.cn/large/006tKfTcgy1fqw1padisuj30s908kq35.jpg)

从两个样本数据的直方图上我们可以看出，  
文字与颜色匹配的反应时间，大多集中在11到18之间。  
文字与颜色不匹配的反应时间，大多集中在17到23之间。   
### 箱线图

![StroopEffect_BoxPlot.png](https://ws3.sinaimg.cn/large/006tKfTcgy1fqw21u15snj30m80gomx1.jpg)

从箱线图中可以看出，  
文字与颜色匹配的样本中，最大值和最小值差较大，但是四分位差较小。
文字与颜色不匹配的样本中，最大和最小值差较小，但是四分位差较大，而且有异常点存在。
## 数据集的统计描述
### 反应前后二者平均值之间的差别  
$\bar{x}=\bar{x}\_C-\bar{x}\_I=-7.96$
### 标准偏差
$S_D=\sqrt{\frac{\sum{(x_i-\bar{x})^2}}{n-1}}=4.86$
### 标准误差
$SEM=\frac{S_D}{\sqrt{n}}=\frac{4.86}{\sqrt{24}}=0.99$
### t统计量
$t-statistic=\frac{\bar{x}\_C-\bar{x}\_I}{SEM}=\frac{-7.96}{0.99}=-8.04$
### t临界值
这里使用$\alpha级别为0.05$的单尾检验，自由度是23，t临界值是-1.714
### 效应量$r^2$
$r^2=\frac{t^2}{t^2+df}=0.74$  

$r^2=.74$  
也就是74%的差异，是由文字和颜色匹配与不匹配所造成的。
### 置信区间
自由度是23，95%置信区间的t临界值是2.069，误差界限是$t-critical \times SEM=2.069 \times 0.99=2.05$  
置信区间$CI:\bar{x}_D\pm 2.05=-7.96\pm 2.05=(-10.01,-5.91)$  

关于均值差异的置信区间;95% CI=(-10.01,-5.91)
### 决策
$t(23)=-8.04,P<.05,one-tailed$  
根据t统计量和t临界值，[Reinhard](http://reinhardhsu.com/)认为结果有统计上的显著性。  
因为P<0.05，所以[Reinhard](http://reinhardhsu.com/)拒绝零假设。  
试验证明在文字和颜色匹配时，受试者的反应时间比不匹配时更少。  
