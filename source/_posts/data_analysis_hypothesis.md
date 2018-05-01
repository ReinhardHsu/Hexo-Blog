---
layout: "post"
title: "Data Analysis 假设"
categories:
- Data Analysis
tags:
- Data Analysis
- Statistics
date: "2016-10-14 06:31"
---
### 阿尔法级别
对于一个主观预测的值35%，有人形容它为完全不可能，有人形容它为很有可能。  
统计学家定义了可能和不可能的三个级别，即阿尔法级别。

* 0.05 小于5% 叫做不太可能
* 0.01
* 0.001 ，小于0.1%叫非常不可能

距离均值1.65个标准差的数据不太可能发生，可能是哪里出了什么问题。

### 零假设
是假设不会有显著变化，即预测结果不在阿尔法级别临界值范围内。

### 对立假设
是假设有显著变化，比如多了，少了，或不等于，即预测结果在阿尔法级别临界值范围内。但具体是显著好了，还是显著坏了，要用单尾验证。

### 单尾验证
当需要方向性验证，比如显著地多了还是少了，就用单尾验证。均值小于或大于阿尔法级别临界值。
### 双尾验证
当不需要方向性验证，比如显著地不等于，就用双尾验证。均值或者小于阿尔法级别临界值，或者大于阿尔法级别临界值。

### 拒绝零假设
样本均值在临界区域内  
样本均值的Z值大于临界值的Z值  
得到样本的概率小于阿尔法级别

### 决策失误
零假设：饮料现在温度刚刚好  
对立假设：饮料现在太烫了

|现实状况|决策|决策|
|-|-|-|
| |拒绝零假设|接受零假设|
|零假设为真|你认为饮料很烫要过会儿喝，但其实温度刚刚好。过会儿等你喝时，已经凉了。决策失误。|你认为饮料温度刚好，并且确实如此。|
|零假设为假|你认为饮料太烫了，实际上确实很烫。过会儿等你喝时，温度刚刚好。|你认为饮料温度刚好，但实际上太烫了，烫到了舌头。决策失误。|




