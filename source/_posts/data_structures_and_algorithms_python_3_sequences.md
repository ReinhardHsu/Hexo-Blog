---
title: Data Structures and Algorithms Python － 3、序列
categories:
- Data Structures and Algorithms
tags:
- Python
- Data Structures and Algorithms
date: 2016-09-15 11:08
---
## 问题
数据序列是如何维护的，哪个组织方案最合适
为何在不同类型的序列中，选择了这个，而没有选那个
列表，链表，栈，队列的有趣算法
哪个排序算法更常用
哪个查找算法更合适

## 列表
无论列表有多大，访问列表中每个位置的时间是一样的。RAM的全称是Random Access Memory，所谓的随机存取，是指存储器中的数据被读取或写入时，所需要的时间与这段信息所在的位置或所写的位置无关。如果是Sequential Access设备，那么所需的时间就与位置有关。

```python
class PyList:
    def __init__(self,contents=[],size=10):
        self.items=[None]*size
        self.numItems=0;
        self.size=size

        for e in contents:
            self.append(e)

    def __getitem__(self,index):
        if index>=0 and index < self.numItems:
            return self.items[index]

        raise IndexError("PyList index out of range")

    def __setitem__(self,index,val):
        if index>=0 and index <self.numItems:
            self.items[index]=val
            return
        raise IndexError("PyList assignment index out of range")

    def __add__(self,other):
        result=PyList(size=self.numItems+other.numItems)

        for i in range(self.numItems):
            result.append(self.items[i])

        for i in range(other.numItems):
            result.append(other.items[i])

        return result
    def __delitem__(self,index):
        for i in range(index,self.numItems-1):
            self.items[i]=self.items[i+1]
        self.numItems-=1

    def __eq__(self,other):
        if type(other)!=type(self):
            return False
        if self.numItems!=other.numItems:
            return False
        for i in range(self.numItems):
            if self.items[i]!=other.items[i]:
                return False
        return True

    def __iter__(self):
        for i in range(self.numItems):
            yield self.items[i]

    def __len__(self):
        return self.numItems

    def __contains__(self,item):
        for i in range(self.numItems):
            if self.items[i]==item:
                return True
        return False

    def __str__(self):
        s="["
        for i in range(self.numItems):
            s=s+repr(self.items[i])
            if i< self.numItems-1:
                s=s+", "
        s=s+"]"
        return s

    def __repr__(self):
        s="PyList(["
        for i in range(self.numItems):
            s=s+repr(self.items[i])
            if i<self.numItems-1:
                s=s+", "
        s=s+"])"
        return s

    def __makeroom(self):
        newlen=(self.size//4)+self.size+1
        newlst=[None]*newlen
        for i in range(self.numItems):
            newlst[i]=self.items[i]
        self.items=newlst
        self.size=newlen

    def append(self,item):
        if self.numItems==self.size:
            self.__makeroom()

        self.items[self.numItems]=item
        self.numItems+=1

    def insert(self,i,e):
        if self.numItems==self.size:
            self.__makeroom()

        if i<self.numItems:
            for j in range(self.numItems-1,i-1,-1):
                self.items[j+1]=self.items[j]
            self.items[i]=e
            self.numItems+=1
        else:
            self.append(e)

def main():
    listA=PyList(['a','b','c'])
    listB=PyList([1,2,3])

    print( listA)

if __name__=="__main__":
    main()

```

这里构建了一个列表，它有10个None值。None代表这个引用指向nothing。
实现了加法操作符，可以将两个PyList连接在一起。  
append方法，会在容量不够的时候增加容量，每次增加25% 。Python 中的List的容量也是这样增加的，4，8,16,25,35,46,58,72,88  
insert方法，会在容量不够的时候增加容量。会导致指定索引之后的数字，往后移动。  
delitem方法，可以通过 del list[10] 这样的方法，删除元素。该元素之后的元素统统往前移动，中间不能留空隙。在Python解释器中，为了节省空间，如果删除后，元素的个数比容量小一半，那么会从可用空间中减少一半的容量。
contains中的查找算法，叫做线性查找。  
Python中有两个方法可以将对象转换为字符串，一个是str，一个是repr。
Python中有一个evaluate函数，可以评估字符串表达式，例如  

```python
eval("1+2")
```
它的结果是3。repr方法就是将对象呈现为适用eval函数的版本。

```python
listA=PyList(['a','b','c'])
strA=repr(listA)
print(strA)

listC= eval(strA)
print( repr(listC))

#PyList(['a', 'b', 'c'])
#PyList(['a', 'b', 'c'])
```
这里，我们注意到str和repr方法中，repr是作用到每个元素身上了。这一点非常必要。不然的话，str或repr会将["a","b"]表示为[a,b]

### 克隆对象
可以看到listA被克隆了，eval(repr(x))这样的克隆，被叫做对对象x的deep clone或deep copy。

```python
#浅拷贝
x=PyList([1,2,3])
y=PyList(x)
```
有deep copy，当然也有shallow copy。浅拷贝，是指x和y这两个对象，共享着item1，item2，item3。  
多数情况下，元素是不是共享的，都不是太重要。就像上面的例子中，1,2,3是integer，integer是不可变的。  
如果共享的是可变元素，那就要非常小心了。在shallow clone中，如果集合的元素是可变的，那么对克隆对象的元素的更改，也会影响到该集合。这种情况在deep clone中就不会发生。  
Shallow clone和deep clone不能简单地说哪一个更好，都要取决于应用。deep clone需要额外的性能和存储，但是更安全。  
### 元素排序
通过实现lessthen方法，可以调用sort进行排序。

```python
list1=[1,2,3]
list2=['a','b','c']
list3=[1,1,'a']
```
list1和list3没法比较，因为一个是integer，一个是string。
list1和list3可以比较，因为还没比到3和'a'，就已经分出大小了。

内建的int，float，str都已经实现了lessthen，我们可以直接用。而像dict类型，就没有，需要自己去定义。
### Selection Sort
选择排序就是做线性搜索，找到最小的元素，把它放到开始的位置。

```python
def select(seq,start):
    minIndex=start
    for j in range(start+1,len(seq)):
        if seq[minIndex]>seq[j]:
            minIndex=j
    return minIndex

def selSort(seq):
    for i in range(len(seq)-1):
        minIndex=select(seq,i)
        tmp=seq[i]
        seq[i]=seq[minIndex]
        seq[minIndex]=tmp
```
### Merge Sort，归并排序
Divide and Conquer，分而治之。将一个问题分成两部分，分别处理每一部分。因为每一小部分比整体更小，所以更易于处理。归并算法可以这样理解：
```python
#待排序数组：
List([1,6,4,3,5,2])

#第一次分割（其实分割的只是索引，比如 0-2一组,3-5一组，并非将原数组变成了2个新的数组。  
#这里为了可视化效果，把索引范围对应的元素，列为一个单独的数组）：
#索引分割为：
[0,1,2],    [3,4,5]

#可视化效果
[1,6,4],    [3,5,2]

#第二次分割：
#对应的索引分割为：
[0],[1,2],  [3],[4,5]

#可视化效果
[1],[6,4],  [3][5,2]

#全部分割成含有1个元素或2个元素的数组，分割的工作就完成了

#对每个数据内部的元素进行排序。排序的方法同下面数组间排序的方法一样，可视化效果：
[1],[4,6],  [3],[2,5]

#到这里，原数组变为
List([1,4,6,3,2,5])

#接着，排序索引为[0,1,2]的两个数组。
#分别从[1]  和[4,6] 这两个数组中，取出第一个元素，进行比较，把小的元素拷贝到一个新的数组中，直到有一个数组先到头
min(1,4)=>  newList([1])

#接着，把新生成的数组中的元素，从开始位置，依次替换原数组中的元素
List[0]=newList[0]

#原数组的可视化效果变为
List([1,4,6,3,2,5])

#接着，排序索引为[3,4,5]的两个数组。
#也就是[3] 和 [2,5]
min(3,2)=> newList([2])
min(3,5)=> newList([2,3])

#接着，把新生成的数组中的元素，从开始位置，依次替换原数组中的元素
List[3]=newList[0]
List[4]=newList[1]

#原数组的可视化效果变为
List([1,4,6,2,3,5])

#接着，排序索引为[0,1,2,3,4,5]的两个数组。
#也就是[1,4,6] 和 [2,3,5]
min(1,2)=> newList([1])
min(4,2)=> newList([1,2])
min(4,3)=> newList([1,2,3])
min(4,5)=> newList([1,2,3,4])
min(6,5)=> newList([1,2,3,4,5])

#如果比较完，左边的数组中还有元素，就把左边数组中的元素全部加入到newList中
[6]=> newList([1,2,3,4,5,6])

#接着，把新生成的数组中的元素，从开始位置，依次替换原数组中的元素
List[0]=newList[0]
List[1]=newList[1]
List[2]=newList[2]
List[3]=newList[3]
List[4]=newList[4]
List[5]=newList[5]

#原数组的可视化效果变为
List([1,2,3,4,5,6])

```
算法如下：

```python
def merge(seq,start,mid,stop):
    lst=[]
    i=start
    j=mid

    while i<mid and j<stop:
        if seq[i]<seq[j]:
            lst.append(seq[i])
            i+=1
        else:
            lst.append(seq[j])
            j+=1
    while i<mid:
        lst.append(seq[i])
        i+=1
    for i in range(len(lst)):
        seq[start+i]=lst[i]

def mergeSortRecursively(seq,start,stop):
    if start>=stop-1:
        return
    mid=(start+stop)//2

    mergeSortRecursively(seq,start,mid)
    mergeSortRecursively(seq,mid,stop)
    merge(seq,start,mid,stop)

def mergeSort(seq):
    mergeSortRecursively(seq,0,len(seq))
```

### Quicksort，快速排序

[Python 2中的魔法代码](http://rafekettler.com/magicmethods.html)

Magic Method|    When it gets invoked (example)|    Explanation
---|---|---
\__new__(cls [,...])|    instance = MyClass(arg1, arg2)|    \__new__ is called on instance creation
\__init__(self [,...])|    instance = MyClass(arg1, arg2)|    \__init__ is called on instance creation
\__cmp__(self, other)|    self == other, self > other, etc.|    Called for any comparison
\__pos__(self)|    +self|    Unary plus sign
\__neg__(self)|    -self|    Unary minus sign
\__invert__(self)|    ~self|    Bitwise inversion
\__index__(self)|    x[self]|    Conversion when object is used as index
\__nonzero__(self)|    bool(self)|    Boolean value of the object
\__getattr__(self, name)|    self.name # name doesn't exist|    Accessing nonexistent attribute
\__setattr__(self, name, val)|    self.name = val|    Assigning to an attribute
\__delattr__(self, name)|    del self.name|    Deleting an attribute
\__getattribute__(self, name)|    self.name|    Accessing any attribute
\__getitem__(self, key)|    self[key]|    Accessing an item using an index
\__setitem__(self, key, val)|    self[key] = val|    Assigning to an item using an index
\__delitem__(self, key)|    del self[key]|    Deleting an item using an index
\__iter__(self)|    for x in self|    Iteration
\__contains__(self, value)|    value in self, value not in self|    Membership tests using in
\__call__(self [,...])|    self(args)|    "Calling" an instance
\__enter__(self)|    with self as x:|    with statement context managers
\__exit__(self, exc, val, trace)|    with self as x:|    with statement context managers
\__getstate__(self)|    pickle.dump(pkl_file, self)|    Pickling
\__setstate__(self)|    data = pickle.load(pkl_file)|    Pickling
