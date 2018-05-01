---
title: Dynamics AX 2012 R2 Table Properties
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 14:30:08
---

<div>
<div class="topic">

# Table Properties [AX 2012]

<div id="mainSection">
<div id="mainBody">
<div class="introduction">

[Table Field Properties](http://msdn.microsoft.com/en-us/library/aa577032.aspx)

[Table Index Properties](http://msdn.microsoft.com/en-us/library/aa881522.aspx)

[Table Relation Properties](http://msdn.microsoft.com/en-us/library/hh803130.aspx)

</div>
<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div>

<a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">Table Properties</span></a>

<div class="LW_CollapsibleArea_HrDiv"></div>
</div>
</div>

<span id="more-20"></span>

<div class="sectionblock">

The following table describes the properties of table elements in the AOT.

<div class="caption"></div>
<div class="tableSection">
<table style="height: 11985px;" width="659">
<tbody>
<tr>
<th colspan="1">Property</th>
<th colspan="1">Description</th>
<th colspan="1">New in this version of

Microsoft Dynamics AX</th>
</tr>
<tr>
<td colspan="1"><span class="label">Abstract(抽象)</span></td>
<td colspan="1">指定该表是否支持继承.默认值是 <span class="label">No </span>. 如果设为 <span class="label">Yes </span>, 不能对该表直接使用 X++ SQL statements ,如 <span class="code">update_recordset </span>和 <span class="code">select </span>.</p>

当 <span class="label">SupportInheritance </span>属性设为 <span class="label">No </span>时,该属性不可用. 要了解更多信息, 请看 [Table Inheritance Overview ](http://msdn.microsoft.com/en-us/library/gg881053.aspx).</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">AnalysisDimensionType(分析维度类型)</span></td>
<td colspan="1">决定基于 <span class="label">IsLookup </span>属性设置创建的维度的类型. You can specify one of the following values.<span class="label">IsLookup </span>属性设为 <span class="label">Yes </span>时

*   <span class="label">Auto </span>-指定 表示表同时包含事实数据和维度数据. BI wizar分别为其创建Measure和维度，父表的attribute（后面说明）被创建为子维度.
*   <span class="label">MasterInner </span>&#8211; 表示该使用full join连接该表和它的子表，join后的结果记录被创建为维度，父表的atrribute则被创建为子维度.
*   <span class="label">MasterLeftOuter </span>&#8211; 使用左外连接关联该表和其子表，得到的维度数据因此可能会包含空值，父表的attribute也同样被创建为子维度.
*   <span class="label">Transaction </span>&#8211; 表示该表只用来生成Measure，只有表中的枚举字段被创建为子维度.

<span class="label">IsLookup </span>属性设为 <span class="label">No </span>时

*   <span class="label">Auto </span>&#8211; Specifies that the table may contain factual as well as dimensional data. The BI Wizard will extract dimensional data and create dimensions and attributes while factual data will be extracted to create measures. One parent and child dimension is created.
*   <span class="label">MasterInner </span>&#8211; Not applicable. Same as <span class="label">Auto </span>.
*   <span class="label">MasterLeftOuter </span>&#8211; Not applicable. Same as <span class="label">Auto </span>.
*   <span class="label">Transaction </span>&#8211; Specifies that the table should strictly be used to generate factual data (measures). This setting should be used when a table only contains transactional data. One child dimension is created containing only enumeration values from the table.
</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">AnalysisIdentifier(分析标识符)</span></td>
<td colspan="1">指定哪个字段作为SQL Server Analysis Services (SSAS) cube的标识符.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">AOSAuthorization(AOS授权)</span></td>
<td colspan="1">基于用户的权限,指定用户可以在表上执行的操作类型.当该属性设置为 <span class="label">None </span>, 则不执行授权检查.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">CacheLookup(缓存查找)</span></td>
<td colspan="1">确定如何将查找操作中检索到的记录缓存起来.<span class="label">CacheLookup </span>属性只存在于那些不是从其他表继承来的表中.</p>

在继承根表中,这个属性不能通过AOT <span class="label">Properties </span>窗体,将其设为 <span class="label">EntireTable(全部表) </span>. 你也不能通过其他技术设置根表的这个属性. 例如, 不能使用 <span class="code">TreeNode </span>类的 <span class="code">AOTsetProperty </span>方法指定这个值.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">ClusterIndex(集群索引)</span></td>
<td colspan="1">指定集群索引.这个属性仅用于SQL优化的目的.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">ConfigurationKey(配置键)</span></td>
<td colspan="1">为表指定配置键.配置键允许系统管理员启用或禁用程序的某些部分.

和表关联的配置码,若系统未启用该配置码,则该表不会被创建到数据库,在代码调用该表时,按临时表对待.</td>
<td></td>
</tr>
<tr>
<td><span class="label">CountryRegionCodes(国家区域代码)</span></td>
<td>指定该表适用或有效的国家区域代码. 客户端框架和应用可以利用该属性,启用或禁用国家或区域的特性. 它是通过一串用逗号分隔的ISO国家代码列表的字符串实现的. 该值必须和全局地址薄中的数据匹配.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">CountryRegionContextField(国家代码上下文字段)</span></td>
<td colspan="1">指定用来标识国家上下文的字段. 该属性与 <span class="label">CountryRegionCodes </span>属性相关联.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">CreatedBy</span></td>
<td colspan="1">指示系统是否在表中的记录上,维护 <span class="code">CreatedBy </span>字段. 这个字段包含谁创建了一个特定的记录.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">CreatedDateTime</span></td>
<td colspan="1">指示系统是否在表中的记录上维护 <span class="code">CreationDate </span>和 <span class="label">CreationTime </span>字段.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">CreatedTransactionId</span></td>
<td colspan="1">指示系统是否在该表中的字段上,维护 <span class="code">CreatedTransactionId </span>字段.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">CreateRecIdIndex</span></td>
<td colspan="1">指示是否把Record ID字段设置成索引. 对那些通过RecID进行查找的表,需要把该属性设置为Yes, 比如SalesTable, SalesLine等.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">DeveloperDocumentation</span></td>
<td colspan="1">描述该表的目的,解释怎么在程序中使用它. 描述通常写成一个段落,不超过五句话.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">EntityRelationshipType</span></td>
<td colspan="1">根据common entity relationship (ER) data model表示法,对表进行分类. 一个表被归类成一个实体或关系. 一个实体表示一个对象. 一个关系表示两个对象之间的联系.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">Extends</span></td>
<td colspan="1">从该属性中指定的表,派生.当 <span class="label">SupportInheritance </span>属性设为 <span class="label">Yes </span>时,该属性为null. 要了解更多信息, 请看 [Table Inheritance Overview ](http://msdn.microsoft.com/en-us/library/gg881053.aspx).</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">FormRef</span></td>
<td colspan="1">使用Go to main table功能时调用的Display类型的菜单名称. 指定当表被引用时,激活的Display类型的菜单项. 显示菜单项和窗体相关联.当你在报表中使用主索引字段, 该窗体可以做一报表中的一个链接. 主索引通过 <span class="code">PrimaryIndex </span>属性指定.

如果保留这个字段为空, 系统会试图显示一个和该表拥有相同名字的窗体.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">ID</span></td>
<td colspan="1">系统生成的表 <span class="code">ID </span>. 要了解更多信息, 请查看 [Application Object IDs ](http://msdn.microsoft.com/en-us/library/aa601997.aspx).在安装时指定IDs.当模型通过AxUtil tool导入时,指定IDs. 这意味着,相同的类,在不同的安装中,有不同的IDs.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">IsLookup</span></td>
<td colspan="1">对于报表模型, 它指定当一个报表模型生成时,该表的信息是否被合并到其他引用它的表中.对于 OLAP cubes多维数据集, 它决定是否生成一个综合维度或不同维度. 你可以指定下列值之一.

*   <span class="label">Yes </span>&#8211; 表示表中的属性可以被合并到父维度 (star schema星型架构).
*   <span class="label">No </span>&#8211; 表示能够为表生成一个单独的维度(snowflake schema雪花型架构).

更多有关尺寸,星型架构,雪花架构,请看 [Introduction to Dimensions (SQL Server 2005 Books Online) ](http://go.microsoft.com/fwlink/?LinkId=115450).</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">Label</span></td>
<td colspan="1">为表指定一个标签.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">ListPageRef</span></td>
<td colspan="1">指定一个Display类型的菜单项,它指向一个可以显示该记录类型列表的窗体.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">Model</span></td>
<td colspan="1">指定表所在的模型.模型是层中根据逻辑区分的一组元素. 一个元素可以存在于一个层中的一个合适的模型中. Examples of elements are a table or class. The same element can exist in a customized version in a model in a higher layer.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">ModifiedBy</span></td>
<td colspan="1">指示系统是否在该表中的记录上,维护 <span class="code">ModifiedBy </span>字段. 这个字段记录谁最后修改了该记录.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">ModifiedDateTime</span></td>
<td colspan="1">指示系统是否在该表中记录上,维护 <span class="code">ModifiedDate </span>字段. 这个字段记录该记录最后修改的日期.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">ModifiedTime</span></td>
<td colspan="1">指示系统是否对该表中的字段上,维护 <span class="code">ModifiedDateTime </span>字段. 这个字段记录最后修改该记录的时间.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">Name</span></td>
<td colspan="1">指定表名.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">OccEnabled(乐观并发启用)</span></td>
<td colspan="1">指定对该表是否启用optimistic concurrency mode乐观并发模式.当该模式启用后, 未来修改数据时, 从数据库中获取的那部分数据不会被锁. 数据只有在实际的update被执行时,数据才会被锁.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">PreviewPartRef</span></td>
<td colspan="1">指定用来增强预览的 <span class="label">Info Part </span>或 <span class="label">Form Part </span>.info part 显示一个从指定query中的返回的数据字段的集合. An info part 使用元数据来描述数据如何呈现. A form part 表示到窗体的指针.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">PrimaryIndex</span></td>
<td colspan="1">指定 primary index.只有唯一的索引可以被选择.

这个属性用于数据库优化的目的,并指出哪个唯一索引可以用作缓存键caching key. 如果主索引没有指定, 具有最低ID的唯一索引会被用做缓存键caching key.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">ReplacementKey</span></td>
<td colspan="1">指定在一些窗体控件中,那些作为数据的标识符显示的字段.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">ReportRef</span></td>
<td colspan="1">指定当一个表被引用时, 被激活的那个Output类型的菜单项. 一个Output菜单项与一个报表相关联.当你在报表上使用主索引时, 该报表可以作为报表上的一个链接.主索引用 <span class="code">PrimaryIndex </span>属性指定.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">SaveDataPerCompany</span></td>
<td colspan="1">指示是否作为当前公司的数据保存.如果该属性设置为 <span class="label">No </span>, 数据保存时, 不保存公司标识符 ( <span class="code">DataAreaId </span>).

<div class="alert">
<table>
<tbody>
<tr>
<th align="left">**Note**</th>
</tr>
<tr>
<td>如果 <span class="code">SaveDataPerCompany </span>属性设置为 Yes, 那么 form design 上的那个, 将表作为数据源的属性 <span class="code">SetCompany </span>, 也要设为 Yes.</td>
</tr>
</tbody>
</table>
</div>
<div class="alert">
<table>
<tbody>
<tr>
<th align="left">**Tip**</th>
</tr>
<tr>
<td>公司的所以在状态栏显示.双击它,会弹出一个可以切换到其他公司的对话框.</td>
</tr>
</tbody>
</table>
</div>
</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">SaveDataPerPartition</span></td>
<td colspan="1">显示该表是否有一个叫做 <span class="code">Partition </span>的系统字段. 它是一个只读的系统字段.如果系统有一个 <span class="code">Partition </span>字段, 每条记录会被分配给一个 partition. Each record is kept hidden from data access operations that are run under the context of other partitions.</td>
<td>AX 2012 R2</td>
</tr>
<tr>
<td colspan="1"><span class="label">SearchLinkRefName</span></td>
<td colspan="1">指定 连接到网站上的信息的, 企业门户搜索结果中列出的关于表记录 的菜单项的名称.如果 <span class="code">SearchLinkRefType </span>属性设成一个URL, 从 <span class="code">SearchLinkRefName </span>属相列表中,选择一个连接到显示该表数据的Web part page的菜单项.</p>

Web part pages上的窗体和报表可以显示数据.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">SearchLinkRefType</span></td>
<td colspan="1">指定 连接到网站上的信息的, 企业门户搜索结果中列出的关于表记录 的菜单项的类型.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">SingularLabel()</span></td>
<td colspan="1">指定用于在一个报表模型或cube上显示表中存储的项目的singular name.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">SupportInheritance</span></td>
<td colspan="1">将属性设为 <span class="label">Yes </span>, 可以启用其他与继承相关的属性, 如 <span class="label">Extends </span>和 <span class="label">Abstract </span>.

<div class="alert">
<table>
<tbody>
<tr>
<th align="left">**Caution**</th>
</tr>
<tr>
<td>当你把这个值设为 <span class="label">Yes </span>, 表上的其他属性都会被丢弃,需要重新创建.</td>
</tr>
</tbody>
</table>
</div>

要了解更多信息, 请参阅 [Table Inheritance Overview ](http://msdn.microsoft.com/en-us/library/gg881053.aspx).</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">SystemTable</span></td>
<td colspan="1">指示一个表是否是作为系统表显示.它可以在导入导出过程中过滤.系统表总是在你登录时同步. This may be useful for tables that you use as soon as you log in.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">TableContents</span></td>
<td colspan="1">指定如何配置参数数据可以被客户们重用.Specifies how setup/parameter data can be reused from one customer to another. The following values are possible:

*   <span class="label">Not specified 未指定 </span>– 对于大多数表.
*   <span class="label">Default Data(默认数据) </span>– 用于与客户无关的数据,如 ZIP/Postal Codes, units 单位, and time intervals 时间间隔.
*   <span class="label">Base Data(基本数据) </span>– 用于与客户相关的数据,如 calendars, groups, and parameters.
*   <span class="label">Default+Base data(默认+基本数据) </span>– 用于局部有所不同的数据. 例如, 在德国会计科目表不是基于客户的, 但是在其他国家不是这样.
</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">TableGroup</span></td>
<td colspan="1">决定该表属于哪个组.[Table Groups ](http://msdn.microsoft.com/en-us/library/aa623733.aspx)提供了一个根据表包含的数据类型, 对表分类的方法. Table groups 可以用来定义,当用户在使用该表作为数据源的窗体上, 从表中更新或删除操作时, 系统是否应该提示用户. 当导出数据时,可以使用 table groups 来筛选记录.</td>
<td></td>
</tr>
<tr>
<td><span class="label">TableType</span></td>
<td>替代Microsoft Dynamics AX 2009中的 <span class="label">Temporary </span>临时表属性. 要了解更多信息, 请参阅 [Temporary Tables and the TableType Property ](http://msdn.microsoft.com/en-us/library/gg863308.aspx).</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">TitleField1 </span>, <span class="label">TitleField2</span></td>
<td colspan="1">使你可以执行以下操作:</p>

*   将表字段数据添加到窗体标题.
*   在查找窗体显示附加字段. For more information, see [How to: Add a Control with a Lookup Form ](http://msdn.microsoft.com/en-us/library/aa592952.aspx). 在窗体上激活一个字段的查找列表时, <span class="code">TitleField1 </span>属性也被使用. 你指定给 <span class="code">TitleField1 </span>and <span class="code">TitleField2 </span>属性的字段,可以合并成键值.
*   在tooltip中显示字段信息.
</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">TypicalRowCount</span></td>
<td colspan="1">指定显示在table中的记录数.如果 <span class="code">AnalysisSelection </span>属性没有设置, <span class="code">TypicalRowCount </span>属性决定了报表生成器选择的行数.</p>

<span class="code">TypicalRowCount </span>属性的设置,会影响 drop-down list, list box, or a filtered list box 是否被用来选择表记录. For more information, see[Best Practices for Table Properties ](http://msdn.microsoft.com/en-us/library/aa632254.aspx).</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">ValidTimeStateFieldType(有效时间状态字段类型)</span></td>
<td colspan="1">指定系统在一定时间跨度内跟踪数据时,所使用的 date-time 字段的类型.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">Visible</span></td>
<td colspan="1">指定当该表用作窗体或报表的数据源时的访问权.如果该表在窗体中作为数据源, 窗体中的访问权不能超出 为该表定义的访问权.</td>
<td></td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div>
<p><a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">Tables and Report Models</span></a>

<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock">

<a id="sectionToggle1"></a>The following properties are related to report models that are used to add information to a report.

*   <span class="code">AnalysisSelection</span>
*   <span class="code">AnalysisVisibility</span>
*   <span class="code">IsLookup</span>
*   <span class="code">SingularLabel</span>
*   <span class="code">TypicalRowCount</span>
</div>
</div>
<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div>

<a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">See also</span></a>

<div class="LW_CollapsibleArea_HrDiv"></div>
</div>
</div>
<div class="sectionblock">
<div class="seeAlsoStyle">[Data Dictionary Node in the AOT](http://msdn.microsoft.com/en-us/library/gg731859.aspx)</div>
</div>
</div>
</div>
</div>
</div>
</div>

&nbsp;

&nbsp;