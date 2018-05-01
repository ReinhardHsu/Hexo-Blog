---
title: Dynamics AX 2012 R2 Temporary Tables and the TableType Property
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 14:53:40
---

<div class="introduction">

从 Microsoft Dynamics AX 2012 开始, 所有表都有 <span class="label">TableType </span>属性, 用它来替代 Microsoft Dynamics AX 2009 和更早版本中的 <span class="label">Temporary </span>属性.

</div>

<span id="more-37"></span>

<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div><a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">The TableType Property</span></a></p>
<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock"><a id="sectionToggle0"></a>The following table describes the <span class="label">TableType </span>property.</p>
<div class="caption"></div>
<div class="tableSection">
<table>
<tbody>
<tr>
<th>Value</th>
<th>Description</th>
</tr>
<tr>
<td><span class="label">Regular</span></td>
<td>The default value. 永久表.</td>
</tr>
<tr>
<td>Temporary<span class="label">InMemory</span></td>
<td>作为一个带索引顺序存取方法(ISAM,indexed sequential access method)文件存在的临时表. ISAM file 可以在应用程序对象服务器(AOS)层的任意客户端层存在. 基本的 Microsoft SQL Server 没有连接到ISAM文件.系统确实允许你在 X++ SQL 语法中加入一个InMemory 表. 然而,对这种表进行join或其它操作效率低.</p>

For more information, see [Temporary InMemory Tables ](http://msdn.microsoft.com/en-us/library/bb314749.aspx).

InMemory table 和以前在 Microsoft Dynamics AX 2009 中的 temporary table 是一个东西.</td>
</tr>
<tr>
<td>Temporary<span class="label">TempDB</span></td>
<td>一个临时表存在于SQL Server底层的TempDB数据库. TemDB表的格式不标准,因为当不在使用当前方法时,它就会被丢弃.对TempDB进行Joins,和另一套操作是有效率的.

<p>For more information, see [Temporary TempDB Tables ](http://msdn.microsoft.com/en-us/library/gg845661.aspx).</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>