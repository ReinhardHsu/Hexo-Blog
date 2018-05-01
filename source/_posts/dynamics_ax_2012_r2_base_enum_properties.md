---
title: Dynamics AX 2012 R2 Base Enum Properties
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 14:58:45
---

The following table describes the properties available for enums.

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
<td colspan="1"><span class="label">AnalysisUsage(分析用途)</span></td>
<td colspan="1">标明枚举在 cube 中的作用. 这个设置时自动传播到所有表中引用该枚举的字段. Specify one of the following values.</p>

*   <span class="label">Attribute </span>&#8211; 引用枚举的字段是一个维度属性.
*   <span class="label">None </span>&#8211; 引用枚举的字段不是一个维度属性.
</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">ConfigurationKey</span></td>
<td colspan="1">Sets the configuration key.</td>
<td></td>
</tr>
<tr>
<td><span class="label">CountryRegionCodes</span></td>
<td>Specifies the country region code(s) where the view is applicable or valid. 客户端和应用程序用这个属性来启用或禁用国家或区域特性. This is implemented as a comma-separated list of ISO country codes in a single string. The values must match data contained in the global address book.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">DisplayLength</span></td>
<td colspan="1">Sets the number of characters displayed.Default value is <span class="label">Auto </span>.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">Help</span></td>
<td colspan="1">为字段创建一个帮助字符串. 当该字段用在窗体上时,显示帮助字符串.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">Label</span></td>
<td colspan="1">Specifies a label that will be shown in forms and reports.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">Model</span></td>
<td colspan="1">Specifies which model the table is in.模型是层中元素的逻辑分组. 一个元素可以存在于一个层中的一个恰当的分组. 元素可以是一个表或类. The same element can exist in a customized version in a model in a higher layer.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">Name</span></td>
<td colspan="1">Specifies the enum name.枚举的名字必须表明可能的枚举值或值类型.比如根据可能的值命名 <span class="code">InclExcl </span>and <span class="code">NextPrevious </span>.</p>

比如根据枚举的值类型命名 <span class="code">ArrivalPostingType </span>and <span class="code">ListStatus </span>.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">Style</span></td>
<td colspan="1">改变枚举的默认显示. The options are as follows:

*   Combo box
*   Radio button
</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">UseEnumValue</span></td>
<td colspan="1">该属性若设为 <span class="code">Yes </span>表明默认 <span class="code">EnumValue </span>属性被修改 . 将该属性设为 <span class="code">No </span>可以重设 <span class="code">EnumValue </span>属性 .</td>
</tr>
</tbody>
</table>
</div>
