---
title: Data Analysis NumPy和Pandas
categories:
- Data Analysis
tags:
- Data Analysis
- Python
- NumPy
- Pandas
date: 2016-09-24 20:22
---
## 一维数据
NumPy（Numerical Python）

* Array：使用较为简单

Pandas

* Series：是基于NumPy的Array，但是提供了更多的特性

### NumPy
数组中的元素应该有着相同的数据类型  
可以使用遍历数组中的元素  
可以切片，a[1:3]，索引1和2的两个元素
提供了方便的函数，如mean()，std(),max(),min()  
可以是多维的

argmax()可以回去最大值的索引

#### 向量运算，线性代数
这部分其实大学的线性代数课程里都讲过了，和大家再回忆下，温故而知新。  
向量相加  
1,2,3 + 4,5,6 = 5,7,9  
如果是Python中的列表相加  
1,2,3 + 4,5,6 = 1,2,3,4,5,6  

向量乘以一个数字  
1,2,3 * 3 = 3,6,9  
如果是Python中的列表乘以一个数字  
1,2,3 * 3 = 1,2,3,1,2,3,1,2,3  

在NumPy中，a&b执行 按位与 运算，它和 逻辑于 不一定相同。但是如果数据类型是布尔型的话，那么按位与和逻辑与的作用是一样的。  
可以用np.logical_and(a,b)对整数向量进行逻辑与运算。也可以先把整数转换成布尔向量。  
类似，a|b执行按位或，~a执行按位非。如果是布尔向量，那么逻辑或和逻辑非的效果一样。  

#### 索引数组

```python
a=[1,2,3,4,5]
b=[False,False,True,True,True]  

a[b]=[3,4,5]  
a[a>2]=[3,4,5]  
a>4  =[False,False,False,False,True]  
```

#### + vs +=

```python
a=[1,2,3]
b=a
a=a+np.array([1,1,1])
print b

a=[1,2,3]
b=a
a+=np.array([1,1,1])
print b
```
这里，a和b指向同一块内存，a=a+？？，会创建一个新的数组，a指向了新的，b指向的还是之前的。  
而+=，原位运算，会将新值存储在原来的地址。

#### 切片

```python
a=np.array([1,2,3])
slice=a[:2]
slice[0]=100
print a
```
这里，切片并没有创建一个新的数组，而是共享着a中的元素。所以切片非常快速，但是操作要十分小心。  

### Pandas
Pandas的Series与NumPy的array十分相似，也可以切片，循环，向量操作，也是c实现的，比Python要快。

#### 索引
Series比NumPy好的地方是，能够添加索引

```python
a=pd.Series([1,2],index=['us','zh'])
country_name=a.argmax()
print a.loc[country_name]
```
如果没有指定索引，默认索引会是0，1，2.  
而NumPy的Array是没有索引的

```python
a=np.array([1,2,3])
a[0]
```
NumPy Array的这里只能称为位置0，而不能称为索引0。  

* 按索引，索引相同的才相加，而不是按位置。
* 索引不同的时候，会列出所有索引，相同的相加。一个里面有一个里面没的显示为NaN，非数字。
* 要去掉结果中的NaN，可以使用dropna()，结果只显示索引匹配的值。
* 如果一个有，一个没的也要保留，那么可以用add()，而不是用+ 。

#### 如果想要的计算没有内建怎么办

1. 使用循环
2. 使用类似于map的apply()，对每个元素进行计算。

```python
s+3
s.apply(add3)
```
## 二维数组

NumPy

* 2D Array

Pandas

* DataFrame

### NumPy
与Python中的list有点不同：

1. [更省内存](http://docs.scipy.org/doc/numpy/reference/arrays.ndarray.html#internal-memory-layout-of-an-ndarray)
2. 通过a[1,2]来访问元素，而不是 a [1] [2] 。
3. 可以对整个数组进行mean()等运算

#### 分片
a[1:3,3:5]，取第2第3行的第4第5列，也就是4个元素。其中第2行的两个元素组成一个数组，第3行的两个元素组成一个数组。返回的结果类似于

```python
[[1 ,2],
[3,4]]
```
#### 运算
对应位置的元素才会相互作用

```python
a=np.array([
[1,2],
[3,4]
])

a[0,:]+a[1,:]=[4,6]

a[:,0]+a[:1]=[3,7]
```

#### 轴
NumPy的array的方法中，可以指定轴，对行或列进行运算。如:

```python
a.mean(axis=0)
```

就是对算每一行的平均值，结果是一个数组。

#### 数据类型
NumPy的array中，所有元素的数据类型应该是一致的。否则，所有数据都会变成字符串。这样就没法进行数值运算。

### Pandas
DataFrame中的每一列可以是不同类型。  
DataFrame中的通过索引取的是行，列的话有列名

#### 分片

```python
col_name=a.iloc[0].argmax()
print a[col_name].mean()
print a.values.mean()
print a.mean()
```

上面的例子是找到第1行中的最大值的列名。  
然后打印出那一列的平均值。  
接着打印出整个DataFrame中数值的平均值。  
最后打印出每个数值列的平均值。   

#### 计算相关性，Pearson矩阵相关系数r
将变量x的每个值转换成标准偏差x_std，这一过程称为标准化。  
将变量x的每个值转换成标准偏差y_std，这一过程称为标准化。
只有标准化后，x和y才有可比性。  
然后两个标准偏差向量相乘，再求平均值 (x_std*y_std).mean()。  

```python
x_std=(x-x.mean())/x.std(ddof=0)
y_std=(x-x.mean())/y.std(ddof=0)
r=(x_std*y_std).mean()
```
这样就算出了皮尔逊矩阵的相关系数。  
如果再坐标系中表示的话，如果x比x的平均值大1个标准偏差，y也比y的平均值大1个标准偏差，那么(x,y)的点就在第一象限，这样r就是正相关。如果x比x的平均值大，y比y的平均值小，那么就在第四象限，这样r就是负相关。  
皮尔逊的矩阵相关系数r，介于-1和1之间，接近0时，说明相关性非常低。  
[扩充读物](http://onlinestatbook.com/2/describing_bivariate_data/pearson.html)  
因为std()默认使用贝塞耳矫正系数。需要使用ddof=0来禁用矫正。  
其实NumPy中自带的有corrcoef()来计算皮尔逊矩阵的相关系数。  

#### 移动元素
一个数组记录了总数，求增长

```python
a=pd.DataFrame([10,11,12])
b=a.shift(1)
#[NaN,10,11]
a-b
#[NaN,1,1]
```
这样将a数组中的元素向后移动一个位置，总容量还是3 。最后求出了增长。  
除了shift()，用diff()求出的结果也是一模一样。

#### applymap和apply
`NumPy的std默认是总体标准偏差，也就是ddof=0。而Pandas的std默认是样本标准偏差，也就是ddof=1。`  
applymap是对每个元素独立运算，比如85-100分是优秀  
apply是对DataFrame的每个Series进行运算，比如得分排名比80%的同学都好时，得A。   
Pandas中有一个qcut()，可以执行此类运算  
```python
def cut(data)
  return pd.qcut(data,
    [0,0.6,0.8,1],
    labels=['C','B','A'])
```
`qcut只能操作list，array，Series。`  
如果要操作DataFrame，可以用apply，来对每一列调用qcute:
```python
data.apply(cut)
```
apply()还能算每一列的最大值与第二大值
```python
data.apply(np.max) = data.max()


def second(column):
    sorted_column = column.sort_values(ascending=False)
    return sorted_column.iloc[1]

print data.apply(second)
```
#### Series和DataFrame相加
DataFrame和DataFrame相加我们都知道，对应位置的元素会相加。  
但是Series和DataFrame相加呢？我们知道，Series是有index的概念的，也就是列名。只有Series和DataFrame列名匹配的元素，才会相加。

#### 向量运算
之前我们用apply来对列做归一，现在如果用向量运算的话，会是这样  
```python
grades_df = pd.DataFrame(
    data={'exam1': [43, 81, 78, 75, 89, 70, 91, 65, 98, 87],
          'exam2': [24, 63, 56, 56, 67, 51, 79, 46, 72, 60]},
    index=['Andre', 'Barry', 'Chris', 'Dan', 'Emilio',
           'Fred', 'Greta', 'Humbert', 'Ivan', 'James']
)

standardize=(df-df.mean())/df.std(ddof=0)
```
如果对行做归一的话，向量运算会是这样
```python
col_mean= df.mean(axis='columns')
col_sub=df.sub(col_mean, axis='index')
col_std=df.std(ddof=0,axis='columns')
standardize_rows=col_sub.div(col_std, axis='index')
```
#### 分组
```python
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

filename = '/Users/reinhard/subway_weather.csv'
subway_df = pd.read_csv(filename)

mean_hour=subway_df.groupby('hour')['ENTRIESn_hourly'].mean()
print mean_hour
plt.plot(mean_hour)
plt.show()

mean_day_week=subway_df.groupby('day_week')['ENTRIESn_hourly'].mean()
plt.plot(mean_day_week)
plt.show()
```
默认分组完毕后，用户分组的条件，会跑到index上去，不再是column了。可以使用*as_index=False*来将分组条件留在column上。


#### 合并多个DataFrame
如果两个DataFrame的关联列有相同的列名

```python
data1.merge(data2,on=['col1','col2'],how='inner')
```
如果列名不一样

```python
data1.merge(data2,left_on=['col1','col2'],right_on=['col3','col4'],how='inner')
```
#### 用散点图展示
散点图有一些参数，c是颜色,s是大小,alpha是透明度
```python
way= subway_df.groupby(['latitude','longitude'],as_index=False)['ENTRIESn_hourly'].mean()
print way
s=way['ENTRIESn_hourly']/way['ENTRIESn_hourly'].std()
plt.scatter(way['latitude'],way['longitude'],s=s*10)

plt.show()
```

#### 处理缺失值
df.fillna(0)会用0值替换整个数据框中所有列的缺失值。  
df['CollumnName'].fillna(0,inplace=True)，指替换指定列的缺失值。

### 三维数据

#### NumPy
array可以这样表示多维数据。一维：

```python
a=np.array([1,2,3])
```
二维:

```python
a=np.array([
  [1,2],
  [1,2]
])
```
三维:

```python
a=np.array([
  [[1,2],[3,4]],
  [[5,6],[7,8]]
])
```
#### Pandas
[Panels](http://pandas.pydata.org/pandas-docs/stable/dsintro.html#panel)用于表示三维数据
