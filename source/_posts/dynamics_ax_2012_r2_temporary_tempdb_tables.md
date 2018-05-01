---
title: Dynamics AX 2012 R2 Temporary TempDB Tables
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 14:56:51
---

<div class="introduction">

In Microsoft Dynamics AX, one type of temporary table is a TempDB table. We call them TempDB tables because their <span class="label">TableType </span>property value is <span class="label">TempDB </span>. This value comes from the<span class="code">TableType::TempDB </span>enum value. The <span class="label">TableType </span>property value can be set at <span class="label">AOT </span>&gt; <span class="label">Data Dictionary </span>&gt; <span class="label">Tables </span>&gt; <span class="parameter">MyTempDBTable </span>&gt; <span class="label">Properties </span>&gt; <span class="label">TableType </span>.

All types of temporary tables are automatically dropped by the system when the table variable in X++ goes out of scope. A TempDB table is not dropped when you set its record buffer variable to <span class="input">null </span>.

TempDB tables are a different type of temporary table than InMemory tables. For more information, see [Temporary InMemory Tables ](http://msdn.microsoft.com/en-us/library/bb314749.aspx).

</div>

<span id="more-39"></span>

<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div>

<a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">Capabilities of TempDB Tables</span></a>

<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock">

<a id="sectionToggle0"></a>The following table describes the capabilities of TempDB tables.

<div class="caption"></div>
<div class="tableSection">
<table>
<tbody>
<tr>
<th>Capability</th>
<th>Description</th>
</tr>
<tr>
<td>Can be [joined ](http://msdn.microsoft.com/en-us/library/aa848113.aspx).</td>
<td>你的X++ SQL 代码可以 join a TempDB table 到一个常规表,在单个调用中执行多行操作.</td>
</tr>
<tr>
<td>Can be either per company or global.</td>
<td>在TempDB表上的 <span class="label">SaveDataPerCompany </span>属性可以被设置为 <span class="label">Yes </span>or <span class="label">No </span>. 如果值为 <span class="label">No </span>,会成为全局表. For more information, see [Table Properties ](http://msdn.microsoft.com/en-us/library/aa871620.aspx).</td>
</tr>
<tr>
<td>可以通过 [.NET Business Connector ](http://msdn.microsoft.com/en-us/library/aa659581.aspx)从企业门户使用.</td>
<td>TempDB表可以用于窗体和X++代码,与任何用户界面没有关联.但是它可以直接被企业门户数据集使用.</td>
</tr>
<tr>
<td>Can have [foreign key ](http://msdn.microsoft.com/en-us/library/aa556809.aspx)columns.</td>
<td>TempDB表可以引用其他表的主键作为自己的外间列.然而,它的主键不能作为其他表的外键.</td>
</tr>
<tr>
<td>TempDB tables可以从客户端或服务器层实例化.</td>
<td>TempDB表可以用于运行在客户端层或AOS层的逻辑.</td>
</tr>
<tr>
<td>Can have [indexes ](http://msdn.microsoft.com/en-us/library/aa607289.aspx)columns.</td>
<td>TempDB可以在AOT中为它定义索引.</td>
</tr>
<tr>
<td>Can have methods, but cannot [override ](http://msdn.microsoft.com/en-us/library/aa880278.aspx).</td>
<td>你可以为TempDB表添加方法,然而,不能覆盖TempDB表中的任何方法.</td>
</tr>
<tr>
<td>Usable as a query [How to: Add Multiple Data Sources to a Query ](http://msdn.microsoft.com/en-us/library/aa880078.aspx).</td>
<td>在 <span class="label">AOT </span>&gt; <span class="label">Queries </span>下的一个查询,可以引用TempDB作为他的数据源.</td>
</tr>
<tr>
<td>[Transaction support ](http://msdn.microsoft.com/en-us/library/gg846338.aspx).</td>
<td>底层数据库管理系统,为每个TempDB表的实例,提供事务支持,就像常规表一样. 每个实例都是一个单独的表,与其他实例是无关的,每个实例都短命.</td>
</tr>
<tr>
<td>No [configuration key ](http://msdn.microsoft.com/en-us/library/aa893167.aspx).</td>
<td>No configuration key is needed for you to use a TempDB table.</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div>

<a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">Limitations of TempDB Tables</span></a>

<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock">

<a id="sectionToggle1"></a>The following table describes the limitations of TempDB tables.

<div class="caption"></div>
<div class="tableSection">
<table>
<tbody>
<tr>
<th>Limitation</th>
<th>Descriptions</th>
</tr>
<tr>
<td>Cannot be a [valid time state table(有效时间状态表) ](http://msdn.microsoft.com/en-us/library/gg861781.aspx).</td>
<td><span class="label">ValidTimeStateFieldType </span>属性被默认值 <span class="label">None </span>限制了. 这意味着系统在TempDB表中不能管理日期有效数据.</td>
</tr>
<tr>
<td>Cannot have any [delete actions ](http://msdn.microsoft.com/en-us/library/bb315018.aspx).</td>
<td>A TempDB table cannot have any delete actions defined under its <span class="label">DeleteActions </span>node in the AOT.</td>
</tr>
<tr>
<td>No Record Level Security ( [RLS ](http://msdn.microsoft.com/en-us/library/aa879172.aspx)).</td>
<td>RLS is not applied to TempDB tables.</td>
</tr>
<tr>
<td>Cannot use the [Table browser form ](http://msdn.microsoft.com/en-us/library/aa880278.aspx).</td>
<td>要将记录添加到常规表,你可以在AOT中右键它的节点,点击 <span class="label">Open </span>. 打开 <span class="label">Table browser </span>form. 通过键入 Ctrl+N, 你可以添加记录. 然而, <span class="label">Table browser </span>form 不支持TempDB表. 这是因为TempDB表仅存在于实例它的方法范围内.</td>
</tr>
<tr>
<td>Cannot be in a [table collection ](http://msdn.microsoft.com/en-us/library/aa874118.aspx).</td>
<td>任何临时表都不能在表集合中.</td>
</tr>
<tr>
<td>No [view ](http://msdn.microsoft.com/en-us/library/bb314551.aspx)support.</td>
<td>AOT中的视图不能引用TempDB表.当一个视图通过 <span class="label">AOT </span>&gt; <span class="label">Data Dictionary </span>&gt; <span class="label">Views </span>创建并保存,视图会同步到底层数据库系统. 在那一刻,视图必须由数据库系统创建. 但是每个TempDB表是很少存在于数据库中,因为TempDB表仅存在于实例化表的方法期间. 因此,TempDB表通常不是在数据库中为任何数据库视图可以引用的.</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div>

<a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">Lifetime of TempDB Tables</span></a>

<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock">

<a id="sectionToggle2"></a>当第一个SQL操作从AOS发送到数据库系统时,TempDB表在底层数据库管理系统中被实例化. SQL操作可以是select,insert,update,delete.下面的表,描述了导致TempDB表被丢弃的情形.

<div class="caption"></div>
<div class="tableSection">
<table>
<tbody>
<tr>
<th>Cause of drop</th>
<th>Description</th>
</tr>
<tr>
<td>Variable goes out of scope.(变量超出范围)</td>
<td>典型的例子是,一个方法为特定TempDB类型声明了一个变量.这个方法插入数据到TempDB表. 插入导致TempDB在数据库中被实例化.当方法结束,方法中的所有变量都超出范围. AOS告诉数据库系统,当TempDB表对应的变量超出范围,丢弃它.</td>
</tr>
<tr>
<td>Controlled restart of the AOS.</td>
<td>当你停止挺重启AOS,AOS会告诉数据库系统,丢弃所有的TempDB表.</td>
</tr>
<tr>
<td>Restart of the database system.</td>
<td>当数据库系统停止并重启,所有TempDB表的实例会被丢弃.如果AOS服务短暂停止,比如硬件电源故障,TempDB表可以留在底层数据库中. 这里没有自动机制立即丢弃表.</td>
</tr>
<tr>
<td>Closure of the AX32.exe client.</td>
<td>假设你从 AX32.exe 客户端 <span class="label">AOT </span>&gt; <span class="label">Jobs </span>启动一个 job from. Job会调用服务端方法实例化一个TempDb表.当你关闭你的 AX32.exe程序,服务端方法依然在运行.这将结束你的Microsoft Dynamics AX 会话, 并立即结束服务端方法.所有方法中声明的变量现在都超出了范围.因此,AOS告诉 数据库系统,丢弃TempDB表.</td>
</tr>
<tr>
<td><span class="label">Online Users </span>form.</td>
<td>The <span class="label">Online Users </span>窗体可以用于任何与还没有自动丢弃的TempDB表相关的Microsoft Dynamics AX会话. 窗体在内容面板 <span class="label">Administration </span>&gt; <span class="label">Administration Area</span>&gt; <span class="label">Common forms </span>&gt; <span class="label">Online users </span>中可用.</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div>

<a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">TempDB Tables for Disabled Tables</span></a>

<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock">

<a id="sectionToggle3"></a>你可以禁用一个常规持久化的数据库表,通过禁用 [configuration key ](http://msdn.microsoft.com/en-us/library/aa893167.aspx).禁用这个键会导致系统自动创建与数据库表字段和架构相匹配的TempDB类型的临时表. 这个临时表存在于底层SQL Server database ,并通过AOS管理.自动创建TempDB表的目的是为了让被禁用的AOT对象继续变异和运行. configuration key被禁用后,依然能读写这些TempDB表.

所有表缓冲器变量都继承 <span class="code">xRecord </span>类的方法. 其中一个方法是 <span class="code">setTmp </span>, 它创建一个与常规表拥有相同架构的InMemory临时表.然而, <span class="code">setTmp </span>方法不能从TempDB表创建InMemory表. 你可以调用 <span class="code">isTempDb </span>方法来确定 <span class="code">setTmp </span>方法是否可用.

</div>
</div>
<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div>

<a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">X++ Code Example</span></a>

<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock">

<a id="sectionToggle4"></a>The following X++ code example assumes that a TempDB table which is named <span class="label">MyTempdb </span>has already been defined under <span class="label">AOT </span>&gt; <span class="label">Data Dictionary </span>&gt; <span class="label">Tables </span>. The <span class="label">MyTempdb </span>table has one column that is the same type as the <span class="label">AccountNum </span>column on the <span class="label">CustTable </span>table. The <span class="code">while select </span>statement in the example contains a <span class="code">JOIN </span>clause that cannot be used with temporary InMemory tables.

<div id="code-snippet-1" class="codeSnippetContainer">
<div class="codeSnippetContainerTabs">
<div class="codeSnippetContainerTabSingle" dir="ltr"><a>X++</a></div>
</div>
<div class="codeSnippetContainerCodeContainer">
<div class="codeSnippetToolBar"></div>
<div id="CodeSnippetContainerCode_8a8a6ad1-72e2-453b-8eee-dc0d55e2e4f6" class="codeSnippetContainerCode" dir="ltr">
<div>
<pre class="crayon-plain-tag">server public static void main(Args _args) { 
MyTempdb xrecMyTempdb; 
CustTable xrecCustTable; 
TableType tableTypeEnum; 
str stringWork; 

Global::info(&quot;Start of main.&quot;); 
xrecMyTempdb.AccountNum = &quot;4004&quot;; 
xrecMyTempdb.doInsert();
                                                                xrecMyTempdb.AccountNum = &quot;4005&quot;; 
xrecMyTempdb.doInsert(); 
tableTypeEnum= xrecMyTempdb.getTableType(); 
stringWork = &quot;MyTempdb.TableType is: &quot; + enum2Str(tableTypeEnum); info(stringWork); 
while select * from xrecCustTable                                                                JOIN xrecMyTempdb where xrecMyTempdb.AccountNum == xrecCustTable.AccountNum                                                                { 
stringWork = xrecCustTable.AccountNum + &quot; , &quot; +int2Str(xrecCustTable.MandatoryCreditLimit);
                                                                info(stringWork); 
} 
} 
/*** Infolog outputMessage (05:21:28 pm) Start of main. MyTempdb.TableType is: TempDB 4004 , 0 4005 , 1 ***/</pre>
</div>
</div>
</div>
</div>
</div>
</div>