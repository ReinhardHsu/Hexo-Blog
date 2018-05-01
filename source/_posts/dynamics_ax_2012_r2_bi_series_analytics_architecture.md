---
title: '[译]Dynamics AX 2012 R2 BI系列-分析的架构'
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
- Data Analysis
date: 2015-10-09 16:27:26
---

[<span style="font-family: 微软雅黑; font-size: large;">https://msdn.microsoft.com/EN-US/library/dd309691.aspx</span>](https://msdn.microsoft.com/EN-US/library/dd309691.aspx)

<span style="font-family: 微软雅黑; font-size: large;">    下图显示了包含在AX中的SSAS Cube，和用于访问他们的组件。</span>

<span style="font-family: 微软雅黑; font-size: large;">![Image(15)](http://reinhardhsu.com/wp-content/uploads/2015/10/Image15.png "Image(15)")</span>

<span style="font-family: 微软雅黑; font-size: large;">    下面的组件，用于访问Cube或显示Cube数据。列表中的编号，和图中的编号对应。</span><span id="more-540"></span>

1.  <span style="font-family: 微软雅黑; font-size: large;">Visual Studio-开发人员可以使用VS工具，来构建使用Cube作为数据源的SSRS报表。为了显示报表，首先分析服务数据扩展从Cube中获取数据，接着，AX报表客制化扩展定义报表的格式。报表在AX客户端或EP中显示。 </span>
2.  <span style="font-family: 微软雅黑; font-size: large;">AX客户端-用于可以从AX客户端访问预先配置的分析报表。分析报表一般显示在角色中心页面。 </span>
3.  <span style="font-family: 微软雅黑; font-size: large;">EP-用户可以从EP中访问预配置的分析报表。分析报表一般显示在角色中心页面。 </span>
4.  <span style="font-family: 微软雅黑; font-size: large;">Excel-MS Excel有一个数据连接向导，用户可以运行它，来访问Cube，并设计PivotTable或PivotChart报表。 </span>
5.  <span style="font-family: 微软雅黑; font-size: large;">Report Builder-MS Report Builder是一个报表服务的组件，用户可以使用设计报表和图表。 </span>

&nbsp;
