---
title: Data Structures and Algorithms Python － 1、概览
categories:
- Data Structures and Algorithms
tags:
- Python
- Data Structures and Algorithms
date: 2016-09-15 11:47
---

Python是[Reinhard][8e657a3b]毕业后自学的第一门语言，可是因为工作中用不到，学了忘，忘了又学，断断续续学了很多遍，也没有学好。  

[8e657a3b]: http://ReinhardHsu.com "Reinhard Hsu"

我们都知道Python在科研领域有很广泛的应用，这次趁着做数据分析的契机，重温下Python，希望是最后一遍。  

## 关键概念

Python是一门解释型语言。在写完代码后，不用编译，就能直接运行。  
Python也是动态型的语言。所以在写代码的时候，不会收到任何类型错误的提示。写代码的时候会收到语法错误。程序运行的时候会收到运行时错误。
运行的时候，由Python解释器来解释你写的Python程序。  

## 创建对象

Python是面向对象的语言，所有的东西都是对象，并且在Python中，type和class指的是同一种东西。  

Python中数据的内建类型有：int，float，str，list，dict。

### 创建字面值

```python
x=6
```
Python中，**一切都是引用**。上面的代码，会创建一个新的对象，然后将x指向这个对象。如果等号右边是另一个引用的话，会将x指向那个引用。

### 创建非字面对象

    variable=type(other_object_values)

```python
y='6'
x=int(y)
print(x)
```

这里，y是对str对象A的引用。变量x是一个到对象B的引用，这个对象B是通过使用y指向的对象A来创建的。  

## 在对象上调用方法

对象一般而言，除了保存着数据，还有与其相关的一些行为，这些行为称作*方法*。  
面向对象语言当中，有两类方法，分别是：

1. 赋值方法：会改变已有对象。
2. 访问方法：访问对象的当前状态，但不能修改它。调用访问方法时，会返回一个新的对象引用。

```python
x='how are you'
y=x.upper()
```

upper方法在x指向的对象上调用，并返回一个新的对象。x的值并没有改变。

```python
myList=[1,2,3]
myList.reverse()
```

reverse方法会对现有对象A进行赋值，对象A就是myList指向的对象。一旦调用，赋值不能撤销。

所有的类都包含访问方法。如果一个类没有访问方法，放进去值后，就拿不出来了。  
有的类是没有赋值方法的。如果一个类不包含赋值方法，这个类就是不可变的。**修改不可变的对象时，修改的不是对象本身，而是改变了引用的指向**。

## 实现一个类

类，就是object的一种特殊类型，这种特殊类型，是对数据和方法的定义。  
对象本身，其实就是一个集合，这个集合里放着很多引用，这些引用指向对象中存储的信息。  
每个类都包含一个特殊的方法——constructor。构造器的任务是创建对象的一个实例，设置对象自身内部数据的引用。  
类中有一个特殊的变量——self，它总是指向当前对象，必须是每个类方法的第一个参数。

```python
class Dog:
    def __init__(self,name,month,day,year,speakText):
        self.name=name
        self.month=month
        self.day=day
        self.year=year
        self.speakText=speakText

    def speak(self):
        return self.speakText

    def getName(self):
        return self.name

    def birthDate(self):
        return str(self.month)+"/"+str(self.day)+"/"+str(self.year)

    def changeBark(self,bark):
        self.speakText=bark

boyDog=Dog("Mesa", 5, 15, 2014, "Wooof")    
print(boyDog.speak())
boyDog.changeBark("wofywofy")
print(boyDog.speak())
```

## 操作符重载

Python中大量的内建类和类型，都已经有了操作符重载。例如int，就实现了加法操作符。在Python，__add__ 方法，可以实现加法操作符。当两个int相加时，会调用该方法，该方法会创建一个新的int对象。  

    x+y  =>  x.__add__(y)

```python
class Dog:
    def __init__(self,name,month,day,year,speakText):
        self.name=name
        self.month=month
        self.day=day
        self.year=year
        self.speakText=speakText

    def speak(self):
        return self.speakText

    def getName(self):
        return self.name

    def birthDate(self):
        return str(self.month)+"/"+str(self.day)+"/"+str(self.year)

    def changeBark(self,bark):
        self.speakText=bark

    def __add__(self,otherDog):
        return Dog("Puppy of "+self.name+" and "+otherDog.name,
                   self.month,self.day,self.year+1,
                   self.speakText+otherDog.speakText)

boyDog=Dog("Mesa", 5, 15, 2014, "Wooof")    
girlDog=Dog("Seq",5,6,2014,"BarkBark")
puppy=boyDog+girlDog
print(puppy.speak())
print(puppy.name)
```

## 导入模块

在Python中导入模块的方式有两种，方便的方式，和安全的方式。

```python
from turtle import *
t=Turtle()
```

这是方便的方式，但是不安全。可能你的代码里也有Turtle这个标识符。也可能，Turtle类中的其他标识符跟你的类冲突。

```python
import turtle
t=turtle.Turtle()
```

这是安全的方法，因为可以通过命名空间，将你的模块和turtle模块区分开。

## 缩进

Python是强制缩进的，多少有点没有个性。

## Main函数

程序一开始就执行main函数。

```python
import turtle

def main():
    t=turtle.Turtle()

if __name__=="__main__":
    main()
```

有时候我们的模块会独立执行，有时候会导入到其他模块中执行。  
上面的if语句，可以让我们控制main函数的执行。如果独立执行，就执行main函数，如果是导入到其他模块中，就不会执行main函数。

## 读取文件

### 一条记录存储在一行的情况

```python
filename=input("input the name:")
file=open(filename,"r")

for line in file:
  print(line)

file.close()
```

### 一条记录存储到多行的情况

```python
filename=input("input the name:")
file=open(filename,"r")

while firstLine!="":
  secondLine=file.readLine().strip()
  thirdLine=file.readLine().strip()

  firstLine=file.readLine().strip()

file.close()
```
## 多态性

多态性的字面意思，就是多种形式。放到计算机编程上，就是一个行为，可以以多种方式实现。  

```python
class EndFillCommand:
    def __init__(self):
        pass
    def draw(self,turtle):
        turtle.end_fill()
```

这里的pass，是一个占位符，不会做任何事情。

## 累加器模式
之前的方式是loop模式，这次看看accumulator模式，也就是累加器模式。先初始化一个累加器，然后用循环将数据加到累加器中。

```python
class PyList:
    def __init__(self):
        self.items=[]
    def append(self,item):
        self.items=self.items+[item]
    def __iter__(self):
        for c in self.items:
            yield c

def main():
    list=PyList()
    for i in range(1,11):
        list.append(i)

    for num in list:
        print(num)

if __name__=="__main__":
    main()

```

这里实现了一个容器类，__iter__  代表这个类是可迭代的。如果需要下个元素时，yield会将下个元素让出。这样的话，需要多少元素，就访问多少元素，不会多访问。

## 用Tkinter实现一个GUI
在窗体上，需要放很多widget，如标签，按钮等。frame也是一种widget，它持有其他的widget。
布局，就是向窗体上放widget。Tkinter提供了三种布局：

1. pack：类似于WPF中的Stack布局
2. grid：类似于WPF中的Grid布局
3. place：类似于绝对布局

有了布局之后，还需要frame widget，来持有其他widget。

继承，在面向对象里，有时候你要实现一个类，这个类与其他类很像。

## XML文件
之前读取特定格式文件的弊端，是如果以后结构变动，比如添加了新的属性，调整了属性的顺序，也需要更新程序，然后老的格式的文件就不能用了。这显然是不能接受的。  
用XML文件，就可以向后兼容。XML文档的第一行是特定的标识：

```xml
  <?xml version="1.0" encoding="UTF-8" standalone="no" ?>
```

接下来是元素或者节点。每个节点通过一个tag或一对闭合的tag来标识。  
每个XML元素可能有一些属性，比如GoToCommand可能像这样：

```xml
  <Command x="1.0" y="1.0" width="1.0" color="#000000">GoTo</Command>
```

上面那个元素的文本是GoTo，有时候文本也叫做子数据。  
可以用 __str__ 给类实现一个生成XML元素的方法：

```python
class GoToCommand:
    def __init__(self):
        pass
    def __str__(self):
        return '<Command x="'+str(self.x)+'" y="'+str(self.y)+'" width="'+\
            str(self.width)+'" color="'+self.color+'">GoTo</Command>'
```

## 读取XML文件

因为XML文件不是面向行的文件，所以要用parser解析。解析，是根据语法规则写的。

```python
import xml.dom.minidom

def main():

    filename="test.xml"
    xmldoc=xml.dom.minidom.parse(filename)
    commands=xmldoc.getElementsByTagName("GraphicsCommands")[0]

    for command in commands:
        print(type(command))
        com=command.firstChild.data.strip()
        att=command.attributes
        print(att["color"].value.strip())

if __name__=="__main__":
    main()
```

这里attr变量是一个字典。  
子数据，也就文本，可以用firstChild.data拿到。  
strip()可以省略任何不想要的空白，tab，和字符串中的newline符号。
