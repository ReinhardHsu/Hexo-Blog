---
title: Dynamics AX 2012 R2 Extended Data Type Properties
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 15:00:40
---

<div class="introduction">

Extended data type (EDT) 属性分为以下几组:

*   [对所有EDTs都通用的Common to all EDTs](http://msdn.microsoft.com/en-us/library/aa575242.aspx#BKMKcommon)
*   [只适用于特定基本类型的Available only for certain base data types](http://msdn.microsoft.com/en-us/library/aa575242.aspx#BKMKonlybase)
</div>

<span id="more-47"></span>

<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div><a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">Properties Common to All EDTs</span></a></p>
<div class="LW_CollapsibleArea_HrDiv"></div>
</div>
</div>
<div class="sectionblock">
<div class="caption"></div>
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
<td colspan="1"><span class="label">Alignment(对齐)</span></td>
<td colspan="1">Changes the alignment of the text (Left, Right, Center).</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">AnalysisDefaultSort(分析默认排序)</span></td>
<td colspan="1">指定在使用该EDT的报表模型中,默认根据该字段排序.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">AnalysisDefaultTotal</span></td>
<td colspan="1">为度量决定聚合函数. 当 <span class="label">AnalysisUsage </span>设为 <span class="label">Measure(测量) </span>时,可以使用该属性. 你可以指定以下值之一.</p>

*   <span class="label">Sum </span>&#8211; Returns the sum of all the values in a set.
*   <span class="label">Count </span>&#8211; Returns the number of non-null items in a set.
*   <span class="label">CountDistinct </span>&#8211; Returns the number of distinct non-null items in a set.
*   <span class="label">Min </span>&#8211; Returns the minimum value in a set.
*   <span class="label">Max </span>&#8211; Returns the maximum value in a set.
*   <span class="label">None </span>&#8211; No aggregate function is applied.
*   <span class="label">Auto </span>&#8211; 可应用于派生的EDTs. 将使用父EDT的 <span class="label">AnalysisUsage </span>属性的值.

聚合函数可以在字段级别被重写.也就是说, 你可以使用 <span class="label">AnalysisDefaultTotal </span>属性改变要聚合的字段.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">AnalysisGrouping</span></td>
<td colspan="1">Specifies whether a field that has this EDT is grouped by default when the field is added to a report using the Report Builder for Microsoft SQL Server Reporting Services.The property is automatically set to <span class="label">Discouraged </span>for currency amounts. For other fields that are unique, you should set the property to<span class="label">Discouraged </span>. For more information about report models, see &#8220;Generate and publish report models&#8221; in the <span class="label">Help </span>menu for <span class="label">System and Application Setup </span>.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">AnalysisUsage</span></td>
<td colspan="1">Identifies the role of the EDT in a cube. This setting is automatically propagated to all table fields that reference the EDT. However, the setting can be overridden on the table field. Specify one of the following values.

*   <span class="label">Attribute </span>&#8211; A field that references the EDT is a dimension attribute.
*   <span class="label">Measure </span>&#8211; A field that references the EDT is a measure.
*   <span class="label">Both </span>&#8211; A field that references the EDT is both a dimension attribute and a measure.
*   <span class="label">None </span>&#8211; A field that references the EDT is not a dimension attribute and not a measure.
*   <span class="label">Auto </span>&#8211; Applies to derived EDTs. The value of the <span class="label">AnalysisUsage </span>property for the parent EDT is to be used.
<div class="alert">
<table>
<tbody>
<tr>
<th align="left">**Note**</th>
</tr>
<tr>
<td>EDTs that are based on enumerations cannot be measures.</td>
</tr>
</tbody>
</table>
</div>
</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">ArrayLength(数组长度</span></td>
<td colspan="1">只读属性.默认 <span class="code">ArrayLength </span>是 1\. 要添加数组元素到EDT,右键单击 <span class="code">Array Element </span>节点,选择 <span class="code">New Array Element </span>. <span class="code">ArrayLength </span>属性的值会据此增加.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">ButtonImage</span></td>
<td colspan="1">当EDT用作窗体上的查找按钮时,指定它要显示的图像.The possible values are as follows:</p>

*   Arrow (default)
*   Mail (possible use: the e-mail type)
*   URL (possible use: the URL type)
*   ThreeDots (&#8230;)
*   OpenFile (possible uses: the <span class="code">FilenameOpen </span>and <span class="code">FilenameSave </span>types)
*   Calendar (possible use: date types)
</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">CollectionLabel</span></td>
<td colspan="1">Specifies the label that is used to display the plural name of a field that has this EDT.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">ConfigurationKey</span></td>
<td colspan="1">Specifies the configuration key for the EDT.</td>
<td></td>
</tr>
<tr>
<td><span class="label">CountryRegionCodes</span></td>
<td>Specifies the country region codes where the menu is applicable or valid. The client uses this property to enable or disable country or region specific features. This is implemented as a comma-separated list of ISO country codes in a single string. The values must match data that is contained in the global address book.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">DisplayLength</span></td>
<td colspan="1">Specify a maximum number of characters to be displayed in a form or report.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">EnumType</span></td>
<td colspan="1">Specifies an enumerated data type. If an EDT is of type enum, it is mandatory to set the EnumType property.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">Extends</span></td>
<td colspan="1">Enables you to base the EDT on another EDT.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">FormHelp</span></td>
<td colspan="1">Specifies a form that will be used when you perform lookup from a field in a form.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">HelpText</span></td>
<td colspan="1">Creates a Help string for the EDT. The Help string is displayed when the type is used in a form.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">ID</span></td>
<td colspan="1">Read-only property.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">Label</span></td>
<td colspan="1">Specifies a label for the type that is shown when the type is used in a form or report.</td>
<td></td>
</tr>
<tr>
<td colspan="1"><span class="label">Model</span></td>
<td colspan="1">Specifies which model the table is in.A model is a logical grouping of elements in a layer. An element can exist in exactly one model in a layer. Examples of elements are a table or class. The same element can exist in a customized version in a model in a higher layer.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">Name</span></td>
<td colspan="1">Specifies the name of the type.The name is used when it refers to the type from X++.</td>
<td></td>
</tr>
<tr>
<td><span class="label">PresenceClass</span></td>
<td>Identifies the X++ class that will be used with the <span class="label">PresenceMethod </span>to return a <span class="label">PresenceInfo </span>object instance.</td>
<td>AX 2012</td>
</tr>
<tr>
<td><span class="label">PresenceIndicatorAllowed</span></td>
<td>Specifies whether the control referencing the EDT will use presence. Default value is <span class="label">Yes </span>.</td>
<td>AX 2012</td>
</tr>
<tr>
<td><span class="label">PresenceMethod</span></td>
<td>Identifies the X++ static class method in <span class="label">PresenceClass </span>to be called with a controls data value; this returns a <span class="label">PresenceInfo </span>object instance that contains the data needed by the Presence indicator.</td>
<td>AX 2012</td>
</tr>
<tr>
<td><span class="label">ReferenceTable</span></td>
<td>Identifies the table that is referenced by this EDT, and which has the primary key.Indicates the primary key table which this EDT references.</td>
<td>AX 2012</td>
</tr>
<tr>
<td colspan="1"><span class="label">Style</span></td>
<td colspan="1">Changes the default display of the EDT. Options Are:</p>

*   Auto
*   Combo box
*   Radio button
</td>
<td>AX 2012</td>
</tr>
</tbody>
</table>
</div>

For rules and hints about how to set these properties, see [Best Practice for extended data types ](http://msdn.microsoft.com/en-us/library/aa621435.aspx).

</div>
</div>

<!--more-->

<!--more-->

<!--more-->

<div>
<div class="LW_CollapsibleArea_TitleDiv">
<div><a class="LW_CollapsibleArea_TitleAhref" title="Click to collapse. Double-click to collapse all."><span class="LW_CollapsibleArea_Title">Properties that are only Available for Certain Base Data Types</span></a></p>
<div class="LW_CollapsibleArea_HrDiv">

* * *

</div>
</div>
</div>
<div class="sectionblock"><a id="sectionToggle1"></a>Leave these properties set to <span class="label">Auto </span>unless specified otherwise in the following table.</p>
<div class="caption"></div>
<div class="tableSection">
<table>
<tbody>
<tr>
<th colspan="1">Property</th>
<th colspan="1">Exists for these types:</th>
<th colspan="1">Description</th>
</tr>
<tr>
<td colspan="1"><span class="label">Adjustment</span></td>
<td colspan="1">String</td>
<td colspan="1">For fixed length strings, this specifies whether the entered characters will be stored on the left or the right side of the padding spaces.Values are Left or Right. The default value is <span class="label">Left </span>.</td>
</tr>
<tr>
<td colspan="1"><span class="label">AllowNegative</span></td>
<td colspan="1">IntegerInt64Real</td>
<td colspan="1">Specifies whether the field can accept negative values.</td>
</tr>
<tr>
<td colspan="1"><span class="label">AutoInsSeparator</span></td>
<td colspan="1">Real</td>
<td colspan="1">Specifies whether the system inserts a decimal separator automatically. For example, if you enter 2222, the system automatically shows 2222.00.</td>
</tr>
<tr>
<td colspan="1"><span class="label">ChangeCase</span></td>
<td colspan="1">String</td>
<td colspan="1">Specifies how text entered in a string control should be formatted. This property is not supported for Enterprise Portal.For example, the text can be formatted as uppercase, or with title capitalization.</td>
</tr>
<tr>
<td colspan="1"><span class="label">DateDay</span></td>
<td colspan="1">DateUtcDateTime</td>
<td colspan="1">Specifies how the day should be displayed.</td>
</tr>
<tr>
<td colspan="1"><span class="label">DateFormat</span></td>
<td colspan="1">DateUtcDateTime</td>
<td colspan="1">Specifies the layout of a date.</td>
</tr>
<tr>
<td colspan="1"><span class="label">DateMonth</span></td>
<td colspan="1">DateUtcDateTime</td>
<td colspan="1">Specifies how the month should be displayed.</td>
</tr>
<tr>
<td colspan="1"><span class="label">DateSeparator</span></td>
<td colspan="1">DateUtcDateTime</td>
<td colspan="1">Specifies the separators between year, month, and day.</td>
</tr>
<tr>
<td colspan="1"><span class="label">DateYear</span></td>
<td colspan="1">DateUtcDateTime</td>
<td colspan="1">Specifies how the year should be displayed.</td>
</tr>
<tr>
<td colspan="1"><span class="label">DecimalSeparator</span></td>
<td colspan="1">Real</td>
<td colspan="1">Specifies the decimal separator. The default (Auto) setting is whatever is specified in the system setup.</td>
</tr>
<tr>
<td colspan="1"><span class="label">DisplaceNegative</span></td>
<td colspan="1">IntegerInt64Real</td>
<td colspan="1">Specifies if negative numbers should be indented to the left.</td>
</tr>
<tr>
<td colspan="1"><span class="label">DisplayHeight</span></td>
<td colspan="1">String</td>
<td colspan="1">Specifies the number of lines to be displayed simultaneously when the EDT is displayed in a form.</td>
</tr>
<tr>
<td colspan="1"><span class="label">EnumType</span></td>
<td colspan="1">Enum</td>
<td colspan="1">Specifies the base <span class="code">enum </span>used to create the EDT.</td>
</tr>
<tr>
<td colspan="1"><span class="label">FormatMST</span></td>
<td colspan="1">Real</td>
<td colspan="1">Specifies how to format master currency values.The following list contains the possible values for this property:</p>

*   Auto
*   Yes
*   No
<p>The default value is <span class="label">Auto </span>.</td>
</tr>
<tr>
<td colspan="1"><span class="label">NoOfDecimals</span></td>
<td colspan="1">Real</td>
<td colspan="1">Determines the number of decimals when a value displays on a form or a report.</td>
</tr>
<tr>
<td colspan="1"><span class="label">RotateSign</span></td>
<td colspan="1">IntegerInt64Real</td>
<td colspan="1">Choose this to negate the number, that is, change &#8211; to + and + to -.</td>
</tr>
<tr>
<td colspan="1"><span class="label">ShowZero</span></td>
<td colspan="1">IntegerInt64Real</td>
<td colspan="1">Specifies whether the value zero should be shown as an empty field.If the value zero in fields of this kind means null/nothing, ShowZero set to <span class="label">No </span>.</td>
</tr>
<tr>
<td colspan="1"><span class="label">SignDisplay</span></td>
<td colspan="1">IntegerInt64Real</td>
<td colspan="1">Specifies whether the sign of a number should be displayed, if it is a negative number, and also whether the sign should be before or after the number.Normally set to <span class="label">Auto </span>. Can be set to <span class="label">None </span>if they are used with <span class="label">DisplaceNegative </span>.</td>
</tr>
<tr>
<td colspan="1"><span class="label">StringSize</span></td>
<td colspan="1">String</td>
<td colspan="1">Specifies the maximum size of the string.</td>
</tr>
<tr>
<td colspan="1"><span class="label">ThousandSeparator</span></td>
<td colspan="1">Real</td>
<td colspan="1">Specifies the thousand separator.</td>
</tr>
<tr>
<td colspan="1"><span class="label">TimeFormat</span></td>
<td colspan="1">TimeUtcDateTime</td>
<td colspan="1">Specifies how times should be formatted.</td>
</tr>
<tr>
<td colspan="1"><span class="label">TimeHours</span></td>
<td colspan="1">TimeUtcDateTime</td>
<td colspan="1">Specifies whether hours should be included.</td>
</tr>
<tr>
<td colspan="1"><span class="label">TimeMinute</span></td>
<td colspan="1">TimeUtcDateTime</td>
<td colspan="1">Specifies whether minutes should be included.</td>
</tr>
<tr>
<td colspan="1"><span class="label">TimeSeconds</span></td>
<td colspan="1">TimeUtcDateTime</td>
<td colspan="1">Specifies whether seconds should be included.</td>
</tr>
<tr>
<td colspan="1"><span class="label">TimeSeparator</span></td>
<td colspan="1">TimeUtcDateTime</td>
<td colspan="1">Specifies the separator that must be used when displaying times.</td>
</tr>
<tr>
<td colspan="1"><span class="label">TimezonePreference</span></td>
<td colspan="1">UtcDateTime</td>
<td colspan="1">Specifies the time zone that the value should be converted to from Coordinated Universal Time (UTC).For more information, see [Form Control Properties ](http://msdn.microsoft.com/en-us/library/aa845161.aspx).</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>