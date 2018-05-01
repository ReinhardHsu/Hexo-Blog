---
title: Dynamics AX 2012 R2 Understanding the RelationshipType Enumeration
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 14:42:57
---

When you add a node under <span class="label">AOT</span> &gt; <span class="label">Data Dictionary</span> &gt; <span class="label">Tables</span> &gt; <span class="parameter">YourTable</span> &gt; <span class="label">Relations</span>, you can set the value of the <span class="label">RelationshipType</span> property of the new relation. The list of possible values for the <span class="label">RelationshipType</span> property is the list of elements in the <span class="label">RelationshipType</span> enum. The meaning of each element in the <span class="label">RelationshipType</span> enum is described in this topic.

<span id="more-28"></span>

<div class="tableSection">
<table>
<tbody>
<tr>
<th><span id="goog-gtc-unit-51" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">元素名称</span></span></th>
<th><span id="goog-gtc-unit-52" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">描述</span></span></th>
<th><span id="goog-gtc-unit-53" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">自动推理</span></span></th>
</tr>
<tr>
<td><span id="goog-gtc-unit-54" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">NotSpecified</span></span></td>
<td><span id="goog-gtc-unit-55" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100-ice" dir="ltr">通常情况下，<span class="label">RelationshipType</span>属性的默认值。</span></span></td>
<td><span id="goog-gtc-unit-56" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">当<span class="label">RelationshipType</span>属性有<span class="label">NotSpecified</span>的值时，系统会推断一个适当的值。</span></span><span id="goog-gtc-unit-57" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100-ice" dir="ltr">该系统按以下顺序推断值：</span></span></p>

1.  <span id="goog-gtc-unit-58" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100-ice" dir="ltr"> Specialization </span></span>
2.  <span id="goog-gtc-unit-59" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100-ice" dir="ltr"> Link </span></span>
3.  <span id="goog-gtc-unit-60" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100-ice" dir="ltr"> Composition (组成)</span></span>
4.  <span id="goog-gtc-unit-61" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100-ice" dir="ltr"> Aggregation (聚合)</span></span>
5.  <span id="goog-gtc-unit-62" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100-ice" dir="ltr"> Association (关联)</span></span>

<span id="goog-gtc-unit-63" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100-ice" dir="ltr">例如，如果条件同时符合<span class="label">Composition</span>和<span class="label">Aggregation</span> ，系统会用<span class="label">Compostion</span> 。</span></span><span id="goog-gtc-unit-64" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100-ice" dir="ltr">这是因为<span class="label">Compistion</span> 在列表中出现得早。</span></span></td>
</tr>
<tr>
<td><span id="goog-gtc-unit-65" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100-ice" dir="ltr"> Specialization </span></span></td>
<td><span id="goog-gtc-unit-66" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">仅适用于表继​​承，​​用于基类和派生表之间的关系。</span></span></td>
<td><span id="goog-gtc-unit-67" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">每当表继承被触发时，该系统将<span class="label">RelationshipType</span>属性设为<span class="label">Specialization</span> 。</span></span></td>
</tr>
<tr>
<td><span id="goog-gtc-unit-68" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100-ice" dir="ltr"> Link </span></span></td>
<td><span id="goog-gtc-unit-69" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">是一个非关系型的关系。</span></span><span id="goog-gtc-unit-70" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100-ice" dir="ltr"><span class="label">Link</span>要求<span class="label">Validate(yanzhe)</span>属性被设置为<span class="label">No。</span></span></span><span id="goog-gtc-unit-71" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">这种类型的关系支持形式，列出多条记录从表中，并提供详细的信息从表中的一个记录表格之间的导航。</span></span></td>
<td><span id="goog-gtc-unit-72" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">链接</span>只是为了将早期版本的产品（EDT）链接关系升级到Microsoft Dynamics AX 2012的扩展数据类型。</span></span><span id="goog-gtc-unit-73" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">迁移工具创建这种类型的关系，但你万万不可。</span></span></td>
</tr>
<tr>
<td><span id="goog-gtc-unit-74" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100" dir="ltr"> Composition (组成)</span></span></td>
<td><span id="goog-gtc-unit-75" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">是一种更强的类型<span class="label">聚集</span> 。</span></span><span id="goog-gtc-unit-76" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">一个表不能有一个以上的<span class="label">组合</span>关系。</span></span><span id="goog-gtc-unit-77" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">例如，建筑物由房间组成，同一个房间不能在多个建筑物中存在。</span></span></td>
<td><span id="goog-gtc-unit-78" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">如果符合条件者<span class="label">组成</span> ，但你手动指定<span class="label">聚合</span>或<span class="label">协会</span>的值时，系统保留值作为<span class="label">聚合</span>或<span class="label">协会</span> 。</span></span></td>
</tr>
<tr>
<td><span id="goog-gtc-unit-79" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100" dir="ltr"> Aggregation (聚合)</span></span></td>
<td><span id="goog-gtc-unit-80" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">当子表被认为是从属于父表的实体时，合适用该关系的。</span></span></td>
<td><span id="goog-gtc-unit-81" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">当下列情况为真时，该系统推断<span class="label">聚合</span>：</span></span>

*   <span id="goog-gtc-unit-82" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">父表中有一个删除操作的定义中，使用了这个关系节点。</span></span>
*   <span id="goog-gtc-unit-83" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">这种关系的任何外键字段 ，在子表中的<span class="label">强制性</span>属性设置<span class="label">为</span> Yes。</span></span>
<p><span id="goog-gtc-unit-84" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果符合<span class="label">聚合</span>的条件 ，但你手动指定<span class="label">关联</span>作为RelationshipType的值，系统会使用<span class="label">关联</span> 。</span></span></td>
</tr>
<tr>
<td><span id="goog-gtc-unit-85" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100" dir="ltr"> Association (关联)</span></span></td>
<td><span id="goog-gtc-unit-86" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">一个标准的外键的概念。</span></span></td>
<td><span id="goog-gtc-unit-87" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">您必须在<span class="label">RelationshipType</span>属性设置为<span class="label">协会</span>如果系统属性的值未设置为任何东西，无论<span class="label">聚合</span>和<span class="label">组合</span>都不合适。</span></span></td>
</tr>
</tbody>
</table>
</div>