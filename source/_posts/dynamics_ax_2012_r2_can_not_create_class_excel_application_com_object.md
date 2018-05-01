---
title: Dynamics AX 2012 R2 无法创建类 Excel.Application 的COM对象
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2016-02-19 08:52:30
---

<span style="font-family: '微软雅黑 Light'; font-size: large;">![Image](http://reinhardhsu.com/wp-content/uploads/2016/02/Image.png "Image")</span>

<span style="font-family: '微软雅黑 Light'; font-size: large;">    [Reinhard](http://reinhardhsu.com)在做一个Excel导入项目时，发现X++代码一旦执行到Excel组件部分，就会报如下错误：</span>

> _<span style="font-family: '微软雅黑 Light'; font-size: large;">无法创建类&#8221;Excel.Application&#8221;的COM对象。请确保在计算机&#8221;&#8221;上已正确注册该对象。</span>_

<span style="font-family: '微软雅黑 Light'; font-size: large;">    根据错误提示，我们先去组件服务中，查找名为Microsoft Excel Application的COM组件。</span><span id="more-576"></span>

<span style="font-family: '微软雅黑 Light'; font-size: large;">![Image(1)](http://reinhardhsu.com/wp-content/uploads/2016/02/Image1.png "Image(1)")</span>

<span style="font-family: '微软雅黑 Light'; font-size: large;">    [Reinhard](http://reinhardhsu.com)并没有在COM组件列表中，找到该COM组件。我们知道，Microsoft Excel Application COM组件是随Office Excel一起安装的，可能是因为这台客户机没有安装Office Excel导致的。</span>

<span style="font-family: '微软雅黑 Light'; font-size: large;">    [Reinhard](http://reinhardhsu.com)试着装了一下Office Excel，再到COM组件列表中，这次找到Microsoft Excel Application COM组件了。当然，社区中也有一些不装Office Excel，而是仅仅手工注册Excel COM组件方法的介绍，但是过程太麻烦，有兴趣的同学可以试试。</span>

<span style="font-family: '微软雅黑 Light'; font-size: large;">![Image(2)](http://reinhardhsu.com/wp-content/uploads/2016/02/Image2.png "Image(2)")</span>

<span style="font-family: '微软雅黑 Light'; font-size: large;">    [Reinhard](http://reinhardhsu.com)在AX中再次执行Excel导入的操作，已经可以正常执行了。</span>

&nbsp;
