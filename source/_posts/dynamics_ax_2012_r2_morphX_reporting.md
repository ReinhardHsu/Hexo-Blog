---
title: Dynamics AX 2012 R2 MorphX Reporting
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-08-15 11:05:51
---

<font face="微软雅黑"><font size="3">&nbsp;&nbsp;&nbsp; 这几天</font>[<font size="3">Reinhard</font>](http://reinhardhsu.com)<font size="3">有幸体验了下10年前的报表开发技术，用MorphX Reporting技术做了几张报表。十年前也许因为开发工具匮乏，开发人员可以忍受这种开发方式，但是十年后的今天，不得不说它太过时了。</font></font>

<font face="微软雅黑"><font size="3">&nbsp;&nbsp;&nbsp; 其中，最让</font>[<font size="3">Reinhard</font>](http://reinhardhsu.com)<font size="3">抓狂的是，它的可视化布局功能。可视化布局无疑可以加速开发，现在敢问做GUI的开发人员有几个还在硬编码Point(x,y)来布局的。这块儿不得不说是MorphX Reporting的短板，而且到了让人抓狂的程度。</font></font>

<font size="3" face="微软雅黑">&nbsp;&nbsp;&nbsp; 再说Report Body。Reinhard做的报表无非两种，自由格式的报表（类似于请假条、合同、凭证）和带Table的报表。MorphX Reporting的Report Body中，居然完全没有Table的概念，居然是一个控件一个控件挨在一起拼起来的。要想控件相互间内容有分隔线，要设置几乎每个控件的上下左右的Border。好吧，设就设吧，我忍了。当控件中的内容比较多的时候，会换行，这时候行高度就会增加。比如左边控件的内容有两行，右边的控件的内容有一行，那么，对不起，这行数据会显示成这样：</font>



<font size="3" face="微软雅黑">&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;</font>

<font size="3" face="微软雅黑">&nbsp; Reinhard| Reinhard |Reinhard|Reinhard</font>

<font size="3" face="微软雅黑">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Hsu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>

<font size="3" face="微软雅黑">&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;</font>

<font size="3" face="微软雅黑">或者是这样</font>

<font size="3" face="微软雅黑">&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;</font>

<font size="3" face="微软雅黑">&nbsp; Reinhard| Reinhard |Reinhard|Reinhard</font>

<font size="3" face="微软雅黑">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Hsu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>

<font size="3" face="微软雅黑">&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;</font>

<font face="微软雅黑"><font size="3">看到了吧。关于这个问题，</font>[<font size="3">Reinhard</font>](http://reinhardhsu.com)<font size="3">还没找到太好的解决方法，只能通过在Render View的时候，遍历每一行数据，根据列宽计算出内容的行数，再设置这一行中，每一个控件的高度。</font></font>

<font size="3" face="微软雅黑">&nbsp;&nbsp;&nbsp; 说了这么多，也要说说它的优点，那就是和SSRS 比起来，速度较快。</font>

<font face="微软雅黑"><font size="3">&nbsp;&nbsp;&nbsp; </font>[<font size="3">Reinhard</font>](http://reinhardhsu.com)<font size="3">觉得，报表最根本的其实有三点：数据，视图和权限。围绕这三点，越简单越好。有时候提供太多的语法糖和封装，反而会让人迷失，也不一定好用。</font></font>

<font size="3" face="微软雅黑"></font>

<font size="3"></font>
