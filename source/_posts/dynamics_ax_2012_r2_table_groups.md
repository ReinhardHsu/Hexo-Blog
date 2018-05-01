---
title: Dynamics AX 2012 R2 Table Groups
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 14:49:35
---

<div class="introduction">

表组提供一种根据表所含数据的类型进行分类的方法. Determining group membership is not an exact science but more of a conceptual definition. When determining group membership for your own tables, follow the standards in the Microsoft Dynamics AX application.

导出数据时, 你可以使用表组来过滤记录. 例如, 如果你想指定可以导出客户,但不能导出客户交易. 一个表属于哪个组, 由该表上的 by the <span class="code">TableGroup </span>属性定义.

<span id="more-33"></span>

The available table group values are listed in the following table.

<div class="caption"></div>
<div class="tableSection">
<table>
<tbody>
<tr>
<th colspan="1">Table group</th>
<th colspan="1">使用该组的表,应具有以下特征的表,</th>
<th colspan="1">Examples</th>
</tr>
<tr>
<td colspan="1">Parameter</td>
<td colspan="1">这个表,包含的数据,主要用作一个主表的参数或装配信息(a table that has a <span class="code">TableGroup </span>property of <span class="code">Main </span>).这种表通常每家公司只有一条记录.</td>
<td colspan="1"><span class="code">CustParameters </span>, <span class="code">VendParameters</span></td>
</tr>
<tr>
<td colspan="1">Group</td>
<td colspan="1">该表包含的数据,主要用来对主表进行分类 (a table that has a <span class="code">TableGroup </span>property of <span class="code">Main </span>).在 <span class="code">Group </span>table and a <span class="code">Main </span>table之间是一对多关系.</td>
<td colspan="1"><span class="code">CustGroup </span>, <span class="code">VendGroup</span></td>
</tr>
<tr>
<td colspan="1">Main</td>
<td colspan="1">该表是应用程序中的主表中的一个, 并包含以数据为中心的业务对象.该表一般持有静态的,基础的信息.</p>

这是 <span class="code">Main </span>table and a <span class="code">Transaction </span>table之间一对多的关系.</td>
<td colspan="1"><span class="code">CustTable </span>, <span class="code">VendTable</span></td>
</tr>
<tr>
<td colspan="1">Transaction</td>
<td colspan="1">表中包含交易数据.该表一般不直接用做数据输入.</td>
<td colspan="1"><span class="code">CustTrans </span>, <span class="code">VendTrans</span></td>
</tr>
<tr>
<td colspan="1">WorksheetHeader(工作表头)</td>
<td colspan="1">该表一般用于对 <span class="code">WorkSheetLine </span>tables中的信息进行分类.在 <span class="code">WorkSheetHeader </span>table and a <span class="code">WorkSheetLine </span>table之间是一对多关系.</td>
<td colspan="1"><span class="code">SalesTable</span></td>
</tr>
<tr>
<td colspan="1">WorksheetLine</td>
<td colspan="1">该表包含的信息是待验证的, 将要进入交易表的.相比于 <span class="code">Transaction </span>表中包含的数据, <span class="code">WorkSheetLine </span>表中的数据是临时的, 并且删除后不会影响系统稳定.</td>
<td colspan="1"><span class="code">SalesLine</span></td>
</tr>
<tr>
<td colspan="1">Miscellaneous(杂项)</td>
<td colspan="1">该表不适合任何其他的类别.这是新表的默认值.</td>
<td colspan="1"><span class="code">TableExpImpDef</span></td>
</tr>
</tbody>
</table>
</div>
<p>一般地, table groups <span class="code">Miscellaneous </span>, <span class="code">Transaction </span>, <span class="code">WorksheetHeader </span>, and <span class="code">WorksheetLine </span>用于大表. 如果在服务器配置里选择了 <span class="label">Use literals in complex joins from X++ </span>or <span class="label">Use literals in join queries from forms and reports </span>, 在两个或多个大表被join时, 系统会为sql查询添加查询关键字 <span class="code">forceliterals </span>.

The groups available are defined by the system enum <span class="code">TableGroup </span>.

</div>
<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div><a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">Table Prompts</span></a></p>
<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock"><a id="sectionToggle0"></a>You can specify by table group whether a prompt is displayed when records are deleted or updated in a table. These prompts are defined by navigating to <span class="label">Tools </span>&gt; <span class="label">Options </span>&gt; <span class="label">Confirmation</span>.</p>
<div class="alert">
<table>
<tbody>
<tr>
<th align="left">**Note**</th>
</tr>
<tr>
<td>Regardless of what table group prompts you define, explicitly defined delete actions are respected.</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>