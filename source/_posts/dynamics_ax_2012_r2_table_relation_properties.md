---
title: Dynamics AX 2012 R2 Table Relation Properties
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 14:40:42
---

<div>
<div class="sectionblock">

<span class="label">AOT</span> &gt; <span class="label">Data Dictionary</span> &gt; <span class="label">Tables</span> &gt; <span class="parameter">MyTable</span> &gt; <span class="label">Relations</span>.

<span id="more-26"></span>

The related primary key or alternate key field is in the referenced table, which is also called the parent table.

<div class="tableSection">
<table>
<tbody>
<tr>
<th><span id="goog-gtc-unit-53" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100" dir="ltr"> 属性</span></span></th>
<th><span id="goog-gtc-unit-54" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">描述</span></span></th>
<th>New in this version of

Microsoft Dynamics AX</th>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-57" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Cardinality(基数)</span></span></span></td>
<td><span id="goog-gtc-unit-58" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">从引用表的每个主键值必须发生在本表的外键列的次数。</span></span><span id="goog-gtc-unit-59" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">例如，该值<span class="label">OneMore</span>指一个或多个，但不是零。</span></span><span id="goog-gtc-unit-60" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">这意味着，每各父表的主键值必须出现在子表的外键列至少一次。</span></span><span id="goog-gtc-unit-61" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果业务规则规定，在父<span class="label">SalesTable</span>表中的每个记录涉及到至少一个正在销售的项目。那么一个<span class="label">SalesLine</span>表下面的一个关系节点, 应该使用<span class="label">OneMore</span>值.</span></span><span id="goog-gtc-unit-62" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">在Microsoft Dynamics AX 2012此属性尚未被系统使用。</span></span><span id="goog-gtc-unit-63" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">本产品的未来版本可能会使用这个属性，以及<span class="label">RelatedTableCardinality属性</span>。</span></span></td>
<td><span id="goog-gtc-unit-64" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">Microsoft Dynamics AX的2012</span></span></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-65" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">CreateNavigationPropertyMethods</span></span></span></td>
<td><span id="goog-gtc-unit-66" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">Yes</span>指示系统在表缓冲区类为每个外键关系的节点生成的导航方法。</span></span><span id="goog-gtc-unit-67" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">有关导航方法的详细信息，请参阅[CreateNavigationPropertyMethods和RelatedTableRole](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2Fen-us%2Flibrary%2Fhh803130.aspx%23BKMK_2_NavigationMethods&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFj7dML-_ebevuDGHmgRWOGwkefug) 。</span></span></td>
<td><span id="goog-gtc-unit-68" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">Microsoft Dynamics AX的2012</span></span></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-69" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">EDTRelation</span></span></span></td>
<td><span id="goog-gtc-unit-70" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">Yes</span>指这种关系是通过软件工具,从一个老的extended data type(EDT)关系迁移到这里。</span></span></td>
<td><span id="goog-gtc-unit-71" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">Microsoft Dynamics AX的2012</span></span></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-72" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">EntityRelationshipRole</span></span></span></td>
<td><span id="goog-gtc-unit-73" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">该<span class="label">EntityRelationshipRole</span>属性是用来阐明在表上定义的关系的语义。</span></span><span id="goog-gtc-unit-74" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">角色名应该是名词或名词短语。</span></span><span id="goog-gtc-unit-75" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">角色名称应注明相关的表中就关联对象的作用，或者它应该是一个短的词组，用现在时态动词，表示该表中起着关系中的作用开始。</span></span><span id="goog-gtc-unit-76" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">当关系是明确的时, 角色名不是必需的。</span></span></td>
<td></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-77" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100" dir="ltr">Model</span></span></span></td>
<td><span id="goog-gtc-unit-78" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">这种关系是一部分的模型。</span></span></td>
<td><span id="goog-gtc-unit-79" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">Microsoft Dynamics AX的2012</span></span></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-80" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100" dir="ltr">Name</span></span></span></td>
<td><span id="goog-gtc-unit-81" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">您选择的关系的描述性名称。</span></span></td>
<td></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-82" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">NavigationPropertyMethodNameOverride</span></span></span></td>
<td><span id="goog-gtc-unit-83" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指定的导航方法的名称。</span></span><span id="goog-gtc-unit-84" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果没有指定值，导航方法使用<span class="label">RelatedTableRole</span>属性的值。</span></span><span id="goog-gtc-unit-85" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">有关导航方法的详细信息，请参阅[CreateNavigationPropertyMethods和RelatedTableRole](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2Fen-us%2Flibrary%2Fhh803130.aspx%23BKMK_2_NavigationMethods&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFj7dML-_ebevuDGHmgRWOGwkefug) 。</span></span></td>
<td><span id="goog-gtc-unit-86" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">Microsoft Dynamics AX的2012</span></span></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-87" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">RelatedTableCardinality(基数)</span></span></span></td>
<td><span id="goog-gtc-unit-88" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">指定在当前表中外键字段值是否可以在部分或全部记录行中为null。</span></span><span id="goog-gtc-unit-89" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">可能的值如下：</span></span></p>

1.  <span id="goog-gtc-unit-90" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">ZeroOne</span> -指零次或一次。</span></span><span id="goog-gtc-unit-91" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">这意味着在一个子记录的外键字段可以为null。</span></span>
2.  <span id="goog-gtc-unit-92" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">ExactlyOne上</span> -意味着外键字段在任何子记录上都不能为null。</span></span>
</td>
<td><span id="goog-gtc-unit-93" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">Microsoft Dynamics AX的2012</span></span></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-94" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">RelatedTableRole</span></span></span></td>
<td><span id="goog-gtc-unit-95" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">您键入一个文本,用来描述在该关系中引用父表的目的。</span></span><span id="goog-gtc-unit-96" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">当一个表只有一个关系, 它是引用给定的父表，那么您可以使用父表的名称作为RelatedTableRole的名称。</span></span><span id="goog-gtc-unit-97" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">有时一个表与给定引用父表之间有多个关系。</span></span><span id="goog-gtc-unit-98" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">在这种情况下,<span class="label">RelatedTableRole</span>属性值应该尽量说明的该关系，从而能够区分另一个引用了同一个父表的关系的目的.</span></span><span id="goog-gtc-unit-99" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">该属性的值可作为, 那些基于AOT查询的数据源关系的<span class="label">JoinRelation</span>属性的值。</span></span><span id="goog-gtc-unit-100" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">在标准情况下，这种用法是建议，因为它减少了非规范化。</span></span><span id="goog-gtc-unit-101" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">该属性与<span class="label">UseDefaultRoleNames</span>属性互动。</span></span></p>

<span id="goog-gtc-unit-102" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">有关<span class="label">RelatedTableRole</span>和<span class="label">JoinRelation</span>属性之间的交互的详细信息，请参阅[RelatedTableRole和查询JoinRelation](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2Fen-us%2Flibrary%2Fhh803130.aspx%23BKMK_1_RelatedTableRole_JoinRelation&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFxvQgSUFY0cak5naFkETDGktC_Aw) 。</span></span></td>
<td><span id="goog-gtc-unit-103" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">Microsoft Dynamics AX的2012</span></span></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-104" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">RelationshipType</span></span></span></td>
<td><span id="goog-gtc-unit-105" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">你选择一个值，描述两个表之间的微妙关系。</span></span><span id="goog-gtc-unit-106" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">例如，值<span class="label">Composition</span>意味着子记录 在脱离了指定父记录时, 不能有意义地存在。</span></span><span id="goog-gtc-unit-107" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">在<span class="label">Floor</span>表中的第四层的记录,不能脱离了父<span class="label">Building</span>表而存在。</span></span>

<div class="alert">
<table>
<tbody>
<tr>
<th align="left"><span id="goog-gtc-unit-108" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100 goog-gtc-ph-missing" dir="ltr">**Note**</span></span></th>
</tr>
<tr>
<td><span id="goog-gtc-unit-109" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">该<span class="label">DeleteActions</span>应与该属性设置兼容。</span></span><span id="goog-gtc-unit-110" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">对于<span class="label">Composition</span>关系中<span class="label">，DeleteActions</span>应包括级联删除行为。</span></span><span id="goog-gtc-unit-111" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">有关删除操作的详细信息，请参见[如何：创建删除操作](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2Fen-us%2Flibrary%2Fbb315018.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNHPTC1rXXk2BbLj1H2XIxYw1SKIJQ) 。</span></span></td>
</tr>
</tbody>
</table>
</div>

<span id="goog-gtc-unit-112" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">有关此属性的可用值的更多信息，请参阅[了解的RelationshipType枚举](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2Fen-us%2Flibrary%2Fhh803131.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNEmhufRcxmagtdHBSTUid4iiC9rAw)或[的RelationshipType](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2Fen-us%2Flibrary%2Frelationshiptype.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNHwmJL5Be-RXIOYaP5oQ80jMEUwtw) 。</span></span>

<span id="goog-gtc-unit-113" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">在Microsoft Dynamics AX 2012此属性尚未被系统使用。</span></span><span id="goog-gtc-unit-114" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">本产品的未来版本可能会使用这个属性。</span></span></td>
<td><span id="goog-gtc-unit-115" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">Microsoft Dynamics AX的2012</span></span></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-116" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Role</span></span></span></td>
<td><span id="goog-gtc-unit-117" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">一个用以描述关系的意义或角色的名称。</span></span><span id="goog-gtc-unit-118" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">例如，部门表的关系，可以跟踪该雇员目前属于的部门。</span></span><span id="goog-gtc-unit-119" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">同时另一个关系可以跟踪该雇员已要求转移的部门。</span></span><span id="goog-gtc-unit-120" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">两者都关系到部门表，但两人的关系都尽显不同的角色。</span></span><span id="goog-gtc-unit-121" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">在实践中，一个精美的值往往是父子表通过<span class="label">_</span>下划线连接的名称。</span></span><span id="goog-gtc-unit-122" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">例如<span class="label">，SalesTable_SalesLine。</span></span></span><span id="goog-gtc-unit-123" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">该属性与<span class="label">UseDefaultRoleNames</span>属性交互。</span></span></td>
<td><span id="goog-gtc-unit-124" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">Microsoft Dynamics AX的2012</span></span></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-125" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100" dir="ltr">Table</span></span></span></td>
<td><span id="goog-gtc-unit-126" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">该关系中引用的。</span></span></td>
<td></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-127" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">UseDefaultRoleNames</span></span></span></td>
<td><span id="goog-gtc-unit-128" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">Yes</span>意味着系统必须为<span class="label">Role</span>和<span class="label">RelatedTableRole</span>属性产生的默认值。</span></span><span id="goog-gtc-unit-129" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">即使设置为<span class="label">Yes</span> ，为<span class="label">Role</span>和<span class="label">RelatedTableRole</span>属性生成的值也不会显示在<span class="label">属性</span>窗口中。</span></span><span id="goog-gtc-unit-130" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">另外, <span class="code">TreeNode</span>类不使用生成的值。</span></span><span id="goog-gtc-unit-131" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">然而，反射类<span class="code">DictRelation</span>使用生成的值。</span></span></td>
<td><span id="goog-gtc-unit-132" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">Microsoft Dynamics AX的2012</span></span></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-133" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Validate</span></span></span></td>
<td><span id="goog-gtc-unit-134" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">Yes</span>指除非每一个通过窗体插入到字表中的记录都会被拒绝.除非相关的记录存在于引用的父表中。</span></span><span id="goog-gtc-unit-135" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">此外，通过从父表的窗体中删除一条记录不是被拒绝,而会删除子表中相关级联记录。</span></span><span id="goog-gtc-unit-136" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">当<span class="label">RelationshipType</span>属性为<span class="label">Link</span>时, 您可以使用<span class="label">No</span>。</span></span><span id="goog-gtc-unit-137" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">比如在一些升级情景期间,你也可以在特定临时类中使用<span class="label">No</span>。</span></span><span id="goog-gtc-unit-138" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human goog-gtc-ph-missing" dir="ltr">即使当该值设置回<span class="label">Yes</span> ，在插入或删除时也不会发生验证。</span></span>

<div class="alert">
<table>
<tbody>
<tr>
<th align="left"><span id="goog-gtc-unit-139" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100 goog-gtc-ph-missing" dir="ltr">**Caution**</span></span></th>
</tr>
<tr>
<td><span id="goog-gtc-unit-140" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human goog-gtc-ph-missing" dir="ltr">该值设为<span class="label">是</span>，并不能防止直接用X + + SQL数据操作，删除父记录，或在违反外键数据的完整性的情况下插入子记录。</span></span></td>
</tr>
</tbody>
</table>
</div>
</td>
<td></td>
</tr>
</tbody>
</table>
</div>
<div class="alert">
<table>
<tbody>
<tr>
<th align="left"><span id="goog-gtc-unit-141" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100 goog-gtc-ph-missing" dir="ltr">**Note**</span></span></th>
</tr>
<tr>
<td><span id="goog-gtc-unit-142" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">当两个表的<span class="label">SaveDataPerCompany</span>属性都设置为<span class="label">Yes</span>, 系统会给每个关系添加<span class="code">DataAreaId</span>字段。</span></span></td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div>

<a class="LW_CollapsibleArea_TitleAhref"><span id="goog-gtc-unit-143" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"> <span class="LW_CollapsibleArea_Title">RelatedTableRole和Query JoinRelation</span></span></span></a>

<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock">

<a id="sectionToggle1"></a><span id="goog-gtc-unit-144" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">本节将介绍如何使用<span class="label">RelatedTableRole</span>属性来简化创建一个新的查询。</span></span>

<span id="goog-gtc-unit-145" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">假设在一个表关系中,您为<span class="label">RelatedTableRole</span>属性输入一个显式值。</span></span><span id="goog-gtc-unit-146" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human goog-gtc-ph-missing" dir="ltr">然后，您可以使用该值来填充<span class="label">AOT&gt;查询</span> &gt; <span class="parameter">MyQuery</span>节点下的数据源关系的<span class="label">JoinRelation</span>属性。</span></span><span id="goog-gtc-unit-147" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">这使您可以指定的连接只在一个位置的字段。</span></span><span id="goog-gtc-unit-148" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">如果连接领域不断改变，你必须更新连接只在一个位置。</span></span>

<span id="goog-gtc-unit-149" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">之前，你可以设置<span class="label">JoinRelation</span>属性的值，则必须删除<span class="label">字段</span>和<span class="label">RelatedField</span>属性的值。</span></span>

<span id="goog-gtc-unit-150" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">下面的两幅图显示了如何使用<span class="label">JoinRelation</span>属性。</span></span>

1.  <span id="goog-gtc-unit-151" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">第一个图片-显示了在表关系的属性，以及<span class="label">RelatedTableRole</span>财产的价值被突出显示。</span></span>
2.  <span id="goog-gtc-unit-152" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">第二个图片 &#8211; 显示了一个查询下一个数据源关系的性质。</span></span><span id="goog-gtc-unit-153" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">我们看到，对于<span class="label">JoinRelation</span>属性的值是针对<span class="label">RelatedTableRole</span>值的副本。</span></span>

<span class="label"><span id="goog-gtc-unit-154" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">[![IC562597](http://reinhardhsu.com/wp-content/uploads/2015/01/IC562597.png)](http://reinhardhsu.com/wp-content/uploads/2015/01/IC562597.png)[

](http://reinhardhsu.com/wp-content/uploads/2015/01/IC562597.png) [

](http://reinhardhsu.com/wp-content/uploads/2015/01/IC562598.png)在表上的相关属性RelatedTableRole</span></span></span>

<span id="goog-gtc-unit-155" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">在接下来的图像，我们看到了<span class="label">JoinRelation</span>属性的值是值的<span class="label">RelatedTableRole</span>副本从以前的形象。</span></span>

<span class="label"><span id="goog-gtc-unit-156" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">[![IC562598](http://reinhardhsu.com/wp-content/uploads/2015/01/IC562598.png)](http://reinhardhsu.com/wp-content/uploads/2015/01/IC562598.png)在查询下一个关系的JoinRelation属性</span></span></span>

</div>
</div>
<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div>

<a class="LW_CollapsibleArea_TitleAhref"><span id="goog-gtc-unit-157" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"> <span class="LW_CollapsibleArea_Title">CreateNavigationPropertyMethods和RelatedTableRole</span></span></span></a>

<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock">

<a id="sectionToggle2"></a><span id="goog-gtc-unit-158" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">当你在一个表关系的<span class="label">CreateNavigationPropertyMethods</span>属性设置<span class="label">为</span> Yes，系统会生成导航方法为表缓冲级。</span></span><span id="goog-gtc-unit-159" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">一种导航方法，通过他们的外键关系连接两个表缓冲区实例。</span></span><span id="goog-gtc-unit-160" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">该<span class="code">的UnitOfWork</span>类就是这个导航键被使用的一个区域。</span></span>

<span id="goog-gtc-unit-161" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">对于导航方法的名称是从上表关系的<span class="label">RelatedTableRole</span>属性的值复制。</span></span><span id="goog-gtc-unit-162" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">这是真实的，当<span class="label">RelatedTableRole</span>值显式设置在<span class="label">属性</span>窗口中，当由<span class="label">UseDefaultRoleNames</span>设置<span class="label">为</span> Yes产生的<span class="label">RelatedTableRole</span>值。</span></span>

<span id="goog-gtc-unit-163" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">在以前的图像的属性值产生对孩子<span class="code">CustTable的</span>缓冲以下导航方法。</span></span><span id="goog-gtc-unit-164" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">最直接的导航方法名称是从<span class="label">RelatedTableRole</span>属性的值复制：</span></span>

<span class="code"><span id="goog-gtc-unit-165" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">公众最终CustBankAccount bankAccounts中（[CustBankAccount RELATEDTABLE]）</span></span></span>

### <span id="goog-gtc-unit-166" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">NavigationPropertyMethodNameOverride属性</span></span>

<div class="subsection">

<span id="goog-gtc-unit-167" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">下面的列表描述情况下，你必须覆盖该系统生成的表缓冲区类中的导航方法的名称：</span></span>

*   <span id="goog-gtc-unit-168" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">表类已经有相匹配的<span class="label">RelatedTableRole</span>属性值的方法名。</span></span>
*   <span id="goog-gtc-unit-169" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">该<span class="label">RelatedTableRole</span>属性值比启用了方法名的最大长度。</span></span>

<span id="goog-gtc-unit-170" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">在这种情况下，你必须选择一个导航方法的有效名称，并指定该名称作为<span class="label">NavigationPropertyMethodNameOverride</span>属性的值，在表的关系。</span></span>

</div>
</div>
</div>