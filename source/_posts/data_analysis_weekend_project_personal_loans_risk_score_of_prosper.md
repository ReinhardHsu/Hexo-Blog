---
title: Data Analysis Weekend Project 美国金融科技公司Prosper的风险评分分析
date: 2017-12-26 22:31:59
categories:
- Data Analysis
tags:
- Data Analysis
- Weekend Project
---

今年[Reinhard Hsu](http://reinhardhsu.com/)觉得最有意思的事情，是参加了拍拍贷第二届魔镜杯互联网金融数据应用大赛。通过“富爸爸队”，认识了一群小伙伴，带领大家成功进入到复赛阶段，并打造了复赛阶段用户评分最高的分析类产品。详见[《祝贺富爸爸队的投资分析作品成功进入拍拍贷魔镜杯复赛阶段》](http://reinhardhsu.com/p/8120229.html)。

Prosper是美国的一家金融科技公司，[Reinhard Hsu](http://reinhardhsu.com/)在进入金融科技行业前就已经知道该公司，因为名字与[Reinhard Hsu](http://reinhardhsu.com/)之前的老东家非常相似，以至于Tableau的原厂顾问在一开始以为我的老东家与他的老客户Prosper是同一家公司。

这次[Reinhard Hsu](http://reinhardhsu.com/)使用R语言对Prosper公开数据集的分析，看看Prosper风险评分的影响因素都有哪些。

## 主要指标的统计描述

```R
## 'data.frame':    84853 obs. of  14 variables:
##  $ CreditGrade                        : Factor w/ 7 levels "AA","A","B","C",..: 2 2 5 3 6 4 1 1 4 3 ...
##  $ Term                               : int  36 36 36 60 36 36 36 36 60 36 ...
##  $ BorrowerAPR                        : num  0.12 0.125 0.246 0.154 0.31 ...
##  $ EmploymentStatus                   : Factor w/ 7 levels "Employed","Full-time",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ EmploymentStatusDuration           : int  44 113 44 82 172 103 269 269 300 1 ...
##  $ InquiriesLast6Months               : int  3 0 1 0 0 3 1 1 1 1 ...
##  $ BankcardUtilization                : num  0.21 0.04 0.81 0.39 0.72 0.13 0.11 0.11 0.51 0.7 ...
##  $ DebtToIncomeRatio                  : num  0.18 0.15 0.26 0.36 0.27 0.24 0.25 0.25 0.12 0.18 ...
##  $ ProsperPaymentsLessThanOneMonthLate: int  NA NA 0 NA NA NA NA NA NA NA ...
##  $ ProsperPaymentsOneMonthPlusLate    : int  NA NA 0 NA NA NA NA NA NA NA ...
##  $ LoanOriginalAmount                 : int  10000 10000 15000 15000 3000 10000 10000 10000 13500 4000 ...
##  $ ProsperScore                       : num  7 9 4 10 2 4 9 11 7 4 ...
##  $ ListingCreationDateInHour          : num  8.47 11.03 18.63 8.43 9.87 ...
##  $ CreditScoreRangeMean               : num  690 810 690 750 690 ...
```

```R
##  CreditGrade      Term        BorrowerAPR           EmploymentStatus
##  AA: 5372    Min.   :12.00   Min.   :0.04583   Employed     :67310  
##  A :14551    1st Qu.:36.00   1st Qu.:0.16328   Full-time    : 7927  
##  B :15581    Median :36.00   Median :0.21945   Not employed :  649  
##  C :18345    Mean   :42.49   Mean   :0.22666   Other        : 3806  
##  D :14274    3rd Qu.:60.00   3rd Qu.:0.29254   Part-time    :  256  
##  E : 9795    Max.   :60.00   Max.   :0.42395   Retired      :  367  
##  HR: 6935                                      Self-employed: 4538  
##  EmploymentStatusDuration InquiriesLast6Months BankcardUtilization
##  Min.   :  0.0            Min.   : 0.0000      Min.   :0.0000     
##  1st Qu.: 30.0            1st Qu.: 0.0000      1st Qu.:0.3300     
##  Median : 74.0            Median : 0.0000      Median :0.6000     
##  Mean   :103.1            Mean   : 0.9646      Mean   :0.5642     
##  3rd Qu.:148.0            3rd Qu.: 1.0000      3rd Qu.:0.8300     
##  Max.   :755.0            Max.   :27.0000      Max.   :2.5000     
##  NA's   :19                                                       
##  DebtToIncomeRatio ProsperPaymentsLessThanOneMonthLate
##  Min.   : 0.000    Min.   : 0.00                      
##  1st Qu.: 0.150    1st Qu.: 0.00                      
##  Median : 0.220    Median : 0.00                      
##  Mean   : 0.259    Mean   : 0.66                      
##  3rd Qu.: 0.320    3rd Qu.: 0.00                      
##  Max.   :10.010    Max.   :42.00                      
##  NA's   :7296      NA's   :65056                      
##  ProsperPaymentsOneMonthPlusLate LoanOriginalAmount  ProsperScore  
##  Min.   : 0.00                   Min.   : 1000      Min.   : 1.00  
##  1st Qu.: 0.00                   1st Qu.: 4000      1st Qu.: 4.00  
##  Median : 0.00                   Median : 7500      Median : 6.00  
##  Mean   : 0.05                   Mean   : 9083      Mean   : 5.95  
##  3rd Qu.: 0.00                   3rd Qu.:13500      3rd Qu.: 8.00  
##  Max.   :21.00                   Max.   :35000      Max.   :11.00  
##  NA's   :65056                                                     
##  ListingCreationDateInHour CreditScoreRangeMean
##  Min.   : 0.00             Min.   :609.5       
##  1st Qu.: 9.10             1st Qu.:669.5       
##  Median :12.60             Median :709.5       
##  Mean   :12.79             Mean   :708.9       
##  3rd Qu.:16.52             3rd Qu.:729.5       
##  Max.   :23.98             Max.   :889.5       
## 
```

## 单变量

### 借款金额分布

![img](https://ws3.sinaimg.cn/large/006tKfTcgy1fr1eyuwhj7j311c0qot9n.jpg)

我们看到Prosper平台的借款金额主要以15000以下的小额借款为主。其中几个数额的借款人数很多，4000元、10000元、15000元。

### 风险评级

![img](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1eyw6grbj311c0qodgr.jpg)

我们看到风险评级的分布中，中等风险的数量最多，高风险和低风险的数量较少。

### 风险评分

![img](https://ws2.sinaimg.cn/large/006tKfTcgy1fr1eyx6wmgj311c0qogmg.jpg)

我们看到风险评分的4分、6分、8分的数量最多。高分和低分的较少。

### 借款期数

![img](https://ws3.sinaimg.cn/large/006tKfTcgy1fr1eyy47p7j311c0qojs6.jpg)

我们看到Prosper的借款期数主要以长期为主。其中3年期最多，其次是5年期。我们知道一般而言，借款人信用越好，能借到的期数越长，这说明Prosper的借款人的信用看起来还不错。

### 借款人征信数据的信用评分上下限的均值

![img](https://ws3.sinaimg.cn/large/006tKfTcgy1fr1eyz16oxj311c0qogml.jpg)

我们看到这个分布呈右偏分布，有一些借款人的征信信用评分相对比较高。

### 借款人发起借款的时间段

![img](https://ws2.sinaimg.cn/large/006tKfTcgy1fr1eyzymmrj311c0qomy7.jpg)

我们看到绝大多数实在6点到21点之间进行借款的，也有少数在半夜进行借款。

### 借款人当前职业持续月数

![img](https://ws1.sinaimg.cn/large/006tKfTcgy1fr1ez0wlhnj311c0qo75i.jpg)

我们看到这是一个右偏倚数据，在右边有着长长的尾巴。少数人连续从事一份职业能够达到50年之久。数量最多的是1年、2年和3年，其次是不到1年工作状态就发生变化的。

### 信用卡已用额度占比

![img](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1ez1e3oij311c0qo0ts.jpg)

这个数据居然能够超过100%，我觉得有点不可思议。后面我会将异常值过滤掉。大部分人的已用额度在30%到80%之间，中位数在60%左右。

### 负债收入比

![img](https://ws2.sinaimg.cn/large/006tKfTcgy1fr1ez2bkmej311c0qowff.jpg)

我们看到大多数人的负债收入比在17%到32%之间，应该还算是不错的一个水平。

### 借款金额直方图按照借款期数进行分面

![img](https://ws1.sinaimg.cn/large/006tKfTcgy1fr1ez3qozkj311c0qoq4c.jpg)

我们看到，Prosper的借款期数主要以3年期为主，其次是5年期的。而1年期的借款很少。借款金额主要以4000、10000、15000为主，大部分金额较低。

### 单变量分析

我们的Prosper数据集有81个特征，超过11万个观察对象。经过清晰和转换后，我的数据集拥有14个特征，和84853个观察对象。

在本次分析中，我最感兴趣的特征是Prosper对每个散标的风险评分ProsperScore。

Prosper数据集中的特征很丰富，这里我挑选了最感兴趣的14个特征，它们分别是：

| 特征                                | 描述                                       |
| ----------------------------------- | ------------------------------------------ |
| CreditGrade                         | Prosper对散标的风险评级                    |
| Term                                | 借款的期数                                 |
| BorrowerAPR                         | 借款年化利息                               |
| EmploymentStatus                    | 借款人的工作状态                           |
| EmploymentStatusDuration            | 借款人当前工作状态持续的月数               |
| CreditScoreRangeMean                | 借款人征信数据中的信用评分范围上下限的均值 |
| InquiriesLast6Months                | 前6个月借款人征信数据被查询的次数          |
| BankcardUtilization                 | 借款人信用卡已用额度占比                   |
| DebtToIncomeRatio                   | 借款人负债收入比                           |
| ProsperPaymentsLessThanOneMonthLate | 借款人在Prosper逾期还款在一个月内的次数    |
| ProsperPaymentsOneMonthPlusLate     | 借款人在Prosper逾期还款在一个月以上的次数  |
| LoanOriginalAmount                  | 借款人的借款金额                           |
| ListingCreationDateInHour           | 借款人发起借款请求的时间段（小时）         |
| ProsperScore                        | Prosper的风险评分                          |

在拍拍贷魔镜大数据风控系统之父顾鸣博士的一次分享中，我了解到借款人发起借款请求的时间段与散标的风险有一些关系。他给出的理由是，如果一个人在半夜借钱，从概率上讲他很可能是没有工作的。

根据这个提示，我从ListingCreationDate中取出小时，创建了ListingCreationDateInHour特征。

在对特征调查的过程中，我发现借款人征信数据中的信用评分上下线的均值、借款人发起借款请求的时间段，这两个基本呈正态分布。

### Prosper风险评分

因为Prosper风险评分字段在2009年后才加入，我会将之前没有风险评分的数据过滤掉。

在对Prosper风险评级特征进行可视化时，我发现并未按照风险大小的顺序进行排序。我又将其转换为有序因子。

## 双变量

### 风险评级和风险评分

![img](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1ez4lvb0j311c0qowfl.jpg)

```
## 
##  Pearson's product-moment correlation
## 
## data:  as.numeric(as.factor(prosper$CreditGrade)) and prosper$ProsperScore
## t = -289.74, df = 84851, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  -0.7085876 -0.7018231
## sample estimates:
##        cor 
## -0.7052214
```

散标的风险评分给出的分数越高，风险评级的风险越低。这两个特征的皮尔逊相关系数达到了-0.7052，说明这两个特征之间的关系很有意义。很有可能风险评级是根据风险评分去定的。

### 风险评分和借款年化利率

![img](https://ws2.sinaimg.cn/large/006tKfTcgy1fr1ez55j9pj311c0qo763.jpg)

```R
## 
##  Pearson's product-moment correlation
## 
## data:  prosper$ProsperScore and log(prosper$BorrowerAPR)
## t = -277.2, df = 84851, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  -0.6928780 -0.6858159
## sample estimates:
##        cor 
## -0.6893633
```

散标的风险评分给出的分数越高，借款年化利息越低，这两个特征的皮尔逊相关系数是-0.6894，说明这两个特征之间有一定的关系。

### 风险评级和借款年化利率

![img](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1ez62lhpj311c0qo75t.jpg)

```R
## 
##  Pearson's product-moment correlation
## 
## data:  as.numeric(as.factor(prosper$CreditGrade)) and log(prosper$BorrowerAPR)
## t = 808.67, df = 84851, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.9400468 0.9415923
## sample estimates:
##       cor 
## 0.9408244
```

风险评级给出的风险越高，借款年化利率越高。这两个特征的皮尔逊相关系数达到了0.9408，说明这两个特征之间的关系很有意义。很有可能是因为年化利息是根据风险评级而定的。

### 风险评分和负债收入比

![img](https://ws2.sinaimg.cn/large/006tKfTcgy1fr1ez70zxjj311c0qotal.jpg)

```R
## 
##  Pearson's product-moment correlation
## 
## data:  ProsperScore and sqrt(DebtToIncomeRatio)
## t = -80.585, df = 75261, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  -0.2883991 -0.2752455
## sample estimates:
##        cor 
## -0.2818355
```

借款人负债收入比越高，一般风险评分给出的分数越低。这两个特征的皮尔逊相关系数只有-0.2818，没有什么实质性的关系。

### 风险评分和信用卡已用额度占比

![img](https://ws2.sinaimg.cn/large/006tKfTcgy1fr1ez8ucx7j311c0qognd.jpg)

```R
## 
##  Pearson's product-moment correlation
## 
## data:  ProsperScore and BankcardUtilization
## t = -73.435, df = 84842, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  -0.2507807 -0.2381273
## sample estimates:
##        cor 
## -0.2444644
```

借款人信用卡已用额度占比越高，一般风险评分给出的分数越低。但是这两个特征的皮尔逊相关系数只有-0.2445，没有什么实质性的关系。

### 风险评分和征信数据信用评分范围均值

![img](https://ws1.sinaimg.cn/large/006tKfTcgy1fr1ezae4ctj311c0qoq4m.jpg)

```R
## 
##  Pearson's product-moment correlation
## 
## data:  prosper$ProsperScore and prosper$CreditScoreRangeMean
## t = 115.87, df = 84851, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.3637793 0.3753979
## sample estimates:
##      cor 
## 0.369603
```

借款人征信数据中的信用评分范围上下限均值越高，一般风险评分给出的分数越高。这两个特征的皮尔逊相关系数达是0.3696，说明这两个特征之间的关系有意义，但是很小。

### 风险评分和借款金额

![img](https://ws1.sinaimg.cn/large/006tKfTcgy1fr1ezb941ij311c0qomyw.jpg)

```R
## 
##  Pearson's product-moment correlation
## 
## data:  prosper$ProsperScore and prosper$LoanOriginalAmount
## t = 80.475, df = 84851, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.2600308 0.2725335
## sample estimates:
##       cor 
## 0.2662933
```

一般风险评分给出的评分越高，借款人的借款金额越高。这两个特征的皮尔逊相关系数是-0.2663，说明这两个特征之间没有什么实质性关系。

### 风险评分和最近职业持续月数

![img](https://ws3.sinaimg.cn/large/006tKfTcgy1fr1ezcuudhj311c0qota1.jpg)

```R
## 
##  Pearson's product-moment correlation
## 
## data:  ProsperScore and EmploymentStatusDuration
## t = -3.5037, df = 83736, p-value = 0.000459
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  -0.018878712 -0.005334483
## sample estimates:
##         cor 
## -0.01210715
```

风险评分在10分以上的借款人当前职业状态持续月数的中位数，比其它分值的要稍微高一点点。这两个特征的皮尔逊相关系数是-0.0121，说明这两个特征之间没有什么实质性关系。

### 风险评分和最近6个月借款人征信数据被查询次数

![img](https://ws1.sinaimg.cn/large/006tKfTcgy1fr1ezf0l7zj311c0qo40l.jpg)

```R
## 
##  Pearson's product-moment correlation
## 
## data:  prosper$ProsperScore and sqrt(prosper$InquiriesLast6Months)
## t = -95.58, df = 84851, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  -0.3178320 -0.3056831
## sample estimates:
##        cor 
## -0.3117703
```

最近6个月借款人征信数据被查询次数越多，一般风险评分给出的分数越低。这两个特征的皮尔逊相关系数达是-0.3118，说明这两个特征之间的关系有意义，但是很小。

我们看到风险评分在6分及以上的，借款人近6个月征信数据被查询次数大多是0次到1次，中位数是0次。评分在3到5分的，查询次数大多是0次到2次，中位数是1次。评分是1分和2分的，查询次数明显多一点，特别是1分的，查询次数大多是1次到5次，中位数达到了3次。

### 时段和逾期超过一个月的次数的均值

![img](https://ws2.sinaimg.cn/large/006tKfTcgy1fr1ezgvi7mj311c0qo76u.jpg)

```R
## 
##  Pearson's product-moment correlation
## 
## data:  prosper.group_by_hour_late$ListingCreationDateInHour_24 and prosper.group_by_hour_late$ProsperPaymentsOneMonthPlusLate_Mean
## t = 2.6215, df = 22, p-value = 0.01558
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.1051864 0.7447116
## sample estimates:
##       cor 
## 0.4878814
```

通过分析借款人发起借款请求的时间段，与借款人在Prosper逾期还款在一个月以上的次数的均值，我们看到在23点到0点之间发起借款的人，逾期还款一个月以上的次数的均值要高一些。这两个特征的皮尔逊相关系数是0.4879，说明两个特征之间的关系有一定意义。

### 时段和前6个月征信数据被查询的次数的均值

![img](https://ws3.sinaimg.cn/large/006tKfTcgy1fr1ezhroooj311c0qo40x.jpg)

```R
## 
##  Pearson's product-moment correlation
## 
## data:  prosper.group_by_hour_bank$ListingCreationDateInHour_27 and prosper.group_by_hour_bank$InquiriesLast6Months_Mean
## t = 4.476, df = 22, p-value = 0.0001886
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.3977499 0.8555152
## sample estimates:
##       cor 
## 0.6903752
```

通过分析借款人发起借款请求的时间段，与前6个月借款人征信数据被查询的次数的均值，我们看到在20点到2点之间发起借款的人，前6个月借款人征信数据被查询的次数的均值非常高。这两个特征的皮尔逊相关系数是0.6904，说明两个特征之间的关系有一定意义。

我们在办信用卡、贷款、逾期还款时，会查询我们的征信数据。一般我们认为，征信数据近期被查询的次数越高，这个人可能越缺钱，逾期的风险也越大。

### 时段和征信信用评分范围的均值

![img](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1ezirtsxj311c0qoad3.jpg)

```R
## 
##  Pearson's product-moment correlation
## 
## data:  prosper.group_by_hour_bank$ListingCreationDateInHour_27 and prosper.group_by_hour_bank$CreditScoreRange_Mean
## t = -1.9706, df = 22, p-value = 0.06149
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  -0.68387345  0.01904139
## sample estimates:
##        cor 
## -0.3873305
```

通过分析借款人发起借款请求的时间段，与借款人征信数据中的信用评分范围下限的均值，我们看到在20点到2点之间发起借款的人，借款人征信数据中的信用评分范围下限的均值非常低。这两个特征的皮尔逊相关系数是-0.3873，说明两个特征之间的关系有一定意义。

![img](https://ws3.sinaimg.cn/large/006tKfTcgy1fr1ezkke57j31kw1kw4qp.jpg)

通过ggpair函数，我们生成了变量关系矩阵图。我们最感兴趣的是ProsperScore风险评分，我们看到它与借款年华利率之间的关系有一定意义，与过去6个月借款人征信数据被查询的次数之间的关系有一定意义。与信用卡已用额度占比，和借款金额之间没有什么实质性的关系。

### 双变量分析

通过同时对两个特征的分析，我们看到风险评分特征，与其它很多特征有相关性。

我观察了借款人发起借款请求的时段，与逾期超过一个月的次数的均值、前6个月征信数据被查询的次数的均值、征信信用评分范围的均值之间的关系，发现半夜发起借款申请的借款人，缺失风险更大。

发现了借款年化利息与风险评级之间、风险评级与风险评分之间有强相关性。这与我们的业务知识相一致，我们都知道借款年化利息是根据风险评级的高低定的，而风险评级又是根据风险评分定的。

## 多变量

![img](https://ws2.sinaimg.cn/large/006tKfTcgy1fr1ezofv73j311c0qo1g5.jpg)

![img](https://ws1.sinaimg.cn/large/006tKfTcgy1fr1ezr69j7j311c0qox1l.jpg)

```R
## 
## Calls:
## m1: lm(formula = I(ProsperScore) ~ I(InquiriesLast6Months), data = prosper)
## m2: lm(formula = I(ProsperScore) ~ I(InquiriesLast6Months) + BankcardUtilization, 
##     data = prosper)
## m3: lm(formula = I(ProsperScore) ~ I(InquiriesLast6Months) + BankcardUtilization + 
##     CreditScoreRangeMean, data = prosper)
## m4: lm(formula = I(ProsperScore) ~ I(InquiriesLast6Months) + BankcardUtilization + 
##     CreditScoreRangeMean + DebtToIncomeRatio, data = prosper)
## m5: lm(formula = I(ProsperScore) ~ I(InquiriesLast6Months) + BankcardUtilization + 
##     CreditScoreRangeMean + DebtToIncomeRatio + ProsperPaymentsLessThanOneMonthLate, 
##     data = prosper)
## 
## ==============================================================================================
##                                           m1         m2         m3         m4         m5      
## ----------------------------------------------------------------------------------------------
##   (Intercept)                           6.436***   7.732***  -2.847***  -2.822***  -5.580***  
##                                        (0.009)    (0.017)    (0.131)    (0.132)    (0.269)    
##   I(InquiriesLast6Months)              -0.504***  -0.556***  -0.494***  -0.519***  -0.541***  
##                                        (0.006)    (0.005)    (0.005)    (0.005)    (0.010)    
##   BankcardUtilization                             -2.208***  -1.203***  -1.199***  -0.782***  
##                                                   (0.025)    (0.027)    (0.027)    (0.057)    
##   CreditScoreRangeMean                                        0.014***   0.015***   0.019***  
##                                                              (0.000)    (0.000)    (0.000)    
##   DebtToIncomeRatio                                                     -1.080***  -1.438***  
##                                                                         (0.023)    (0.054)    
##   ProsperPaymentsLessThanOneMonthLate                                              -0.036***  
##                                                                                    (0.006)    
## ----------------------------------------------------------------------------------------------
##   R-squared                                  0.1        0.2        0.2        0.3       0.4   
##   adj. R-squared                             0.1        0.2        0.2        0.3       0.4   
##   sigma                                      2.3        2.2        2.1        2.0       2.1   
##   F                                       8194.3     8426.6     8284.2     7122.6    2085.7   
##   p                                          0.0        0.0        0.0        0.0       0.0   
##   Log-likelihood                       -189940.7  -186165.3  -182953.0  -164587.3  -38518.0   
##   Deviance                              437019.4   399811.4   370657.0   316533.1   80115.3   
##   AIC                                   379887.3   372338.7   365916.0   329186.5   77050.0   
##   BIC                                   379915.3   372376.1   365962.7   329242.1   77104.5   
##   N                                      84853      84853      84853      77557     17724     
## ==============================================================================================
```

### 多变量分析

我们看到，征信数据的信用评分上下线均值越低，一般Prosper信用评级给出的风险也越高。

信用卡已用额度占比越低，一般Prosper信用评级给出的风险越低。但是我们注意到信用卡已用额度占比为0的话，也就是这个人没刷信用卡就跑来借钱，Prosper信用评级认为风险很高。

我们知道风险评级是基于风险评分生成的，借款的年化利率又是根据风险评级定的，这两个特征虽然都与风险评分有着较强的相关性，但是因为是先有的风险评分，再有的风险评级，最后才有的年化利率，所以无法使用这两个特征去预测风险评分。

这里生成了模型，使用的都是与风险评分弱相关性的特征，最后模型的r平方系数是0.4，比较低，说明我这里特征可能没有选好。

------

## 总结

### 逾期一个月以上的次数的均值与借款时间段

![img](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1ezuh2nvj311c0qoacu.jpg)

我们看到，正如拍拍贷魔镜大数据风控系统之父顾鸣博士所说，半夜借钱的人，逾期的风险比较高。

特别是0点发起借款申请的人，逾期一个月以上的次数的均值，是其它时间段的2倍以上。

### 风险评分与信用卡已用额度占比

![img](https://ws2.sinaimg.cn/large/006tKfTcgy1fr1ezuytr6j311c0qowgl.jpg)

Prosper的风险评分居然与信用卡已用额度占比有相关性。我们看到已用额度占比的均值越高，风险评分越低。

有可能是因为已用额度占比高的借款人，供他们周转的资金已经很少了，还款压力较大，逾期的风险也更高。

### 借款期限与借款金额

![img](https://ws3.sinaimg.cn/large/006tKfTcgy1fr1ezvrq0ej311c0qo0uc.jpg)

借款期数如此之长，还是挺令我惊讶的。我们看到借款金额主要是15000元以内的小额借款，借款期数却可以长达3年5年。

借款期数长一方面可能是因为，能够通过Prosper审核的借款人都是信用较好的借款人，另一方面也有可能是因为美国那边的信用体系更完善，Prosper能够获取到的用户信用数据更多，美国人更重视信用，所以敢放得长一点。

相对而言，国内的P2P借款主要以短期为主。

------

## 反思

拍拍贷风控负责人曾在分享中提到，他们的风控系统是利用成百上千个特征去建模的，每个特征所占的权重很小，并且他们发现利用高度相关的特征训练出来的模型效果并不好，需要利用大量弱相关的特征去做建模。

所以我觉得，我得到的模型r平方值只有0.4，一方面可能确实是因为我的特征没有选好，另一方面可能真的是需要利用大量弱相关的特征，我用的特征太少了。

我们看到Prosper的风险评分与借款人的一些征信数据有一定相关性，我们可以试着再加入更多的征信数据，看能不能提升模型的效果。

另一方面我们在分析中看到借款发起申请的时段确实与风险有一定关系，但是在最终构建模型时却没有很好地利用上时段这个特征。

国内P2P平台还会利用借款人的住房公积金、社保、社交网络、网购等数据对征信数据进行补充，来构建风控模型，预测风险，这部分数据Prosper的数据集里没有提供，不知道国外P2P是不是仅仅依靠银行征信数据就够。

## 参考文献

【1】.[Searching through Prosper loan listings – listings API](https://developers.prosper.com/docs/investor/listings-api/)

【2】.[Prosper API Definition - Details](https://www.prosper.com/Downloads/Services/Documentation/ProsperAPI_Objects_Details.html)