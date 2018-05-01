---
title: Data Structures and Algorithms DotNet － 7、String类和StringBuilder类
categories:
- Data Structures and Algorithms
tags:
- DotNet
- Data Structures and Algorithms
date: 2016-09-15 11:08:51
---
# 数据结构与算法－7、String类和StringBuilder类
这部分其实大家都很熟悉了，就少说点。
## 1、String类
C#中的字符串，用起来像是一个值类型，实际所有的字符串都是String类的一个对象，也就是引用类型。
引用类型做比较的时候，比较的是地址。但是C#中的String有点特殊，在比较的时候，比较的是值。比如：  

```cs
	str1==str2
	str1.equal(str2)
```

这些比较都是比较的一个一个字符的ASCII码，并非比较了地址。
具体可以参考这两篇博文：[C# string 特殊的引用类型][1]，和[CLR via C# 边读边想 05 - 原生类型，值类型，引用类型][2]。

[1]: http://www.cnblogs.com/justForMe/archive/2010/09/09/1822203.html
[2]: http://www.cnblogs.com/richardzhaoxb/archive/2012/06/27/2565838.html
[3]: http://pic002.cnblogs.com/img/wl98766789/201009/2010090810375585.jpg
[4]: http://pic002.cnblogs.com/img/wl98766789/201009/2010090810382718.jpg
这里用上面博文中的例子予以说明。将字符串，作为参数，传递给一个方法，想在方法中修改这个字符串。

```cs
	static void Main(string[] args) {
		string str = "string"; 	
		Change(str);
		Console.WriteLine(str);
	}

	static void Change(string str) {
		str = "Changed";
	}
```
![][3]  


![][4]  
`很显然，字符串一旦创建，就是不可变的。每当改变字符串时，实际会生成一个新的对象来保存数值。`  
如果想修改str，就得传地址，而不是传值。上面的方法参数里，应该用ref或out。
## 2、StringBuilder
当改变StringBuilder对象时，改变的就是原始的那个对象，而不是副本。
