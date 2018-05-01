---
title: Machine Learning - 距离计算
date: 2017-12-21 22:34:23
categories:
- Machine Learning
tags:
- Data Analysis
- Machine Learning
---

在机器学习领域里，最核心的两种数值计算分别是：

- 距离计算
- 概率计算

今天[Reinhard Hsu](http://www.cnblogs.com/msdynax/)就来看看常见都有哪些常见的的距离计算。

## 欧式距离（Euclidean Metric）

欧几里得距离，用于计算两个点之间的实际距离，计算方法是使用毕达哥拉斯定理，也就是咱们中国的勾股定理。

对于二维平面上的两点，它们的欧式距离可以这样算：
$$
d=\sqrt{(x_1-x_2)^2+(y_1-y_2)^2}
$$

## 曼哈顿距离（Manhattan distance）

想象下你站在曼哈顿街区，需要从一个十字路口走到另一个十字路口，无法穿过建筑，只能沿着街道走。

对于二维平面上的两点，它们的曼哈顿距离可以这样算：
$$
d=|x_1-x_2|+|y_1-y_2|
$$

## 海明距离（Hamming distance）

单词“advice”和“advise”之间的距离是多少呢？

距离是1，因为只需要替换一个字符，就可以将一个单词变换成另一个单词。

海明距离用于测量长度相等的字符串之间的距离。

## 编辑距离（Levenshtein distance,Edit distance）

单词“how”和“show”之间的距离是多少呢？

距离是1，因为只要进行1次下面的动作，就可以从一个词变换到另一个词：

- **插入**一个字母
- **删除**一个字母
- **交换**相邻两个字母的位置
- 把一个字母**替换**成另一个字母

编辑距离常用于自然语言处理中的拼写检查，和文本相似性检查。

## 其它距离

- 马氏距离（Mahalanobis distance）
- 切比雪夫距离
- 闵氏距离
- 余弦距离
- 杰卡德距离（Jaccard Distance）。

## 距离的分类

从距离的形式来划分的话，可以分为如下三类：

### 几何距离

直观地测量物体从一个点到另一个点有多远。包括欧几里得距离、余弦距离，都属于几何距离。

### 计算距离

包括曼哈顿距离、编辑距离（Levenshtein distance）。

### 统计距离

包括马氏距离（Mahalanobis distance）、杰卡德距离（Jaccard Distance）。 

## 参考文献

【1】[怎样写一个拼写检查器 by Peter Norvig](http://zqpythonic.qiniucdn.com/data/20090728222556/index.html)

【2】[大数据时代的算法](https://book.douban.com/subject/26945540/)

【3】[Thoughtful Machine Learning with Python](https://book.douban.com/subject/26600885/)