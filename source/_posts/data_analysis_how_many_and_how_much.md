---
title: Data Analysis How Many and How Much
categories:
- Data Analysis
tags:
- Data Analysis
date: 2016-09-25 21:05
---
# 有多少
数字关注的是预期的值，图形总结了非预期的值。

交流数据，就是分享对比，对相对量的对比。
我们成天做比较，不自觉地做决定。
我们喜欢探索事物是如何地相似，又是如何地不同。

过去的一季度我们赚了有多少钱？  （sum，how much，可以累加的，不可数）
我们有多少顾客？（count，how many，不能累加的，可数）

## How Much
这里数据一般是事务数据，如销售，发运等。这类数据是可以累加的。
如果看相对数量，横条图更直观。横条图的标签中的文字是水平排列的，所以比竖条图更易读。这两种图都用长度来代表数量，事实证明，我们很擅长比较长度。
如果要看精确的数值，那么表格就更合适，这也是财务部门经常这样做的原因。高亮表格图通过颜色的深浅，来区分数量的多少，更直观。

所以，选择哪种视图，依赖于你要表达什么信息，听众是谁，关联的数据是什么等等。
### 横条图
这里，如果我们选择了横条图，那么稍微修改下默认的样式就可以了，比如按照数量逆序排列，调整横条的颜色。
### 点图
多数有效的方式，是将数量信息表达为位置信息。每个维度放在行上，将度量放在列上。然后为每一行添加0轴线。然后把圆圈变成实心圆，修改个颜色。`点图，非常符合人类的视觉系统，用符号的位置，比较数量`。

## How Many
