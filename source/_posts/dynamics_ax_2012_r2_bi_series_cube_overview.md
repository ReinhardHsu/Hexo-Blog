---
title: '[译]Dynamics AX 2012 R2 BI系列-Cube概览'
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
- Data Analysis
date: 2015-10-08 09:14:20
---

[<span style="font-family: 微软雅黑; font-size: large;">https://msdn.microsoft.com/EN-US/library/dd252604.aspx</span>](https://msdn.microsoft.com/EN-US/library/dd252604.aspx)

<span style="font-family: 微软雅黑; font-size: large;">    Cube是一个多维度的结构，它是BI应用开发的基础。本文描述了cube的组成部分，让你能更好地理解如何使用cube来分析数据。</span>

## <span style="font-family: 微软雅黑;">1、Cube的结构</span>

<span style="font-family: 微软雅黑; font-size: large;">    一个cube由一组测量和维度属性构成。对于AX分析cube，测量和维度在AOT中定义。Perspective用于标识那些包含着测量和维度的表和视图。</span><span id="more-537"></span>

### <span style="font-family: 微软雅黑;">1.1、测量</span>

<span style="font-family: 微软雅黑; font-size: large;">    一个测量，是表或视图中一个包含着可计量的数据的列，通常是数字，可以被聚合。测量，相当于是用户想要审查或分析的东西。例如收入，收益，或卖出的产品总数。当你指定一个测量，你也必须指定一个聚合功能，用于聚合数据。一个Cube有一个或多个测量。</span>

<span style="font-family: 微软雅黑; font-size: large;">    你在AX中指定的测量，会被加到测量组中。</span>

<span style="font-family: 微软雅黑; font-size: large;">    你可以使用属性表中的BI相关属性，在不同的级别和不同的AOT对象上定义测量。下表描述了你可以定义测量的对象，和如何使用：</span>

<table border="5" width="600" cellspacing="0" cellpadding="2">
<tbody>
<tr>
<td valign="top" width="145"><span style="font-family: 微软雅黑; font-size: large;">对象</span></td>
<td valign="top" width="455"><span style="font-family: 微软雅黑; font-size: large;">用途</span></td>
</tr>
<tr>
<td valign="top" width="145"><span style="font-family: 微软雅黑; font-size: large;">EDT</span></td>
<td valign="top" width="455"><span style="font-family: 微软雅黑; font-size: large;">当你将一个EDT标记为一个测量时，除非在表字段上重新覆盖，不然的话所有引用该EDT的字段都将会成为测量。</span></p>

<span style="font-family: 微软雅黑; font-size: large;">一个EDT可以扩展另一个EDT。如果基本EDT是一个测量，那么你既可以保持，也可以在基本EDT的设置中覆盖。</span></td>
</tr>
<tr>
<td valign="top" width="145"><span style="font-family: 微软雅黑; font-size: large;">字段</span></td>
<td valign="top" width="455"><span style="font-family: 微软雅黑; font-size: large;">如果该字段参照的EDT已经被标识为一个测量，你可以在字段的这只中覆盖。</span>

<span style="font-family: 微软雅黑; font-size: large;">有两个位置，你可以将一个字段标识为一个测量：</span>

*   <span style="font-family: 微软雅黑; font-size: large;">直接在表上</span>
*   <span style="font-family: 微软雅黑; font-size: large;">在用于定义cube的透视的表和视图上</span>

<span style="font-family: 微软雅黑; font-size: large;">透视上的设置，会覆盖其他位置的设置</span></td>
</tr>
</tbody>
</table>
<p>&nbsp;

### <span style="font-family: 微软雅黑;">1.2、维度</span>

<span style="font-family: 微软雅黑; font-size: large;">    你可以在表，视图，和字段上设置AOT属性，来创建分析服务维度和属性。属性，是AOT中的表或视图上的字段或列。维度，是属性组。</span>

<span style="font-family: 微软雅黑; font-size: large;">    当你定义维度和属性后，你添加维度表和视图到透视中，以创建Cube。如果你不想在表和视图上直接指定维度和属性，你可以创建一个透视，接着在透视上添加维度信息。</span>

## <span style="font-family: 微软雅黑;">2、维度和测量组的关系</span>

<span style="font-family: 微软雅黑; font-size: large;">   定义在Cube中的维度和测量组的关系，指明了Cube中的数据是如何被切片的。对于AX Cube而言，会基于系统中表和视图之间已有的关系，来生成关系。当你在BIDS（SQL Server Business Development Studio）中打开一个BI项目时，你可以在Cube设计器中查看生成的关系。在Cube设计器中，你可以在维度和测量组之间添加新的关系，也可以修改已有的关系。</span>

## <span style="font-family: 微软雅黑;">3、KPI和计算成员</span>

<span style="font-family: 微软雅黑; font-size: large;">    一个KPI(Key Performance Indicator)是用于测量业务成功的计算的一个集合。用于计算的成员，是一个维度或测量组的一个成员，它基于Cube数据，算法操作，数字，和功能的一个组合。当一个项目被生成后，在BIDS中使用Cube设计器添加KPI。KPI的计算，是MDX(Multidimensional Expressions)和用于计算的成员的组合。一个KPI一般由实现的值，目标值，状态值，和趋势值构成。</span>

&nbsp;