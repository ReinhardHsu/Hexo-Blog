---
title: Dynamics AX 2012 R2 Table Index Properties
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 14:36:25
---

<span id="goog-gtc-unit-51" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">下表描述了可用于表的索引的属性。</span></span><span id="more-24"></span>

<div class="tableSection">
<table>
<tbody>
<tr>
<th colspan="1"><span id="goog-gtc-unit-52" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">属性</span></span></th>
<th colspan="1"><span id="goog-gtc-unit-53" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">描述</span></span></th>
<th colspan="1">New in this version of

Microsoft Dynamics AX</th>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-56" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AllowDuplicates</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-57" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">如果设置<span class="label">为</span> Yes，该指数可以是非唯一的。</span></span><span id="goog-gtc-unit-58" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果你没有创建一个唯一索引，Microsoft Dynamics AX会通过结合第一个索引和<span class="code">RECID</span>来创建一个。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-59" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AlternateKey</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-60" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">控制这个索引是否是一个替代键的一部分。</span></span><span id="goog-gtc-unit-61" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">索引字段必须在每个记录中有一个唯一值。</span></span></td>
<td><span id="goog-gtc-unit-62" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AX 2012</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-63" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">ConfigurationKey</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-64" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">设置配置键。</span></span><span id="goog-gtc-unit-65" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果通过配置键禁用索引字段, 会从索引中自动删除。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-66" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Enabled</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-67" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">允许您禁用索引。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-68" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">ID</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-69" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">对象内部标识符。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-70" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100" dir="ltr">Model</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-71" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指定哪个型号的表索引所在</span></span><span id="goog-gtc-unit-72" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">模型是在一个层中元素的逻辑分组。</span></span><span id="goog-gtc-unit-73" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">一个元素可以在一个层只有一个模式存在。</span></span><span id="goog-gtc-unit-74" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">元素的例子是一个表或类。</span></span><span id="goog-gtc-unit-75" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">相同的元件可以在一个模型的定制版本中存在较高的层。</span></span></td>
<td><span id="goog-gtc-unit-76" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AX 2012</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-77" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Name</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-78" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指定索引名。</span></span></td>
<td></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-79" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">ValidTimeStateKey</span></span></span></td>
<td><span id="goog-gtc-unit-80" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">指定此索引键是否被用来确定与附表之间的[valid time state](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2Fen-us%2Flibrary%2Fgg861781.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNGf8Vgxeyp6itpGNZ_YrEbza3TiqQ)关系。</span></span><span id="goog-gtc-unit-81" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">默认为<span class="label">No</span> 。</span></span></p>
<div class="alert">
<table>
<tbody>
<tr>
<th align="left"><span id="goog-gtc-unit-82" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100 goog-gtc-ph-missing" dir="ltr">![](http://i.msdn.microsoft.com/areas/global/content/clear.gif) **Tip**</span></span></th>
</tr>
<tr>
<td><span id="goog-gtc-unit-83" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human goog-gtc-ph-missing" dir="ltr">需要设置<span class="label">AllowDuplicates</span>为No并且<span class="label">AlternateKey为</span> Yes才能启用该属性。</span></span></td>
</tr>
</tbody>
</table>
</div>
</td>
<td><span id="goog-gtc-unit-84" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AX 2012</span></span></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-85" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">ValidTimeStateMode</span></span></span></td>
<td><span id="goog-gtc-unit-86" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">指定是否允许两个[date effective](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2Fen-us%2Flibrary%2Fgg861781.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNGf8Vgxeyp6itpGNZ_YrEbza3TiqQ)记录之间的间隙生效。</span></span><span id="goog-gtc-unit-87" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">默认值是<span class="label">NoGap。</span></span></span></p>
<div class="alert">
<table>
<tbody>
<tr>
<th align="left"><span id="goog-gtc-unit-88" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100 goog-gtc-ph-missing" dir="ltr">![](http://i.msdn.microsoft.com/areas/global/content/clear.gif) **Tip**</span></span></th>
</tr>
<tr>
<td><span id="goog-gtc-unit-89" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human goog-gtc-ph-missing" dir="ltr">需要设置<span class="label">AllowDuplicates</span>为No, <span class="label">AlternateKey</span>为Yes,<span class="label"> ValidTimeStateKey</span>为 Yes，使启用该属性。</span></span></td>
</tr>
</tbody>
</table>
</div>
</td>
<td><span id="goog-gtc-unit-90" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AX 2012</span></span></td>
</tr>
</tbody>
</table>
</div>
<div class="alert">
<table>
<tbody>
<tr>
<th align="left"><span id="goog-gtc-unit-91" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">![](http://i.msdn.microsoft.com/areas/global/content/clear.gif) **注**</span></span></th>
</tr>
<tr>
<td>Forms sort on the first index.</td>
</tr>
</tbody>
</table>
</div>