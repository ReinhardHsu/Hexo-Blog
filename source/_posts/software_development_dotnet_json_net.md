---
title: Software Development DotNet 使用 Newtonsoft.Json 序列化正常，但是反序列化异常的一点思考
date: 2013-04-14 13:52:45
categories:
- Software Development
tags:
- Software Development
- Json.Net
- DotNet
---

序列化后的字符串都正常，信息完整，但是反序列化却出现了异常。

## 首先是不能反序列化

​    我猜测是我要序列化的类 写的有问题。

我的类实例化的时候，需要向构造函数里传一个数组参数，然后用该数组参数为类的属性赋值。

当初我还为这么写而感到高兴。现在觉得问题就出在这里。

将构造函数改成无参数，属性赋值部分放到类实例化的时候，在类外面做。

ok，类是可以反序列化出来了。

## 可是发现类的有些属性的值却丢失了

我猜测，可能反序列化是一个赋值的过程，这些属性可能定义时写为只能get不能set。

查看定义，发现确实如此，加上set后，OK了