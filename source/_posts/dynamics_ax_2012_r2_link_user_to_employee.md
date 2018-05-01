---
title: Dynamics AX 2012 R2 Link User To Employee
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-21 09:16:31
---

要使用AX中的一些特性，需要将**User Account**和他们的**Employee Record**连接在一起。最好将所有**Employee**的**User Account**，都和他们的**Employee Record**连接在一起。没有这个连接，一些功能就没办法用，尤其是**Sales and Marketing**模块的。

同样的，一个采购人员要想做**Purchase Requisition**，那么该人员的**User Account**必须被连接到一个**Employee Record**。

<span id="more-157"></span>

进入**System administration &gt; Common &gt; Users &gt; Users**。选择一个用户，点击**Relations** Button。

[![Screenshot20150121090231](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121090231.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121090231.jpg)

在弹出的新窗口上，点击**New** Button。在新记录的明细中，点击**Person**下拉框，选择Employee，关闭窗体。

[![Screenshot20150121090736](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121090736.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121090736.jpg)

这样，就已将将**User Account** 连接到**Employee Record**了。
