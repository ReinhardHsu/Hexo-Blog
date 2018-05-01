---
title: Dynamics AX 2012 R2 View Properties
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 14:57:42
---

在 [Views ](http://msdn.microsoft.com/en-us/library/bb314551.aspx)中的属性和在表中的一样,但因为视图是只读的,大多数属性不能更改. 有一些有固定值,有一些是从其定义的查询的数据源继承的.

下面的 <span class="label">Views </span>属性, 是用作Microsoft SQL Reporting Services,是数据分析相关的.

<span id="more-41"></span>

*   <span class="code">AnalysisVisibility</span>
*   <span class="code">AnalysisSelection</span>
*   <span class="code">TypicalRowCount</span>
*   <span class="code">IsLookup</span>
*   <span class="code">SingularLabel</span>

For more information about these properties, see [Table Properties ](http://msdn.microsoft.com/en-us/library/aa871620.aspx).

The properties that can be set for a View are listed below. For a description of the Best Practices for setting the properties, see [Best Practice for View properties ](http://msdn.microsoft.com/en-us/library/aa643254.aspx). For a description of the read-only properties, see [Table Properties ](http://msdn.microsoft.com/en-us/library/aa871620.aspx).

<div class="caption"></div>
<div class="tableSection">
<table>
<tbody>
<tr>
<th colspan="1">Property</th>
<th colspan="1">Description</th>
<th colspan="1">New in this version of

Microsoft Dynamics AX</th>
</tr>
<tr>
<td><span class="label">AOSAuthorization(AOS授权)</span></td>
<td>使你能够制定哪些数据访问操作必须经过用户的授权检查.</td>
<td>AX 2012</td>
</tr>
<tr>
<td><span class="label">CacheLookup</span></td>
<td>获取表的记录缓存级别.</td>
<td>AX 2012</td>
</tr>
<tr>
<td><span class="label">ClusterIndex(聚合索引)</span></td>
<td>表的聚合索引,如果有的话.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">ConfigurationKey</span></td>
<td colspan="1">设置视图的配置键.</td>
<td></td>
</tr>
<tr>
<td><span class="label">CountryRegionCodes</span></td>
<td>指定菜单适合的,可用的国家地区代码. 客户端用这个属性来启用或禁用国家或地区特性. 这是以以逗号分隔的ISO国家代码列表组成的一个字符串实现的. 这个值必须和包含在全局地址薄中的数据匹配.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">CountryRegionContextField</span></td>
<td colspan="1">指定用来识别国家上下文的字段. See <span class="label">CountryRegionCodes </span>.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">DeveloperDocumentation</span></td>
<td colspan="1">描述视图的目的,解释怎么在程序中使用它. 一个描述通常是一短话,不超过五句.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">EntityRelationshipType</span></td>
<td colspan="1">根据通用实体关系数据模型表示法分离. 一个视图被归类于一个实体或一个关系. 一个实体表示一个对象. 一个关系表示一个两个对象之间的关联.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">FormRef</span></td>
<td colspan="1">为视图指定默认窗体.默认窗体是用户激活 <span class="label">Jump to Main Table </span>显示的窗体.窗体是通过引用Display类型的菜单项.如果你将这个字段留空,MorphX会试着激活哪个你涉及到的与表明相同的窗体.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">ID</span></td>
<td colspan="1">对象的内部标识.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">Label</span></td>
<td colspan="1">为视图指定一个用户友好的名称.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">ListPageRef</span></td>
<td colspan="1">指定一个Display类型的菜单项,指向一个可以显示该记录类型列表的窗体..</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">Model</span></td>
<td colspan="1">指定View在哪个模型中.一个模型是层中元素的逻辑分组. 一个元素可以存在于层中一个合适和模型中.相同的元素可以存在于客制化版本的高层模型中.</td>
<td>AX 2012</td>
</tr>
<tr>
<td><span class="label">Name</span></td>
<td>指定视图的名字,用来从X++语言中引用它.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">PreviewPartRef</span></td>
<td colspan="1">指定用于增强预览的 <span class="label">Info Part </span>or <span class="label">Form Part </span>.一个Info part 显示特定query中的数据字段的集合. Info part用元数据描述如何展示数据. 一个Form part表示一个指向窗体的指针.</td>
<td>AX 2012</td>
</tr>
<tr>
<td><span class="label">PrimaryIndex</span></td>
<td>指定view的主索引.只能从唯一索引中选择. 这个属性是用于数据库优化,并表示哪个唯一索引用来作为缓存键. 如果主索引没有指定,拥有最低ID的唯一索引,会被用作缓存键.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">Query</span></td>
<td colspan="1">指定视图数据源的query.这是直接添加数据源到视图的替代方法.For more information, see [How to: Create a View Based on a Query ](http://msdn.microsoft.com/en-us/library/aa558501.aspx).</td>
<td>AX 2012</td>
</tr>
<tr>
<td><span class="label">ReportRef</span></td>
<td>Retrieves the name of the default report for the table.</td>
<td>AX 2012</td>
</tr>
<tr>
<td><span class="label">SaveDataPerCompany</span></td>
<td>为公司特定的表设为 <span class="label">Yes </span>. 如果数据和跨公司,安装,一个数据库,AOT,跟踪 ,OLAP相关,应设为 <span class="label">No </span>.例如, SysTraceTable or OLAPServerTable. 确定数据是否应该按照以每个公司为基础来保存,或存在的数据没有可用的公司归属. 如果 <span class="label">SaveDataPerCompany </span>设为 <span class="label">Yes </span>, 这个表会有一个包含公司标识的 DataAreaId column . 如果该表的这个属性设为 <span class="label">No </span>, 会从表中移除 DataAreaId column .</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">SaveDataPerPartition</span></td>
<td colspan="1">视图是否包含一个叫做 <span class="code">Partition </span>的系统字段. 这是一个只读的系统字段.如果该表有 <span class="code">Partition </span>字段,每条记录都会被指派给一个 partition. Each record is kept hidden from data access operations that are run under the context of other partitions.</td>
<td>AX 2012 R2</td>
</tr>
<tr>
<td><span class="label">SearchLinkRefName</span></td>
<td>Retrieves the name of the menu item that links to information on a Web site about a table record listed in the Enterprise Portal search results.</td>
<td>AX 2012</td>
</tr>
<tr>
<td><span class="label">SearchLinkRefType</span></td>
<td>Retrieves the type of the menu item that links to information on a Web site about a table record listed in the Enterprise Portal search results.</td>
<td>AX 2012</td>
</tr>
<tr>
<td><span class="label">SystemTable</span></td>
<td>指示该表是否是系统表.系统表可以在导入和导出是够筛选,并总是在你同步时同步. 在你登录时,这样的功能对表可能是有用的.</td>
<td>AX 2012</td>
</tr>
<tr>
<td><span class="label">TableContents</span></td>
<td>指定如何安装,参数如何从一个客户传到另一个客户. The following values are possible:</p>
<div class="caption"></div>
<div class="tableSection">
<table>
<tbody>
<tr>
<th>Property</th>
<th>Description</th>
</tr>
<tr>
<td>Not specified(未指定)</td>
<td>For most tables.</td>
</tr>
<tr>
<td>Default Data</td>
<td>用于客户无关的数据,如 ZIP/Postal Codes, units, and time intervals时间间隔.</td>
</tr>
<tr>
<td>Base Data</td>
<td>用于与客户相关的数据,如 calendars, groups, and parameters.</td>
</tr>
<tr>
<td>Default+Base data</td>
<td>用于本地对数据的看法多样化时. 比如,在德国会计科目表是不依赖客户的,但是在世界上其他大多数国家不是这样.</td>
</tr>
</tbody>
</table>
</div>
</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">TableGroup</span></td>
<td colspan="1">致命视图属于哪个组.[Table Groups ](http://msdn.microsoft.com/en-us/library/aa623733.aspx)根据表和视图拥有的数据的类型,对表和视图进行分来. 视图可以像表一样属于表组.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">TitleField1 </span>, <span class="label">TitleField2</span></td>
<td colspan="1">指明窗体标题显示的信息=. 标题由下面构成:</p>

*   the <span class="code">TitleField1 </span>标签后面跟着冒号和空格
*   当前记录列的值用作 <span class="code">TitleField1 </span>后面跟着一个逗号
*   当前记录列的值用作 <span class="code">TitleField2 </span>.
</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">ValidTimeStateEnabled(有效时间状态启用)</span></td>
<td colspan="1">指定视图是否支持基于表的有效时间状态特性. The default value is <span class="label">No </span>. 只有下俩都是真时,该属性能被设为 <span class="label">Yes </span>:</p>

*   所依赖的表,是有效时间状态表.
*   视图的<span class="label"> Fields </span>列表中里有 <span class="label">ValidFrom </span>and <span class="label">ValidTo </span>这两个字段.
</td>
<td>AX 2012</td>
</tr>
<tr>
<td><span class="label">Visible</span></td>
<td>指定当表被用作窗体或报表的数据源时的访问权. 如果表用作窗体中的数据源, 那么窗体中设置的访问权不能超过表中定义的访问权.</td>
<td>AX 2012</td>
</tr>
</tbody>
</table>
</div>