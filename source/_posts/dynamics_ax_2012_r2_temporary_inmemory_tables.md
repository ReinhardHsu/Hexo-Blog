---
title: Dynamics AX 2012 R2 Temporary InMemory Tables
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 14:52:41
---

<div class="introduction">

在 Microsoft Dynamics AX, 有一种类型的临时表叫做 InMemory table. 我们叫它 InMemory tables ,因为他们的 <span class="label">TableType </span>属性值是 <span class="label">InMemory </span>. 这个值来自于枚举值 <span class="label">TableType::InMemory </span>. The <span class="label">TableType </span>property value can be seen at <span class="label">AOT </span>&gt; <span class="label">Data Dictionary </span>&gt; <span class="label">Tables </span>&gt; <span class="parameter">MyInMemoryTable </span>&gt; <span class="label">Properties </span>&gt; <span class="label">TableType </span>.

<div class="alert">
<table>
<tbody>
<tr>
<th align="left">**Note**</th>
</tr>
<tr>
<td>In Microsoft Dynamics AX 2009 and earlier versions, InMemory tables were called temporary tables. Now there are two kinds of temporary tables, namely InMemory tables and TempDB tables. To avoid confusion we do not use the phrase temporary tables to refer to just InMemory tables or to just [TempDB ](http://msdn.microsoft.com/en-us/library/gg845661.aspx)tables.</td>
</tr>
</tbody>
</table>
</div>
</div>

<span id="more-35"></span>

<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div><a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">Tier(层)</span></a></p>
<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock"><a id="sectionToggle0"></a>不论是在客户端或者服务端层,InMemory表在进程运行所在的活动内存中被实例化. InMemory表从来不出现在数据库管理系统中.一个InMemory table 留在内存中,知道他的尺寸达到128KB. 该数据集然后被写到服务器层的一个磁盘文件. InMemory表的磁盘文件具有命名约定 $tmp&lt;nnnnnnnn&gt;.$$$.</p>
</div>
</div>
<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div><a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">Scope(范围)</span></a></p>
<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock"><a id="sectionToggle1"></a>当第一条记录插入后,InMemory表被实例化. 只要一条引用该表的记录缓冲区变量存在,实例化后的InMemory表就继续存在. 只要记录缓冲区超出范围,内存或硬盘就不给InMemory表分配空间.</div>
</div>
<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div><a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">Adding Data to an InMemory Table</span></a></p>
<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock"><a id="sectionToggle2"></a>To add data to an InMemory table, you must declare the record buffer and call the <span class="code">insert </span>method. The following code example uses the <span class="code">TmpCustLedger </span>table which has its <span class="label">TableType</span>property set to <span class="label">InMemory </span>in the AOT.</p>
<div id="code-snippet-1" class="codeSnippetContainer">
<div class="codeSnippetContainerTabs">
<div class="codeSnippetContainerTabSingle" dir="ltr"><a>X++</a></div>
</div>
<div class="codeSnippetContainerCodeContainer">
<div class="codeSnippetToolBar"></div>
<div id="CodeSnippetContainerCode_5d43657b-d6c2-4563-b813-a63fba9063c1" class="codeSnippetContainerCode" dir="ltr">
<div>
<pre class="crayon-plain-tag">static void TableTmpInsertRecord(Args _args) { 
TmpCustLedger custTmpLedger;                                                                
; 
custTmpLedger.Name = 'NameValue'; 
custTmpLedger.Balance01 = 2345000;
                                                                custTmpLedger.insert(); 
}</pre>
</div>
</div>
</div>
</div>

要释放InMemory表的内存,并删除它的文件,可以设置 record buffer 变量为 <span class="input">null </span>.

<span class="code">custTmpLedger = null;</span>

下面演示从 <span class="code">CustTable </span>table 复制数据到InMemory table ,它是 <span class="code">CustTable </span>table 的表结构的副本. <span class="code">setTmp </span>方法用来创建一个与 <span class="code">CustTable </span>table 匹配的 InMemory table. <span class="code">setTmp </span>方法改变getTableType方法的返回值 <span class="code">getTableType </span>, from <span class="code">TableType::Regular </span>to <span class="code">TableType::InMemory </span>.

<div id="code-snippet-2" class="codeSnippetContainer">
<div class="codeSnippetContainerTabs">
<div class="codeSnippetContainerTabSingle" dir="ltr"><a>X++</a></div>
</div>
<div class="codeSnippetContainerCodeContainer">
<div class="codeSnippetToolBar"></div>
<div id="CodeSnippetContainerCode_c47b50d2-d623-41ab-bebd-5d52e50aedf3" class="codeSnippetContainerCode" dir="ltr">
<div>
<pre class="crayon-plain-tag">static void CopyPersistedTableToInMemoryJob(Args _args) { 
CustTable custTable;

CustTable custTmpLedger; 
custTmpLedger.setTmp(); 
custTable.recordLevelSecurity(true);

while select * from custTable 
where custTable.AccountNum like '1*' 
{ 
custTmpLedger.data(custTable.data());
                                                                custTmpLedger.doInsert(); 
info(strFmt(&quot;Inserted a row for AccountNum =
                                                                %1&quot;,custTable.AccountNum)); 
} 
custTmpLedger = null; 
}</pre>
</div>
</div>
</div>
</div>
</div>
</div>
<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div><a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">Indexes</span></a></p>
<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock"><a id="sectionToggle3"></a>InMemory 表可以向 持久化的表一样定义索引. 如果一个InMemory表是通过拷贝一个持久化的表创建的,索引页会被拷贝到InMemory表中. 索引对于快速检索数据很有用,特别是当InMemory表数据在磁盘文件中时.</div>
</div>
<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div><a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">InMemory Tables vs. Containers</span></a></p>
<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock"><a id="sectionToggle4"></a>Microsoft Dynamics AX 支持一种特殊的数据类型,叫做 <span class="code">container </span>.这种数据类型可以像你使用InMemory表一样使用. For more information, see [Containers ](http://msdn.microsoft.com/en-us/library/aa874816.aspx).在容器中的数据是连续地存储和检索,但在InMemory表中,你可以定义索引来加快数据检索. 对于几行数据来说,索引没有益处.在这种情况下,容器可能有更少的开销,更快的执行速度.</p>

另一个重要的不同是,如何在方法调用中使用.当你传递一个InMemeory表到一个方法调用, 它通过引用传递.容器通过值传递.当一个变量通过引用传递,只有指向该对象的指针被传递. 当一个变量通过值传递,该变量的一个新的拷贝被传递给方法.如果计算机有一定限制量的内存, 它会开始交换内存到磁盘,减慢应用程序的执行.当你传递一个变量给方法,InMemory表可能提供 更佳的性能.

For more information about temporary tables, see Greef, Pontoppidan, et al. 2006\. _Inside Microsoft Dynamics AX 4.0 _. 351-359\. Redmond: Microsoft Press.

</div>
</div>
<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div><a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">TempDB Tables for Disabled Tables</span></a></p>
<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock"><a id="sectionToggle5"></a>你可以通过禁用 [configuration key ](http://msdn.microsoft.com/en-us/library/aa893167.aspx)来禁用一个常规持久化的数据库表,它控制着表.禁用这个键会导致系统自动创建一个, 与数据库表的字段和架构相匹配的TempDB类型的临时表.这个临时表会在SQL Server 数据库的底层存在, 通过AOS管理.自动创建这个TempDB表的目的,是为了能让引用了被禁用表的AOT对象,继续编译和运行. 甚至在configuration key被禁用时,你依然可以读写这个TempDB表.</p>

所有表缓冲区变量都继承 <span class="code">xRecord </span>类的方法. 其中一个方法是 <span class="code">setTmp </span>, 它创建一个与常规表有着相同架构的InMemory 临时表. 然而, <span class="code">setTmp </span>方法不能从TempDB表创建InMemory表. 你可以调用 <span class="code">isTempDb </span>方法确定 <span class="code">setTmp </span>方法是否可用.

</div>
</div>