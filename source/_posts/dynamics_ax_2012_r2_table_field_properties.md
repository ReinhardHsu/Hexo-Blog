---
title: Dynamics AX 2012 R2 Table Field Properties
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 14:33:52
---

<span id="goog-gtc-unit-52" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">以下属性相关报告，用于将信息添加到报表模型。</span></span>

*   <span class="code"><span id="goog-gtc-unit-53" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AnalysisDefaultTotal</span></span></span>
*   <span class="code"><span id="goog-gtc-unit-54" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AnalysisLabel</span></span></span>
*   <span class="code"><span id="goog-gtc-unit-55" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AnalysisTotaling</span></span></span>
*   <span class="code"><span id="goog-gtc-unit-56" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AnalysisUsage</span></span></span>
*   <span class="code"><span id="goog-gtc-unit-57" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AnalysisVisibility</span></span></span>
*   <span class="code"><span id="goog-gtc-unit-58" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">CurrencyCode</span></span></span>
*   <span class="code"><span id="goog-gtc-unit-59" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">CurrencyCodeField</span></span></span>
*   <span class="code"><span id="goog-gtc-unit-60" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">CurrencyCodeTable</span></span></span>

<span id="more-22"></span>

<div class="caption"></div>
<div class="tableSection">
<table>
<tbody>
<tr>
<th colspan="1"><span id="goog-gtc-unit-61" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100" dir="ltr"> 属性</span></span></th>
<th colspan="1"><span id="goog-gtc-unit-62" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">描述</span></span></th>
<th colspan="1"><span id="goog-gtc-unit-63" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">在这个新版本中</span></span>

<span id="goog-gtc-unit-64" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">Microsoft Dynamics AX的</span></span></th>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-65" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Adjustment(调整)</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-66" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">确定字符串字段在数据库中存储为,向左对齐还是向右对齐。</span></span><span id="goog-gtc-unit-67" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">例如，如果一个有着11个字符的字符串的“hello world”被存储在一个右对齐的字段，该字段的<span class="label">StringSize</span>的设为40，然后29空格字符被存储为前缀。</span></span></p>
<div class="alert">
<table>
<tbody>
<tr>
<th align="left"><span id="goog-gtc-unit-68" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">![](http://i.msdn.microsoft.com/areas/global/content/clear.gif) **Note**</span></span></th>
</tr>
<tr>
<td><span id="goog-gtc-unit-69" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">当您在表中使用关系运算符&gt;，&lt;，&gt; =或&lt;=来搜索某个值时, <span class="label">Adjustment(调整)</span>设置会影响搜索结果。</span></span><span id="goog-gtc-unit-70" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">它不影响==运算符。</span></span></td>
</tr>
</tbody>
</table>
</div>

<span id="goog-gtc-unit-71" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human goog-gtc-ph-missing" dir="ltr">当<span class="label">StringSize</span>为（Memo）,<span class="label">调整</span>设置将被忽略。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-72" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">Alias​​For</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-73" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">决定了该字段作为哪个表字段的别名。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-74" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">AllowEdit</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-75" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">确定是否允许用户修改数据库中的表格中的现有记录。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-76" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AllowEditOnCreate</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-77" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">确定用户是否被允许时，当一个新的记录从一个表单中创建, 确定用户是允许用户在该字段中输入数据。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-78" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AnalysisDefaultTotal</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-79" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">对于报表模型，它指定方法时自动总额表显示在使用Microsoft SQL Server报表服务和报表模型建立了一个报告汇总字段数据。</span></span><span id="goog-gtc-unit-80" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">默认值是<span class="label">否</span> ，这表示该字段未自动显示作为一个整体。</span></span><span id="goog-gtc-unit-81" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">对于OLAP多维数据集，它指定了聚合函数的度量。</span></span><span id="goog-gtc-unit-82" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">使用此属性时<span class="label">AnalysisUsage</span>设置为<span class="label">测量</span> 。</span></span><span id="goog-gtc-unit-83" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">您可以指定下列值之一。</span></span>

*   <span id="goog-gtc-unit-84" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">森</span> -返回集合中的所有值的总和。</span></span>
*   <span id="goog-gtc-unit-85" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">计数</span> -返回一组非空项的数量。</span></span>
*   <span id="goog-gtc-unit-86" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">CountDistinct</span> -返回不同的非空项的一组数字。</span></span>
*   <span id="goog-gtc-unit-87" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">最小</span> -返回最小值在一组。</span></span>
*   <span id="goog-gtc-unit-88" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">马克斯</span> -返回最高值在一组。</span></span>
*   <span id="goog-gtc-unit-89" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">无</span> -无应用聚合函数。</span></span>
*   <span id="goog-gtc-unit-90" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">自动</span> -适用于派生的扩展数据类型。</span></span><span id="goog-gtc-unit-91" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">父扩展数据类型的<span class="label">AnalysisUsage</span>属性的值将被使用。</span></span>
</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-92" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AnalysisLabel</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-93" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指定为在SQL Server分析服务（SSAS）多维数据集的表字段标题使用的标签。</span></span><span id="goog-gtc-unit-94" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">该标签适用​​于任何一个维度属性或量度。</span></span><span id="goog-gtc-unit-95" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">此属性才可使用以下任一操作为真：</span></span></p>

*   <span id="goog-gtc-unit-96" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">Label</span>属性没有定义。</span></span>
*   <span id="goog-gtc-unit-97" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">标签</span>属性不作为标题在一个SSAS多维数据集维度属性或度量工作。</span></span>
</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-98" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AnalysisUsage</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-99" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">标识字段的多维数据集中的作用。</span></span><span id="goog-gtc-unit-100" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">您可以指定下列值之一。</span></span></p>

*   <span id="goog-gtc-unit-101" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">属性</span> -该字段是一个维度属性。</span></span>
*   <span id="goog-gtc-unit-102" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">测量</span> -该字段是一个衡量。</span></span>
*   <span id="goog-gtc-unit-103" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">两者</span> -该字段是两个维度的属性和方法。</span></span>
*   <span id="goog-gtc-unit-104" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">无</span> -该字段是不是一个维度属性，而不是一个衡量。</span></span>
*   <span id="goog-gtc-unit-105" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">自动</span> -该字段是基于扩展的数据类型或枚举<span class="label">AnalysisUsage</span>属性的值将被使用。</span></span>
</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-106" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">ConfigurationKey</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-107" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">设置配置密钥字段。</span></span></td>
<td></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-108" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">CountryRegionCodes</span></span></span></td>
<td><span id="goog-gtc-unit-109" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">指定表字段适用或有效的国家地区代码。</span></span><span id="goog-gtc-unit-110" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">客户端架构和应用可以利用这个属性来启用或禁用国家或地区的特定功能。</span></span><span id="goog-gtc-unit-111" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">这是实施的ISO国家代码在一个字符串中的逗号分隔的列表。</span></span><span id="goog-gtc-unit-112" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">该值必须匹配包含在全局地址簿中的数据。</span></span></td>
<td><span id="goog-gtc-unit-113" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AX 2012</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-114" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">CountryRegionContextField</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-115" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指定将被用来识别该国上下文字段。</span></span><span id="goog-gtc-unit-116" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">见<span class="label">CountryRegionCodes。</span></span></span></td>
<td><span id="goog-gtc-unit-117" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AX 2012</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-118" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">ExtendedDataType</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-119" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">确定将被用于这个字段扩展的数据类型。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-120" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">GroupPrompt</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-121" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指定标签的字段，当它出现在一个组。</span></span></p>
<div class="alert">
<table>
<tbody>
<tr>
<th align="left"><span id="goog-gtc-unit-122" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100 goog-gtc-ph-missing" dir="ltr">![](http://i.msdn.microsoft.com/areas/global/content/clear.gif) **Tip**</span></span></th>
</tr>
<tr>
<td><span id="goog-gtc-unit-123" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">你可以使用这个属性，以确保字段标签不重复出现在字段组标签文本。</span></span><span id="goog-gtc-unit-124" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">例如，如果一个表单上的字段组被标<span class="input">客户</span> ，不包括在<span class="label">GroupPrompt</span>属性中为该字段设置的文本。</span></span></td>
</tr>
</tbody>
</table>
</div>
</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-125" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">HelpText</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-126" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指定帮助字符串的字段。</span></span><span id="goog-gtc-unit-127" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">当该字段用于在表单中显示的帮助字符串。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-128" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">ID</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-129" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">指定由该系统产生的字段ID。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-130" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">IgnoreEDTRelation</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-131" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">用于EDT（扩展数据类型）的关系迁移。</span></span><span id="goog-gtc-unit-132" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">当从EDT节点迁移关系到一个表节点，你可以跳过对该表无效的关系。</span></span><span id="goog-gtc-unit-133" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">要做到这一点，该字段的<span class="label">IgnoreEDTRelation</span>属性设置<span class="label">为</span> Yes。</span></span><span id="goog-gtc-unit-134" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">默认值是<span class="label">No</span> 。</span></span></td>
<td><span id="goog-gtc-unit-135" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AX 2012</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-136" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Label</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-137" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指定字段的标签。</span></span><span id="goog-gtc-unit-138" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">这将出现在窗体和报表。</span></span><span id="goog-gtc-unit-139" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">也见<span class="label">AnalysisLabel（</span>在先前的行）。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-140" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Mandatory(强制性)</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-141" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指示用户是否必须在窗体中添加数据的字段。</span></span><span id="goog-gtc-unit-142" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">强制</span>设置<span class="label">为</span> Yes，表明默认值或初始值，每种数据类型是不能接受的持久化到数据库中。</span></span><span id="goog-gtc-unit-143" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">下面的列表显示了一些不能用于窗体上的<span class="label">必填</span>字段的默认值：</span></span></p>

*   <span id="goog-gtc-unit-144" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">空是无法接受的<span class="code">STR（</span>字符串）字段。</span></span>
*   <span id="goog-gtc-unit-145" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">最小的日期时间是不能接受的日期时间字段，例如<span class="code">日期</span>和<span class="code">utcdatetime。</span></span></span>
*   <span id="goog-gtc-unit-146" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">0是不能接受的数字字段<span class="code">，</span>如int， <span class="code">真正的</span>和<span class="code">枚举</span> 。</span></span>

<span id="goog-gtc-unit-147" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Microsoft Dynamics AX的语法上不支持存在于大部分的SQL数据库产品标准中的<span class="input">null</span>值。</span></span><span id="goog-gtc-unit-148" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">基于Microsoft Dynamics AX的数据库的所有字段不可为空。因此， <span class="label">Mandatory</span>属性不涉及任何与null概念相关的操作。</span></span>

<div class="alert">
<table>
<tbody>
<tr>
<th align="left"><span id="goog-gtc-unit-149" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">![](http://i.msdn.microsoft.com/areas/global/content/clear.gif) **Caution**</span></span></th>
</tr>
<tr>
<td><span id="goog-gtc-unit-150" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">强制性表字段可以有一个<span class="label">EnumType</span>属性来设置一个枚举值。</span></span><span id="goog-gtc-unit-151" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">你可以定义一个字段作为包括具有整数值0的项枚举类型。</span></span><span id="goog-gtc-unit-152" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">在这种情况下，0项不可用的形式来进行选择。</span></span></td>
</tr>
</tbody>
</table>
</div>

<span id="goog-gtc-unit-153" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">该形式系统会自动调用<span class="code">validateWrite</span>方法来执行<span class="label">Mandatory</span>属性的设置。</span></span>

<span id="goog-gtc-unit-154" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">然而， <span class="label">Mandatory</span>属性对直接X + + SQL的插入或更新一个表字段的值的行为没有任何影响。</span></span><span id="goog-gtc-unit-155" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">在您的直接X + + SQL您可以选择包括调用<span class="code">validateWrite</span>方法对你的表缓冲区变量。</span></span><span id="goog-gtc-unit-156" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">您的缓冲区变量的<span class="code">扩展记录</span>类继承的方法。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-157" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">MinReadAccess</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-158" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指定自动授权功能的模式。</span></span><span id="goog-gtc-unit-159" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">自动授权有2种工作模式：代理外键和查找。</span></span>

<span id="goog-gtc-unit-160" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果在一个查询中的表被触发,用于为代理外键授权，并且用户不能访问该表并没有明确被拒绝，那么视图访问权限授予该表。</span></span>

<span id="goog-gtc-unit-161" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">然而，并非所有字段都是可见的;的可见性是由以下规则确定：</span></span>

*   <span id="goog-gtc-unit-162" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果minReadAccess是<span class="label">No</span> ，不能访问该字段。</span></span>
*   <span id="goog-gtc-unit-163" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">否则，如果minReadAccess为<span class="label">Yes</span> ，为该字段授予视图访问权限。</span></span>
*   <span id="goog-gtc-unit-164" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">否则 , 如果它是自然键自动识别组的一部分，如果它是一个title字段，或者如果它是一个系统领域, 视图访问将被授予，。</span></span>

<span id="goog-gtc-unit-165" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果查询中的表在查找授权时被触发, 访问权取决于以下规则：</span></span>

*   <span id="goog-gtc-unit-166" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">如果MinReadAccess设为No，那么不会授予该字段访问权。</span></span>
*   <span id="goog-gtc-unit-167" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">否则，视图访问权将被授予该字段。</span></span>
</td>
<td><span id="goog-gtc-unit-168" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AX 2012</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-169" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Model</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-170" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">指定条字段在哪个模型中.</span></span><span id="goog-gtc-unit-171" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">模型是层中元素的逻辑分组。</span></span><span id="goog-gtc-unit-172" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">一个层中的元素可以存在与恰当的模型中。</span></span><span id="goog-gtc-unit-173" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">元素的例子是一个表或类。</span></span><span id="goog-gtc-unit-174" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">相同的元素可以在一个模型的定制版本中存在较高的层。</span></span></td>
<td><span id="goog-gtc-unit-175" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AX 2012</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-176" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100" dir="ltr">Name</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-177" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指定了字段的名字。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-178" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">RelationContext</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-179" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">指定一个字段到一个特定表关系的映射。</span></span><span id="goog-gtc-unit-180" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">这通常用于测量单位的情况下，以相关货币代码或批量的数据模型。</span></span><span id="goog-gtc-unit-181" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">与此字段关联的关系可以被用来显示的币种代码或批量查找。</span></span></p>

<span id="goog-gtc-unit-182" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">没有默认值。</span></span></td>
<td><span id="goog-gtc-unit-183" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">AX 2012</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-184" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">SaveContents</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-185" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">确定该字段的数据是否被保存在数据库中，或将被视为虚拟字段的数据。</span></span><span id="goog-gtc-unit-186" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">虚拟字段数据计算显示领域时，运行时间，并在数据库中没有物理表示。</span></span>

<div class="alert">
<table>
<tbody>
<tr>
<th align="left"><span id="goog-gtc-unit-187" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100 goog-gtc-ph-missing" dir="ltr">![](http://i.msdn.microsoft.com/areas/global/content/clear.gif) **Tip**</span></span></th>
</tr>
<tr>
<td><span id="goog-gtc-unit-188" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">与虚拟字段相反，您可以使用[显示和编辑方法](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2Fen-us%2Flibrary%2Faa595058.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNHqQikWxLZUsdOwwACrAta24cayog) 。</span></span></td>
</tr>
</tbody>
</table>
</div>
</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span id="goog-gtc-unit-189" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><a id="yb79strszadjus"></a> <span class="label">StringSize</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-190" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">设置字段的长度，以字符数。</span></span><span id="goog-gtc-unit-191" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">最大字段长度是由数据库决定的。</span></span><span id="goog-gtc-unit-192" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">（Memo）</span>值表示该字段是不限制长度。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-193" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Type</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-194" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指定字段的基本类型。</span></span></td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-195" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Visible</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-196" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human goog-gtc-unit-highlight" dir="ltr">确定该字段在用户界面是否可见</span></span></td>
</tr>
</tbody>
</table>
</div>