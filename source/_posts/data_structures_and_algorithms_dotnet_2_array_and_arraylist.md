---
title: Data Structures and Algorithms DotNet － 2、数组和ArrayList  
categories:
- Data Structures and Algorithms
tags:
- DotNet
- Data Structures and Algorithms
date: 2016-09-15 11:08:51
---
# 数据结构与算法－2、数组和ArrayList
## 1、数组
C#中数组是一个类对象，其源自System.Array。
### 1.1、数组元素的设置和存取访问
常见的有：

```cs
names[2]="Reinhar Hsu";
myName=names[2];
```

不常见的还有Set和Get方法：

```csharp
names.SetValue("Reinhard Hsu",2);
myname=names.GetValue(2);
```

### 1.2、检索数数组元数据的方法和属性

* Length：返回**所有维数**内元素的总数量
* GetLength：返回**指定维数**内元素的数量
* GetUpperBound：返回**指定维数**内最大的索引号
* Rank：返回数组的维数
* GetType：返回数组实例的类型，如 System.Int32[]

### 1.3、多维数组
C#中数组最多可以达到32维。

	int [,] grades=new int[4,5];

可以对多维数组使用Get方法：

	grade=grades.GetValue(0,2);

但是不能使用Set方法，因为Set方法只接收两个参数，一个是值，一个是索引。  
对于上面那个4行5列的二维数组，可以这样访问：

```csharp
/*最后一门成绩的索引  */
int last_grade=grades.GetUpperBound(1);  

/*最后一个学生的索引  */
int last_student=grades.GetUppderBound(0);  

/*最有一个学生的最后一门成绩  */
grades[last_student,last_grade];  
```

### 1.4、参数数组
这个我们平时很常见，怎么实现呢：

```cs
int Sum(params int[] nums)
{
	int sum=0;
	for(int i=0;i<=nums.GetUpperBound(0);i++)
	{
		sum+=nums[i];
	}
	return sum;
}

total=sum(1,2,3,4,5);
```

使用参数数组定义方法时，参数数组的参数，要放到方法的参数列表的最后，否则编译器不能正常处理。
### 1.5、锯齿数组
之前创建的多维数组，每一行都有相同的元素数。但是有些情况，如12个月中，每个月的天数从28天到31天不等。这时候可以使用锯齿数组，数据量庞大的时候，可以有效减少空间。

```cs
int[] Jan=new int[31];
int[] Feb=new int[29];
int[][] sales=new int[][]{Jan,Feb};
sales[0][0]=41;
```

这里sales是一个有着2个元素的整数数组，每个元素又是一个整数数组。
## 2、ArrayList类
当数组超出存储空间时，ArrayList可以自动调整自身的大小。  
### 2.1、Capacity的初始值真的是16吗？
ArrayList的Capacity属性，存储着数组容量。很多地方说Capacity初始值是16，但是
Reinhard在测试的时候，发现并不是16。详情可以看[DotNet 源代码][1]。

[1]: https://github.com/dotnet/corefx/blob/e88bf5f29be03434bb7b6385c93534deef4a5731/src/System.Collections.NonGeneric/src/System/Collections/ArrayList.cs
### 2.2、ArrayList的内部实现
这里简单讲讲ArrayList内部实现。  
ArrayList里面维护着一个默认起步容量，是4。  
ArrayList里面维护着一个Object数组，使用无参数的构造函数初始化时，或者构造函数的参数Capacity为0初始化时，Object数组就会被初始化为Array.Empty<Object>()。  
ArrayList里面还维护着一个记录元素个数的内部变量size，当插入或新增元素时，size就增加。当删除元素时，size就减小。  
Capacity属性的Get访问器，返回的是Object数组的Length。  
Count属性的Get访问器，返回的是size。
使用无参数的构造函数初始化ArrayList后，因为没有添加过元素，所以size是0，Count就返回0。因为内部Ojbect数组是用Array.Empty<Object>()初始化的，Length是0，所以Capacity也是0。  
这时候给ArrayList添加1个元素，那么ArrayList的容量最小必须是size+1，才能添加得进去。  
ArrayList会看Object数组的长度是不是比size+1小，如果小的话，就得加容量。  
加多少容量呢？先看Object数组的长度现在是多少了。如果是0的话，就给一个默认容量4。如果不是0的话，就现有容量乘以2 。  
这时候Capacity的Set访问器里，就用新的容量初始化一个Object数组，用Array.Copy()，将老的Object数组里的元素，拷贝给新的Ojbect数组，最后将老的Object数组引用指向新的Ojbect数组。  
所以，用无参数构造函数初始化ArrayList后，一个一个地添加元素的话，容量的变化会是0 ，4，8，16，32 ....  
还记得上次我们的性能测试，ArrayList的耗时是Array的16倍不，应该就浪费在容量不够，拷贝来拷贝去了。  
### 2.3、将ArrayList的Capacity设为1亿，性能会不会有所提升呢？
那我们再来测试下容量设为1亿，看性能是否会提升。

	10s~13s之间

虽然提升了20%多，跟Array依然差距明显，看来Array.Copy()的效率还是蛮高的。  
### 2.4、同样都是自动调整自身大小，List为什么就比ArraList快6倍？
那问题出在哪呢？并且List也是自动调整自身大小的，为什么就能比ArrayList快6倍？  
Reinhard看了List的自动调整自身大小的实现，跟ArrayList差不多。但是，List与ArrayList不同的是，List是泛型的，避免了装箱／拆箱的操作。拆箱和装箱就这么影响性能么？   
### 2.5、装箱/拆箱操作对性能的影响
那我们再来测试下，对1亿个整数进行装箱，看看耗时多少。

	2.5s
而给整数赋值的耗时，和给数组赋值耗时是一样的。  
**装箱**，是把一个**值类型**，放在一个未确定类型的**引用对象**中。这个新的**引用类型**（就是箱子），将存储于**堆**上，并且，值类型的一个副本，会存放在引用类型的内部。箱子里包含了值类型的副本，并且提供了值类型公有接口的功能。  
**拆箱**，是从箱中取出值类型的副本。**这个副本，是值类型的另一个副本**。  
也就是，**关键之处在于，装箱时存放的是值类型的副本，获取箱中数据时，返回的是值类型的另一个副本**。  
