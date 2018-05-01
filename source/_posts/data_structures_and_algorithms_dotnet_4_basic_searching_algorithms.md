---
title: Data Structures and Algorithms DotNet － 4、基础查找算法
categories:
- Data Structures and Algorithms
tags:
- DotNet
- Data Structures and Algorithms
date: 2016-09-15 11:08:51
---
# 数据结构与算法－4、基础查找算法
排序，查找，是最常用的两种数据操作，所以也是计算机科学领域最值得研究的两种操作。  
当列表中的数据随机排列时，可以使用顺序查找。当列表中的数据有序排列时，可以使用二叉查找。
## 1、顺序查找
顺序查找也称线性查找，从列表的开始位置开始，遍历每条记录，直到找到要找的记录，或遍历完整个列表。  
### 1.1、顺序查找算法实现

```cs
		public static int SeqSearch(int[] arr, int value)
		{
			for (int index = 0; index < arr.Length; index++)
			{
				if (arr[index] == value)
				{
					return index;
				}
			}

			return -1;
		}
```

### 1.2、自组织数据
根据**Pareto**的**二八法则**，80%的操作，都是在寻找那列表中20%的数据。如果我们**将经常查找的数据放在列表的前面**，就可以提高顺序查找算法的效率。思路也很简单，每当数据项被找到一次，就把它的位置往前挪一点。  

> 二八法则，也叫帕累托分布，这个概率分布是科学家Vilfredo Pareto在19世纪后期，研究收入与财富的扩散时发现的。

**自组织**数据，是指在程序运行后，由程序自身进行组织数据的一种形式。  
### 1.2.1、算法实现

```cs
		public static int SeqTopSearch(int[] arr, int value)
		{
			for (int index = 0; index < arr.Length; index++)
			{
				if (arr[index] == value)
				{
					if (index > 0)
					{
						Swap.SwapArray(arr, index - 1, index);
					}
					return index-1;
				}
			}

			return -1;
		}
```

## 2、二分查找
当列表中的数据项是有序排列时，使用二分查找会更加高效。`如果列表里存储的是无序数据，那么使用二分查找，可能会找不到。`  
比如猜数字的游戏，1到10十个数字，先猜[(0+9)/2=4]=5，小了的话，就猜[(5+9)/2=7]=8，还小的话，就是[(8+9)/2=8]=9，还小的话，就是[(9+9)/2=9]=10了。
### 2.1、算法实现

```cs
		public static int BinSearch(int[] arr, int value)
		{
			int upper, lower, mid;
			upper = arr.Length - 1;
			lower = 0;
			while (lower <= upper)
			{
				mid = (upper + lower) / 2;
				if (arr[mid] == value)
				{
					return mid;
				}
				else {
					if (value < arr[mid])
					{
						upper = mid - 1;
					}
					else {
						lower = mid + 1;
					}
				}

				Console.WriteLine(mid);
			}
			return -1;
		}
```

### 2.2、递归二分查找
从上面可以看到，每次迭代，都会把问题变成一个更小的同类问题，这不正是递归的思路么。  
大家都知道递归的算法效率不高。为什么不高呢？这里找到一篇博文：[递归的效率问题及递归与循环比较][1]。

> 大家都知道递归的实现是通过调用函数本身，函数调用的时候，每次调用时要做地址保存，参数传递等，这是通过一个递归工作栈实现的。具体是每次调用函数本身要保存的内容包括：局部变量、形参、调用函数地址、返回值。那么，如果递归调用N次，就要分配N*局部变量、N*形参、N*调用函数地址、N*返回值。这势必是影响效率的。

[1]: http://www.cnblogs.com/BeyondAnyTime/archive/2012/05/19/2508807.html

#### 2.2.1、递归二分查找算法实现

```cs
		public static int RBinSearch(int[] arr, int value,int upper=-1,int lower=-1)
		{
			if (upper == -1&&lower==-1)
			{
				upper = arr.Length - 1;
				lower = 0;
			}

			if (lower > upper)
			{
				return -1;
			}

			int mid= (upper + lower) / 2;

			/*Console.WriteLine(mid);*/

			if (arr[mid] == value)
			{
				return mid;
			}
			else if (value < arr[mid])
			{
				upper = mid - 1;
				return RBinSearch(arr, value, upper, lower);
			}
			else {
				lower = mid + 1;
				return RBinSearch(arr, value, upper, lower);
			}

		}
```

### 2.3、Array.BinarySearch
DotNet提供了一个Array.BinarySearch的实现。

### 2.4、效率
2.6亿个有序数字中，查找0的耗时：

```
	迭代	2.21s
	递归	2.36s
	Array.BinarySearch	2.43s
```

我们看到，耗时十分接近，一方面说明我的数据量太小了，另一方面说明计算机的配置真的是提升得太快了。  
怪不得有些公司说，能加堆硬件解决的问题，就不修改代码。硬件的成本跟人的时间比起来，真的是不值钱。  
这样，是不是就不用学数据结构和算法了呢？其实恰恰相反。人类造出了跑得更快的汽车，飞得更高的飞机，但是同时，人类却没有放弃对自身精神和肉体上，更高、更快、更远、更强的追求。  
堆硬件的方法，只是小公司权衡项目成本下的无奈之举。而对于大公司而言，他们会雇佣最聪明的人，把每一块儿优化到极致。因为与他们在全球节省的成本相比，在这些人身上的投入不算什么。  
对于我们开发人员自身来讲，这些东西，就是让我们能够跑得比别人快、飞得比别人高的基石。  
这里点首周杰伦的《[听妈妈的话][2]》送给大家。

[2]: http://music.163.com/song?id=185879
