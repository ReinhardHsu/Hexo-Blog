---
layout: "post"
title: "Data Analysis 使用R研究和总结数据"
categories:
- Data Analysis
tags:
- Data Analysis
date: "2016-11-09 20:27"
---
## 什么是探索数据分析
[探索性数据分析](http://en.wikipedia.org/wiki/Exploratory_data_analysis)  
简单来说，就是实用可视化和统计工具，来理解数据的一种方法。  

### EDA的第一个目标
变量之间的关联度

### EDA的第二个目标
评估和验证假设，基于这些假设将得到未来的推理。

### 总结
通过研究，我们生成更好的假说，确定哪些变量有最大的预测力，然后选择相应的统计工具，来建立我们的预测模型。

## 电视的发展

## R基本操作
### 设置工作路径

```python
getwd()
setwd('~/Downloads/R')
```

### 读取文件

```r
statesInfo <- read.csv('xxx.csv')
View(statesInfo)
subset(statesInfo,state.region==1)
statesInfo[statesInfo$state.region==1,]
head(statesInfo,2)
dim(statesInfo)
```
方括号中，第一个参数是row，第二个参数是column。  
head函数用于取出数据的前几行  
dim函数，输出数据的dimension，在这里就是50行，12列  
更多关于子集操作的[文档](http://www.statmethods.net/management/subset.html)
### R Markdown文件
[Markdown教程](https://www.youtube.com/watch?v=6A5EpqqDOdk)  
可以通过Knit导出到html或pdf

### 探索数据
#### 数据概览

```r
str(data)
summary(data)
```
在操作一个新数据框时，str用于看变量名和类型  
summary用于看变量值的统计信息，如最大，中值等  
#### 逻辑操作

```r
subset(mtcars,mpg>30 & hp>100)
subset(mtcars,mpg<14 | disp>390)
```
这里注意r中的逻辑或，是一个竖线  
#### 添加删除列

```r
mtcars$year<-1974
mtcars<-subset(mtcars,select=-year)
mtcars$year <- c(1973,1974)
```
第一行代码添加了year列，值是1974  
第二行代码将year列删除了  

#### 添加分类

```r
cond<-mtcars$wt<3
mtcars$weight_class<-ifelse(cond,'light','average')
cond<-mtcars$wt>3.5
mtcars$weight_class<-ifelse(cond,'heavy',mtcars$weight_class)
```
cond是布尔型，如果这一行满足条件则为ture，不满足就是false 。  
然后用ifelse，将分类结果写入weight_class列。  
#### 删除变量
R将所有数据都加载到内存中，如果不需要了，可以删掉

```r
rm(cond)
```
### Reddit
一个社交和娱乐网站，用户可以发表热门话题的链接及评论。
#### 因数变量

```r
reddit <- read.csv('reddit.csv')
table(reddit$employment.status)
str(reddit)
levels(reddit#age.range)

library(ggplot2)
qplot(data=reddit,x=age.range)
```
##### 有序因子
年龄和收入，可以按照由低到高，或由高到低有序排列。[参考文档](http://statistics.ats.ucla.edu/stat/r/modules/factor_variables.htm)

```r
reddit$age.range <- ordered(reddit$age.range,levels=c('Under 18','18-24'))
qplot(data=reddit,x=age.range)
```
### 给数据科学家的建议
[Eytan Bakshy](http://www-personal.umich.edu/~ebakshy/)找到感兴趣的数据集，操作数据，把玩数据。通过把玩数据来积累经验。  
[Sean Taylor](http://seanjtaylor.com/)好的数据科学院子好的问题，而不是花哨的方法。好的数据，是你关心的，或他人也会关心的这种理念来驱动你的研究。你要像记者那样进行思考，你的听众，将消费你产生的结果。
## 探索单一变量
### 首先该做什么
### 读取数据

```r
getwd()
list.files()
pf <- read.csv('xx.tsv',sep='\t')
pf <- read.delim('xx.tsv')
names(pf)
```
这里要注意分隔符，是制表符。read.csv默认是逗号，read.delim默认是制表符。  
### 创建直方图

```r
library(ggplot2)
library(ggthemes)
theme_set(theme_minimal())

qplot(data = pf,x=dob_day)+
  scale_x_continuous(breaks = 1:31)
```
qplot默认并未将31天都显示出来，所以，后面又加了个端点涂层。  
然后再添加图层，将每个月的情况显示出来。

```r
qplot(data = pf,x=dob_day)+
  scale_x_continuous(breaks = 1:31)+
    facet_wrap(~dob_month,ncol=3)
```
facet_wrap(~variable)叫琢面包裹，用来创建类似的图形。这里，列数设置为3列。    
facet_grid(vertical~horizontal)包含要在垂直方向分割的变量，波浪号后面，是水平方向分割的变量。  
在传递1个变量时，用facet_wrap，传递2个时，用facet_grid 。
### 过滤异常值
极端情况下的坏数据  
非极端情况下的话数据  
极端情况下的好数据  

数据集中分布在一侧，另一侧的数据很少，但是分布得非常广，这种数据叫做长尾数据。  
可以使用限制轴，来进行过滤

```r
qplot(data = pf,x=friend_count,xlim = c(0,1000))

qplot(data = pf,x=friend_count)+
  scale_x_continuous(limits = c(0,1000))

ggplot(aes(x = friend_count), data = pf) +
  geom_histogram() +
  scale_x_continuous(limits = c(0, 1000))
```
[标尺](http://docs.ggplot2.org/current/scale_continuous.html)

### 设置组宽

```r
qplot(data = pf,x=friend_count,binwidth=25)+
  scale_x_continuous(limits = c(0,1000),breaks=seq(0,1000,50))
```
binwidth设置了数据桶的大小，breaks设置了下标50一标记。
### 忽略NA值
[缺失值](http://www.statmethods.net/input/missingdata.html)  
[感叹号为何称为bang](http://english.stackexchange.com/questions/62918/why-is-the-exclamation-mark-called-a-bang)

```r
qplot(x = friend_count, data =subset( pf,!is.na(gender)), binwidth = 10) +
  scale_x_continuous(limits = c(0, 1000),
                     breaks = seq(0, 1000, 50))+
  facet_wrap(~gender)


qplot(x = friend_count, data =na.omit( pf), binwidth = 10) +
  scale_x_continuous(limits = c(0, 1000),
                     breaks = seq(0, 1000, 50))+
  facet_wrap(~gender)
```
na.omit，会忽略所有列的na值。

### 划分

```r
by(pf$friend_count,pf$gender,summary)
```
### 填充颜色

```r
qplot(data = pf,x=tenure,binwidth=30,
      color=I('black'),fill=I('#099DD9'))
```
color是线框的颜色，fill是填充的颜色。  
这里的组距是30，因为30天是一个月，所以每根柱子都代表一个月。如果要以年来看，将组距设置为365 。

```r
qplot(data = pf,x=tenure/365,binwidth=.25,
      color=I('black'),fill=I('#099DD9'))+
  scale_x_continuous(breaks = seq(1,7,1),limits = c(0,7))
```
### 设置标签

```r
qplot(data = pf,x=tenure/365,
      xlab = 'Number of years using Facebook',
      ylab = 'Number of users in sample',
      color=I('black'),fill=I('#099DD9'))+
  scale_x_continuous(breaks = seq(1,7,1),limits = c(0,7))
```

### 数据
好友数、点赞数、评论数、涂鸦墙有些变量，都有很长的尾巴，有的用户的数据甚至是中位数的10倍100倍，我们称为约束变量。这些用户比其它用户高出一个量级，在统计学中，我们称为数据过离散，通常要对这些值进行变换，才能看到标准偏差或者量级，也就是在缩短尾巴。  
#### 对数
使用自然对数，或者以2为底，以10为底，可以帮助我们看清模式，不被长尾分散注意。  
很多常见的统计方法，比如线性递归，都是基于变量是正太分布的假设。  
通过取对数，将变量转换为正太分布，或非常接近正太分布。  
有的好友数为0，取0的对数，会出现未定义，或无穷大。这里需要将好友数加上1 。
#### 平方根
另一种方法是对好友数取平方根，

```r
summary(pf$friend_count)
summary(log10(pf$friend_count+1))
summary(sqrt(pf$friend_count))

qplot(data = pf,x=friend_count)
qplot(data=pf,x=log10(friend_count+1))
qplot(data=pf,x=sqrt(friend_count))

p1 <- ggplot(aes(x=friend_count),data=pf)+geom_histogram()
p2 <- p1+scale_x_log10()
p3 <- p1+scale_x_sqrt()

library(gridExtra)

grid.arrange(p1,p2,p3,ncol=1)
```
这里，ggplot与qplot最大的不同，是将x轴和y轴放在了aes美学包中。

#### 频率多边形
频率多边形类似于直方图，但是可以更清晰地看出分布的形状和峰值，可以立即比较两个或多个分布。  

```r
qplot(data=subset(pf,!is.na(gender)),x=friend_count,
      y=..count../sum(..count..),
      binwidth=10,geom = 'freqpoly',color=gender)+
  scale_x_continuous(limits = c(800,1200),breaks = seq(0,1000,50))

ggplot(aes(x=friend_count,y=..count../sum(..count..)),data = subset(pf,!is.na(gender)))+
  geom_freqpoly(aes(color=gender),binwidth=10)+
  scale_x_continuous(limits = c(0,1000),breaks = seq(0,1000,50))+
  xlab('friend count')+
  ylab('percentage of users with that friend count')



qplot(data=subset(pf,!is.na(gender)),x=www_likes,
      geom='freqpoly',color=gender)+
  scale_x_continuous()+
  scale_x_log10()
```

对于峰值，可能很容易比较，但是对于尾部，就很难比较了。所以对长尾数据，要用对数变换，来获得一个含有更多信息的图形。  
两个条线，一个前面高，一个后面高，那究竟哪个更多呢？可以用汇总信息来回答。  

```r
by(pf$www_likes,pf$gender,sum)
```

这样可以看到男性和女性的点赞总数。虽然男性有少数人的点赞量很高，但是总体上，女性的点赞数要高于男性。  

#### 箱线图
另一种观察变量分布的图形，是箱线图，可以看出中位数的差异。

```r
qplot(data=subset(pf,!is.na(gender)),x=gender,y=friend_count,
      geom='boxplot')+
  scale_y_continuous(limits = c(0,500))
```
当使用ylim或scale_y_continuouse图层时，我们实际上从计算中删除了一些数据点。更好的方法是使用cord_cartesian图层来设置y轴的限制。

```r
qplot(data=subset(pf,!is.na(gender)),x=gender,y=friend_count,
      geom='boxplot')+
  coord_cartesian(ylim = c(0,1000))
```

箱线图中间的黑线，代表了中位数。中位数接近，说明对于男性中间50%和女性中间50%是相似的。女性的中位数比男性的中位数稍高一些，说明女性的好友数稍多一些。  
这里用by看下数据

```r
by(pf$friend_count,pf$gender,summary)
```

我们可以看到，25%的女性好友数高于244个，25%的男性好友数高于182个。  
使用coord_cartesian的目的，是让我们的箱线图与表输出一致。直接在qplot中使用ylim参数，会得到不同的四分位，与图形不符。  

如果要看谁主动添加的好友最多，可以使用names看看都有哪些变量

```r
names(pf)

qplot(data = subset(pf,!is.na(gender)),x=gender,y=friendships_initiated,
      geom = 'boxplot')+
  coord_cartesian(ylim = c(0,150))
```

如果用by summary就能回答这些问题，为何还要创建箱线图呢？因为箱线图可以让帮助我们理解数据的分布，中间50%的值，感知异常值，内容要比summary丰富。
#### 逻辑转换
除了平方根、对数，还可以使用新的二进制变量，仅包含真或假。比如，我们想知道某用户是否使用过某个功能，而不是使用次数。

```r
summary(pf$mobile_likes)

summary(pf$mobile_likes>0)

pf$mobile_check_in <- NA
pf$mobile_check_in <- ifelse(pf$mobile_likes>0,1,0)
pf$mobile_check_in <- factor(pf$mobile_check_in)
summary(pf$mobile_check_in)
```
使用factor将其转换成因素变量

#### 分析单一变量的总结

* 仔细观察数据集中单个变量的重要性
* 了解数据的类型，及其分布形式
* 是否有缺失值或异常值
* 主要通过直方图、箱线图、频数多边形的可视化，了解单个变量
* 根据情况对图形进行调整，调整组距，轴的极限
* 用对数对变量进行变换，或将其变成二进制，来发现数据后面隐藏的模式

### 练习

#### 过滤数据求行数
```r
price <- subset(diamonds,price>=15000)
nrow(price)
```
#### 查看直方图

```r
qplot(data = diamonds,x=price,binwidth=25)+
  scale_x_continuous(limits = c(300,2000),breaks = seq(300,2000,100))
ggsave('priceHistogram.png')
```

#### 按照切割工艺分割直方图

```r
qplot(data = diamonds,x=price)+
  facet_wrap(~cut,ncol=3)

by(diamonds$price,diamonds$cut,summary,digits=max(getOption('digits')))
```
summary默认会四舍五入，在by中指定digits参数，可以显示小数。

我们看到，价格最高的钻石，有高级切割工艺。  
价格最低的钻石，有高级或完美的切割工艺。  
中位数价格最低的钻石，有着完美的切割工艺。  
为什么会出现这样的情况呢？完美切割工艺的钻石，不是才拥有最高的价格么？其实钻石的价格还跟其它因素有关，比如克拉。  
#### 每克拉钻石的价格，按切割工艺分割的直方图

```r
diamonds$unit_price <- diamonds$price/diamonds$carat
summary(diamonds$unit_price)

qplot(data = diamonds,x=unit_price)+
  scale_x_continuous()+
  scale_x_log10()+
  facet_wrap(~cut,scales = 'free_y')

by(diamonds$unit_price,diamonds$cut,summary,digits=max(getOption('digits')))
```
#### 透明度、颜色、切割工艺的箱线图

```r
qplot(data = diamonds,y=price,x=clarity,
      geom='boxplot')+
  coord_cartesian(ylim = c(0,7000))

by(diamonds$price,diamonds$clarity,summary,digits=max(getOption('digits')))

qplot(data = diamonds,y=price,x=color,
      geom='boxplot')+
  coord_cartesian(ylim = c(0,8000))

by(diamonds$price,diamonds$color,summary,digits=max(getOption('digits')))
IQR(subset(diamonds,color=='J')$price)
IQR(subset(diamonds,color=='D')$price)

qplot(data = diamonds,y=price,x=cut,
      geom='boxplot')+
  coord_cartesian(ylim = c(0,7000))

by(diamonds$price,diamonds$cut,summary,digits=max(getOption('digits')))
```
这里IQR可以求四分位差，因为subset返回的是一个数据框，所以用$price来访问价格变量。  
我们看到，颜色最差的钻石的价格四分位差是5834.5，颜色最好的钻石的价格四分位差是3302.5 。

#### 每克拉钻石不同颜色的价格

```r
qplot(data = diamonds,y=unit_price,x=color,
      geom='boxplot')+
  coord_cartesian(ylim = c(0,8000))

by(diamonds$unit_price,diamonds$color,summary,digits=max(getOption('digits')))
```

#### 颜色价格的频数多变型

```r
qplot(data = diamonds,x=carat,binwidth=0.1,
      geom='freqpoly')+
  scale_x_continuous(breaks = seq(0,2.25,0.1))+
  coord_cartesian(ylim = c(1000,3000),xlim =c(0,2.25) )
```
这里通过调整binwidth，可以查看价格高于2000的克拉都有哪些。

[tidyr](用于重塑数据布局的包)  
[dplyr](用于帮助转换整洁的表格数据的包)  

### 观察两个变量
同时观察两个变量要用散点图。

```R
#pf <- read.csv(file = 'pseudo_facebook.tsv',sep='\t',header = TRUE)
pf <- read.delim('pseudo_facebook.tsv')
library(ggplot2)
ggplot(aes(x=age,y=friend_count),data=pf)+
  geom_point()

qplot(data=pf,x=age,y=friend_count)
```

这里可以看到，30岁以下的年轻人的好友数很高。但是有几个超过60岁的年龄的好友数也很好，很有可能是谎报年龄的青少年。

#### 设置点的透明度

在图标底部，很多点是重合的。这里设着透明度为现在的1/20 。

```R
ggplot(aes(x=age,y=friend_count),data=pf)+
  geom_point(alpha=1/20)+
  xlim(13,90)
```

#### 设置抖动

将geom_point 换成geom_jitter。年龄是连续变量，但实际上只有整数值。所以散点图的年龄，完美地排成一列一列。抖动，可以向每个年龄添加一些噪音，使得结果更离散。这样可以得到更清晰的年龄与好友数关系的图像。

设置抖动后，我们发现大多数年轻用户的好友数低于1000。其中，大约69岁左右有一个峰值，看起来和年轻人很相似。

#### 变换轴

使用coord_trans

```R
ggplot(aes(x=age,y=friend_count),data=pf)+
  geom_point(alpha=1/20)+
  xlim(13,90)+
  coord_trans(y='sqrt')
```

添加噪音时，正负数都有可能添加。如果添加了负数的噪音，有可能导致值为负，没法开平方根。所以添加

#### dplyr

有些时候，我们除了看单个的点外，还想问平均好友数随年龄如何变化。这就需要dplyr。这个包可以让我们分割数据帧，然后向数据的某些部分应用某个函数，如filter()，group_by()，mutate()，arrange()。  

常规的方法是：

```R
library(dplyr)
age_groups <- group_by(pf,age)
pf.fc_by_age <- summarise(age_groups,
                          friend_count_mean=mean(friend_count),
                          friend_count_median=mean(friend_count),
                          n=n())
pf.fc_by_age <- arrange(pf.fc_by_age,age)
head(pf.fc_by_age)

```

另一种方法是：

```R
pf.fc_by_age <- pf %>%
  group_by(age) %>%
  summarise(friend_count_mean=mean(friend_count),
            friend_count_median=median(friend_count),
            n=n()) %>%
  arrange(age)

head(pf.fc_by_age)
```

最后，用直线把各个点连接起来

```R
ggplot(data=pf.fc_by_age,aes(x=age,y=friend_count_mean)) +
         geom_line()
```

#### 叠加摘要和原始数据

ggplot可以轻松创建各种汇总，并进行绘图，方便快速地进行数据探索。  

有时候想把摘要图形显示在原始图形上



```R
ggplot(aes(x=age,y=friend_count),data=pf)+
  geom_point(alpha=1/20,position = position_jitter(h=0),color='orange')+
  coord_cartesian( xlim(13,90))+
  coord_trans(y='sqrt')+
  geom_line(stat = 'summary',fun.y=mean)+
  geom_line(stat = 'summary',fun.y=quantile,fun.args=list(probs=.1),linetype=2,color='blue')+
  geom_line(stat = 'summary',fun.y=quantile,fun.args=list(probs=.9),linetype=2,color='blue')+
  geom_line(stat = 'summary',fun.y=quantile,fun.args=list(probs=.5),color='blue')
```

我们从图中可以看到，即使是青少年，也很少有好友数超过1000的。数据会不会受平方根的影响呢？我们把平方根去掉看看。

```R
ggplot(aes(x=age,y=friend_count),data=pf)+
  geom_point(alpha=1/20,position = position_jitter(h=0),color='orange')+
  coord_cartesian( xlim=c(13,70),ylim=c(0,1000) )+
  geom_line(stat = 'summary',fun.y=mean)+
  geom_line(stat = 'summary',fun.y=quantile,fun.args=list(probs=.1),linetype=2,color='blue')+
  geom_line(stat = 'summary',fun.y=quantile,fun.args=list(probs=.9),linetype=2,color='blue')+
  geom_line(stat = 'summary',fun.y=quantile,fun.args=list(probs=.5),color='blue')
```

我们可以看到，青少年的好友数大多数依然低于1000，在30岁到60岁之间的人，好友数大多低于250个。

#### 相关性

现在来看看年龄与好友数之间的相关性。使用Pearson相关系数，来衡量年龄与好友数之间的线形关系。

```R
cor.test(pf$age,pf$friend_count,method='pearson')

with(pf,cor.test(age,friend_count,method='pearson'))
```

我们得到相关系数是-0.0274 。相关系数小于0.3或大于-0.3时，我们认为没有意义。大于0.3或小于-0.3时，我们认为有意义但相关性较小。0.5附近为中等，0.7以上为很大。

#### 子集相关性

通过上面的系数，我们发现年龄和好友数之间不存在线形关系。





