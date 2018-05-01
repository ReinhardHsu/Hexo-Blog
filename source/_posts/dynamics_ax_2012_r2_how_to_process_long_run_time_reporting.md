---
title: Dynamics AX 2012 R2 如何处理运行时间较长的报表
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-08-06 11:32:39
---

<font size="3" face="微软雅黑">&nbsp;&nbsp;&nbsp; 当处理的数据量较多，逻辑比较复杂时，报表可能会超时。为了解决这个问题，[Reinhard](http://reinhardhsu.com)一直使用SrsReportDataProviderPreProcess来做预处理报表。它会在调用SSRS前，在AX会话中处理数据。预处理过的数据存储在常规表中，该表是所有用户会话共享的，通过会话id标识。这样的方法在多用户并发时，会有瓶颈。</font>

<font size="3" face="微软雅黑">&nbsp;&nbsp;&nbsp; 在Dynamics AX 2012 R2中，其实还有一个类，SrsReportDataProviderPreProcessTempDB，他可以使用临时表，来持有跨会话（从数据处理会话到SSRS数据获取会话）的报表数据。</font>

<font size="3" face="微软雅黑">&nbsp;&nbsp; 其他部分的开发方式与之前SrsReportDataProviderPreProcess报表的开发方式一样，但需要注意以下两点：</font>

1.  <font size="3" face="微软雅黑">使用临时表，而不是常规表。 </font>
<li><font size="3" face="微软雅黑">在返回临时表前，加上这样一句： </font>

<font size="3" face="微软雅黑">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmpTable.setConnection(this.parmUserConnection());</font>

<font size="3" face="微软雅黑"></font>
