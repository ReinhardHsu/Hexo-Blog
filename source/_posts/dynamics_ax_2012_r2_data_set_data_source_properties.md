---
title: Dynamics AX 2012 R2 Data Set Data Source Properties
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 15:02:28
---

<table>
<tbody>
<tr>
<th colspan="1"><span id="goog-gtc-unit-47" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human goog-gtc-unit-highlight" dir="ltr"> 属性</span></span></th>
<th colspan="1"><span id="goog-gtc-unit-48" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">描述</span></span></th>
<th colspan="1"><span id="goog-gtc-unit-49" class="goog-gtc-unit"><span class="goog-gtc-translatable" dir="ltr">New in this version of</span></span>

<span id="goog-gtc-unit-50" class="goog-gtc-unit"><span class="goog-gtc-translatable" dir="ltr"> Microsoft Dynamics AX </span></span></th>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-51" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AllowCheck</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-52" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">指定是否在数据集访问之前做安全检查。</span></span><span id="goog-gtc-unit-53" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">Yes</span> -在数据集被访问前，检查该用户的读取权限。</span></span><span id="goog-gtc-unit-54" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">是的</span>是的默认值，通常建议。</span></span></p>

<span id="goog-gtc-unit-55" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">No</span> -在数据集被访问后，检查用户的读取权限。</span></span><span id="goog-gtc-unit-56" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果用户缺乏对底层数据源足够的权限，将没有数据被检索到。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-57" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AllowCreate</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-58" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">指定用户是否可以在数据源（在表中的数据源）中创造新的纪录。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-59" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">AllowDelete</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-60" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指定用户是否可以在数据源（表中为数据源）中删除记录。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-61" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">AllowEdit</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-62" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指定用户是否能够修改数据。</span></span>

<div class="alert">
<table>
<tbody>
<tr>
<th align="left"><span id="goog-gtc-unit-63" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human goog-gtc-ph-missing" dir="ltr">**Tip**</span></span></th>
</tr>
<tr>
<td><span id="goog-gtc-unit-64" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">你可以在这里为整个数据源设置<span class="code">AllowEdit</span>属性。要但禁止修改个别字段，同样的属性存在于数据源中每个字段上。</span></span></td>
</tr>
</tbody>
</table>
</div>
</td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-65" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AutoNotify</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-66" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">不用于数据集。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-67" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">AutoQuery</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-68" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">不用于数据集。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-69" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">AutoSearch</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-70" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">不用于数据集。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-71" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">CounterField</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-72" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">使您可以指定数据源中的一个字段，作为数据集的计数器。</span></span><span id="goog-gtc-unit-73" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">该字段必须是基于该数据源的表的索引，并且必须是<span class="code">real</span>类型。</span></span><span id="goog-gtc-unit-74" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">该<span class="code">CounterField</span>属性用于确保为一个插入到数据集中的记录，提供了一个根据它在数据中实际顺序位置的行号。</span></span><span id="goog-gtc-unit-75" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">例如，如果一个新行被插入线3和4之间，新线的行号为3.5。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-76" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">CrossCompanyAutoQuery</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-77" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">指定数据源是否从一个以上的公司数据库中检索数据。</span></span><span id="goog-gtc-unit-78" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">有关跨公司查询的详细信息，请参阅[跨公司数据访问](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2FEN-US%2Flibrary%2Fcc634544.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNERozA0M9cfpu4T7okmrgfPekINgA) 。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-79" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">DelayActive</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-80" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">使您能够为数据源执行延缓<span class="code">激活</span>方法。</span></span><span id="goog-gtc-unit-81" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果此属性设置为<span class="label">Yes，</span> <span class="code">激活</span>方法会在20毫秒后激活。</span></span><span id="goog-gtc-unit-82" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">当用户在数据源间滚动，激活方法不在每个记录上调用。只在用户最后选中的那条记录上调用。</span></span></p>
<div class="alert">
<table>
<tbody>
<tr>
<th align="left"><span id="goog-gtc-unit-83" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"> **Tip**</span></span></th>
</tr>
<tr>
<td><span id="goog-gtc-unit-84" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">当两个数据源链接时（当<span class="code">LinkType</span>属性设置为<span class="label">Delayed</span> ）此属性特别有用。</span></span></td>
</tr>
</tbody>
</table>
</div>

<span id="goog-gtc-unit-85" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">此属性构成的一部分[AutoJoinSystem](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2FEN-US%2Flibrary%2Faa852141.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNGdsHABGRqo9trRcTafB7nYzIgukA) 。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-86" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Index</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-87" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">设置用于指定排序顺序的索引。</span></span><span id="goog-gtc-unit-88" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">您可以选择在表中的任何索引。</span></span><span id="goog-gtc-unit-89" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">如果你以这种方式指定一个索引，它被用作一个索引提示在每个查询的数据库。</span></span><span id="goog-gtc-unit-90" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">它同时指定一个访问路径和基于该数据源的，对数据集中记录的排序数据集中。</span></span>

<span id="goog-gtc-unit-91" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">对记录的初始排列顺序是优先级别如下：</span></span>

*   <span id="goog-gtc-unit-92" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果排序字段添加到数据源的查询，使用排序规范。</span></span>
*   <span id="goog-gtc-unit-93" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果在数据源上的<span class="code">Index</span>属性指定一个索引，该索引被隐式指定用于排序。</span></span>
*   <span id="goog-gtc-unit-94" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果数据源是与另一个数据源是自动联结，系统会为该联结找到最适当的索引，然后再根据该索引对数据进行排序。</span></span>
*   <span id="goog-gtc-unit-95" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果什么都没指定，那么该窗体数据源的表上的第一个索引（ID最低的那个），会被是隐式指定用来排序。</span></span>

<span id="goog-gtc-unit-96" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">如果没有指定索引提示，数据库管理系统找出适用的访问路径。</span></span><span id="goog-gtc-unit-97" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">它是基于在所提供的查询的信息。</span></span>

<span id="goog-gtc-unit-98" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">为表单的排序顺序可以由用户使用查询对话框中更改。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-99" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">InsertAtEnd</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-100" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">决定当用户移动标中最后一个记录时，一个新记录是否被创建。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-101" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">InsertIfEmpty</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-102" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">确定如果有表中没有记录，一个空白的记录是否被插入。</span></span><span id="goog-gtc-unit-103" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">如果<span class="code">InsertIfEmpty</span>设置为<span class="label">否</span> ，则必须手动创建一个新的记录。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-104" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">JoinSource</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-105" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">可让您连接两个数据源。</span></span><span id="goog-gtc-unit-106" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">当两个或多个表作为数据源，并且你象联结他们时，使用该属性。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-107" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">LinkType</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-108" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">使您可以维护两个数据源之间的活动联接。</span></span><span id="goog-gtc-unit-109" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">当第一个数据源上的焦点改变了，其他数据源中相应的记录会被选中。</span></span><span id="goog-gtc-unit-110" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">使用此属性的一个例子是 , 一个客户表和每个客户的交易表。</span></span><span id="goog-gtc-unit-111" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">从一个顾客滚动到下一个顾客, 也会自动更新交易列表显示当前客户的交易。</span></span>

<span id="goog-gtc-unit-112" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">对于外部（外部链接）的数据源将此属性设置为<span class="label">Delayed</span> 。</span></span><span id="goog-gtc-unit-113" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">被联接的数据源, 会在100毫秒的延迟后更新。</span></span><span id="goog-gtc-unit-114" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">这保证了当一个用户滚动数据源时 , 被联接的数据源不会更新. 只有在用户最终选中的那条记录上时,，数据源才会更新。</span></span>

<span id="goog-gtc-unit-115" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">此属性构成的一部分[AutoJoinSystem](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2FEN-US%2Flibrary%2Faa852141.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNGdsHABGRqo9trRcTafB7nYzIgukA) 。</span></span>

<span id="goog-gtc-unit-116" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">有关链接类型的更多信息，请参见[如何：连接数据源的表单](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2FEN-US%2Flibrary%2Faa608858.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNHfZgkQeCsorRU66vMnCecT74Ft0g) 。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-117" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Name</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-118" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">设置数据源的名称。</span></span><span id="goog-gtc-unit-119" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">这应该与底层的表的名称相同。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-120" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">OnlyFetchActive</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-121" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">确定是否在数据源中的所有字段都被读取，或仅所使用的数据集的。</span></span><span id="goog-gtc-unit-122" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">当<span class="code">OnlyFetchActive</span>属性已设置<span class="label">为</span> Yes，记录无法从数据集中删除。</span></span><span id="goog-gtc-unit-123" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">这是通过确保删除操作是从来没有试图在不完整的记录，以保持数据的完整性。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-124" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">OptionalRecordMode</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-125" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指定的外连接表的记录的创建和删除的行为。</span></span><span id="goog-gtc-unit-126" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">下列选项可用：</span></span>

<div class="caption"></div>
<div class="tableSection">
<table>
<tbody>
<tr>
<th><span id="goog-gtc-unit-127" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100" dir="ltr"> Property </span></span></th>
<th><span id="goog-gtc-unit-128" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">描述</span></span></th>
</tr>
<tr>
<td><span id="goog-gtc-unit-129" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">ImplicitCreate(隐式创建)</span></span></td>
<td><span id="goog-gtc-unit-130" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果没有记录被保存在数据库中，外部联接的记录和联接的表,会在父记录激活后马上被窗前。</span></span><span id="goog-gtc-unit-131" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">如果外部连接记录或它的孩子都没有变，他们会当父记录不再处于活动状态被删除。</span></span></td>
</tr>
<tr>
<td><span id="goog-gtc-unit-132" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">ExplicitCreate(显示创建)</span></span></td>
<td><span id="goog-gtc-unit-133" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果没有记录被保存在数据库中，会把这个记录设为禁用​​状态，直到用户通过<span class="label">可选记录</span>复选框显式出发创建操作。</span></span><span id="goog-gtc-unit-134" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">当记录存在，取消选中该复选框将删除这条记录。</span></span></td>
</tr>
<tr>
<td><span id="goog-gtc-unit-135" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"> None </span></span></td>
<td><span id="goog-gtc-unit-136" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">外连接的记录没有特殊的创建或删除发生。</span></span></td>
</tr>
</tbody>
</table>
</div>
</td>
<td colspan="1"><span id="goog-gtc-unit-137" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AX 2012</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-138" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">StartPosition</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-139" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">当数据集被访问时 , 定义第一或最后一个记录是否应该成为当前记录。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-140" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Table</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-141" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">设置用作数据源的表。</span></span></td>
<td colspan="1"></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-142" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">ValidTimeStateAutoQuery</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-143" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">为日期的有效性指定查询的类型。</span></span><span id="goog-gtc-unit-144" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">（AsOfDate</span>或<span class="label">DateRange</span> ）</span></span></td>
<td colspan="1"><span id="goog-gtc-unit-145" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AX 2012</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-146" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">ValidTimeStateUpdate</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-147" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">为一个现存的日期有效记录 , 指定更新的类型。</span></span><span id="goog-gtc-unit-148" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">该选项如下：</span></span></p>

*   <span id="goog-gtc-unit-149" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">CreateNewTimePeriod -在哪条将要成为以前的记录上，将他的<span class="label">ValidTo</span>日期字段设置不晚于当前的日期。</span></span><span id="goog-gtc-unit-150" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">在同一事务中，新的当前记录的<span class="label">ValidFrom</span>字段立即设置为先前记录的<span class="label">ValidTo</span>日期之后。</span></span>
*   <span id="goog-gtc-unit-151" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Correction -现有行修正的<span class="label">ValidFrom</span>或<span class="label">ValidTo</span>值必须进行修改，以保持日期有效性的数据,在它更新数据集后,依然有效.</span></span>
*   <span id="goog-gtc-unit-152" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">EffectiveBased &#8211; 过去的记录不能编辑。</span></span><span id="goog-gtc-unit-153" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">当前活动的记录,以类似<span class="label">CreateNewTimePeriod</span>模式的方式进行编辑。</span></span><span id="goog-gtc-unit-154" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">未来的记录以类似<span class="label">Correction(纠正)</span>模式的方式进行编辑。</span></span>
<p><span id="goog-gtc-unit-155" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">默认值是CreateNewTimePeriod。</span></span></td>
</tr>
</tbody>
</table>
