---
title: Data Structures and Algorithms Python － 2、递归
categories:
- Data Structures and Algorithms
tags:
- Python
- Data Structures and Algorithms
date: 2016-09-15 11:08
---

## Python程序是怎么运行的

1. 用户运行程序
2. 从磁盘上读取程序，到内存中
3. 操作系统设置两个内存区域，一个叫运行时栈，一个叫堆。程序会用到这两个区域。
4. 操作系统告诉中央处理单元，执行计算机的第一个条指令，以开始执行程序。
5. 程序从键盘，鼠标，硬盘，或其它输入源读取数据。
6. 程序的每一个指令，检索RAM中的一小块数据，操作它，并将新数据写回RAM。
7. 一旦数据处理完，就会在屏幕或其它输出设备中，输出结果。

## 问题

1. Python是如何辨别程序中的标识符
2. 当一个函数被调用后，在运行时栈中发生了什么
3. 当一个函数的调用返回后，在运行时栈中发生了什么
4. 递归函数最重要的两部分是什么，并且哪一部分先执行
5. 当一个return被执行后，发生了什么
6. 如何使用调试器，检查运行时栈的内容

## 范围

Python解释器是如何执行一个Python程序的？

  x=6

上面那句话的意思是，x是一个引用，它指向一个对象，这个对象包含了6 。我们要辨别引用和对象之间的不同。

### 本地范围

本地范围，是计算机当前正在执行的函数的范围。当执行一行代码时，包裹这行代码的范围，就叫做本地范围。在程序声明里引用了一个标识符，Python会先在本地范围中寻找它。

1. 一个声明，像id=???这样，出现在当前范围。这种情况，id是对当前范围中一个对象的引用。
2. id作为一个参数名，出现在当前范围的函数中。这种情况下，id是对被作为参数传递给当前函数的那个对象的额引用。
3. 通过使用def或class，在当前方位中定义函数或类，id作为函数名或类名。

```python
import math

PI=math.pi

def area(redius):
  theArea=PI*radius**2
  return theArea

def main():
  historyOfPrompts=[]
  historyOfOutput=[]

  def getInput(prompt):
    x=input(prompt)
    historyOfPrompts.append(prompt)

    return x

  def showOutput(val):
    historyOfOutput.append(val)
    print(val)

  rString=getInput("")

  r=float(rString)

  val=area(r)

  showOutput(str(val))

if name=="__main__":
  main()
```

程序运行到historyOfOutput.append(val)时，本地范围内定义引用val。如果Python在本地范围内找到了id，它就会查找相应的值，并获取它。这就是在这一行遇到val时，发生的事情。
val指向的对象，会被找到，并拿过来。

### 封闭范围

如果Python在本地范围内没有找到id引用，它会到封闭区间里，看id在不在。程序运行到historyOfOutput.append(val)时，它的封闭区间是整个main函数内的区域。
这个封闭范围内定义的标识符有historyOfPrompts，historyOfOutput，rString，r，val，getInput，showInput。注意，函数名也是标识符。
标识符必须通过id=??的形式定义，它必须是封闭函数的一个参数，或者是在这个封闭函数中定义的类或函数。

### 全局范围

使用太多的全局变量是个坏实践。

### 内建范围

Python先去本地范围找，再去封闭范围找，再去全局范围找，最后会去内建范围找。

```python
x=int("6")
```

Python会在内建范围中，找到int类或结构。
也就是说，你自己做了一个int类的话，那么就没办法用内建范围中的int了，因为Python会先在本地或封闭范围内找到int。

## 运行时栈和堆
一个函数的本地范围中定义的参数和变量，必须存储到RAM中的某个地方。Python将RAM分成两部分：运行时栈和堆。
运行时栈就像食堂的一摞餐盘，很多食堂都有放餐盘的设备，餐盘拿走时，下面会升高，餐盘放上去时，下面会降低，可以一直保持一个完美的高度。
运行时栈，是一个活动记录的栈。当一个函数被调用后，Python解释器会向运行时栈push一个活动记录。当函数return时，Python解释器从运行时栈里pop那个相应的活动记录。
Python在一个活动记录里，存储着本地范围中定义的标识符。当一个函数被调用后，新的范围会变成本地范围。同时，一个新的活动记录会被push到运行时栈中。这个新的活动记录，持有这个新的本地范围中定义的所有变量。当一个函数return，它相应的活动记录会从运行时栈中pop掉。
堆，是所有对象存储的地方。一个对象被创建后，这个对象住在堆中。运行时栈里永远也不会包含对象。对对象的引用，是存储在运行时栈中，并且这些引用指向堆里的对象。
当程序运行到historyOfOutput.append(val)时，运行时栈中会有三个活动记录。
第一个被push到栈中的是module。当module第一次执行时，Python解释器会将module从头到尾看一遍，将module范围内定义的变量，放到module的活动记录里。在这个例子中，就是PI到值3.14159的引用。
接着，module底部的if声明，会调用main函数。这个调用，会导致Python解释器为main函数push一条活动记录。main函数中定义的变量，会放到main函数的活动记录里。包括historyOfPrompts，historyOfOutput，rString，r，val。
当main函数开始执行后，调用到getInput函数。这个调用，会导致Python解释器为getInput函数push一个活动记录。这个活动记录包含prompt和x变量。当解释器从这个函数的调用中返回后，运行时栈中相应的活动记录也会pop掉。
最后，程序调用showOutput函数，showOutput函数的活动记录会push到运行时栈中。本地范围的引用，也就是val变量，会存储到这个活动记录内。

## 递归函数

递归函数，就是自己调用自己的函数。
我们知道，每次调用一个函数时，会给运行时栈push一个该函数的活动记录。
如果一个递归函数永不停止，那么运行时栈会被填满，这是会得到stack overflow error，栈溢出错误。

记录递归函数的4个规则：

1. 决定函数的名字，和函数的参数，和函数的返回值。
2. 首先写递归函数的基本条件。基本条件是一个if声明，通过返回一个值，来处理非常见到那的情况。

```python
def recSumFirstN(n):
    if n==0:
        return 0
    else:
        return recSumFirstN(n-1)+n

def main():
    x=input(input("a non-negative integer: "))
    s=recSumFirstN(x)

    print(str(s))

if __name__=="__main__":
    main()
```

1. 运行程序。
2. module的Activation Record会被push到运行时栈中。
3. main函数的Activation Record会被push到运行时栈中。
4. 当执行到s=recSumFirstN时，是recSumFirstN函数第一次被调用，为函数的这次调用，会push一个新的活动记录。
5. Python解释器带着n指向数字4，jumps到def recSumFirstN处。
6. recSumFirstN(4)开始执行，n的值不是0，所以Python执行return recSumFirstN。
7. 这导致了Python解释器push另一个n=3的activation record到运行时栈中，并且解释器再次jumps到def recSumFirstN处。
8. 这次，n的值是3，不是0，再执行return recSumFirstN，另一个n=2的activation record被push到运行时栈中。

重要的一点是，每次递归函数被调用，变量n都会被复制一份，存储到activation record中。Activation record持有本地变量，和函数的本地范围内的所有变量的参数。
每次函数被调用，一个新的activation record就被push到运行时栈，activation record里面存储着对本地变量的一个新的拷贝。

1. 当程序的执行，遇到n等于0时，Python解释器在代码的第二行找到n等于0。这时，sumFirstN函数才返回它的第一个值。
2. 它返回0给之前的函数调用，也就是n是1的那个。返回发生在代码的第5行。
3. 调用n是0的那个函数产生的activation record，就被pop出运行时栈。
4. 当函数返回后，activation record的空间就被回收。
5. 堆上包含0的对象，也通过垃圾收集器回收了，因为这时已经没有任何引用指向它了。
6. 这里会到第2步，代码的第5行。但是这句声明也包含一个返回声明。
7. 所以，函数再次返回。这次的返回的值是1。
8. 函数再次返回，这次的返回的值是3 。
9. 又回到第5行，这次的返回的值是6 。
10. 最后一次，这次的返回的值是10 。
11. 这时，recSumFirstN函数返回到main函数的第10行，s就指向10值。

1. 接着程序将10打印到屏幕，从main函数return。
2. 从module return。

上面的例子，演示了每次递归调用，都会拷贝一份它的本地变量和参数，到相应的activation record。当一个函数调用返回时，相应的activation record会从运行时栈中pop。递归算法比迭代算法慢的原因可能就在这里。
