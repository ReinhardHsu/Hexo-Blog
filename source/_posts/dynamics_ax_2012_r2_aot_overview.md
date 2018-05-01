---
title: Dynamics AX 2012 R2 AOT Overview
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 14:46:33
---

<span id="goog-gtc-unit-54" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Microsoft Dynamics AX中，应用程序对象树（AOT）包含所有用于构建Microsoft Dynamics AX的元素，如类，表，窗体，等等的定义。</span></span><span id="goog-gtc-unit-55" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">本主题提供了AOT的概述，并定义了顶级节点。</span></span>

<span id="goog-gtc-unit-56" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">要创建在AOT中的新元素，用鼠标右键单击相关的节点，然后单击<span class="label">新建</span> 。</span></span><span id="goog-gtc-unit-57" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">此外，拖动和拖放操作可用于多种元素。</span></span>

<span id="goog-gtc-unit-58" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">在顶级节点的所有元素都有：</span></span>

*   <span id="goog-gtc-unit-59" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">一个快捷菜单。</span></span><span id="goog-gtc-unit-60" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">打开快捷菜单，右键单击一个元素。</span></span><span id="goog-gtc-unit-61" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">欲了解更多信息，请参阅[快捷菜单命令：AOT](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2FEN-US%2Flibrary%2Faa846291.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNH2SrfPczjWhy87wahqlOLVASTgbw) 。</span></span>
*   <span id="goog-gtc-unit-62" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">属性。</span></span><span id="goog-gtc-unit-63" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">要查看某个元素的属性和属性值，请右键单击该元素，然后单击<span class="label">属性</span> 。</span></span><span id="goog-gtc-unit-64" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">显示<span class="label">属性</span>表。</span></span><span id="goog-gtc-unit-65" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">欲了解更多信息，请参阅[应用程序对象的属性](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2FEN-US%2Flibrary%2Faa593880.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFax8Pyh9MY1y8_ndZyQK_05zGGyQ) 。</span></span>

<span id="goog-gtc-unit-66" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">在AOT包含下表中描述的顶层节点。</span></span>

<span id="more-30"></span>

<div class="tableSection">
<table>
<tbody>
<tr>
<th colspan="1"><span id="goog-gtc-unit-67" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">节点</span></span></th>
<th colspan="1"><span id="goog-gtc-unit-68" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">描述</span></span></th>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-69" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Data Dictionary</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-70" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">包含那些组成数据库的数据类型和表。</span></span><span id="goog-gtc-unit-71" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">还包控制数据访问的对象。</span></span><span id="goog-gtc-unit-72" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">它包含以下子节点：</span></span></p>

<span id="goog-gtc-unit-73" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr"><span class="label">表</span> ：包含Microsoft Dynamics AX的数据表。</span></span>

<span id="goog-gtc-unit-74" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">映射</span> ：使您可以在密切相关（但不相同）的表字段和方法之间创建关联。</span></span>

<span id="goog-gtc-unit-75" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">视图</span> ：使您可以从不同的表联接的数据，然后选择要显示哪些字段。</span></span>

<span id="goog-gtc-unit-76" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">扩展数据类型</span> ：那些扩展自基本数据类型或另一个扩展数据类型的数据类型。</span></span>

<span id="goog-gtc-unit-77" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">基地枚举</span> ：枚举类型包含一个文字的列表。</span></span>

<span id="goog-gtc-unit-78" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">许可证代码</span> ：确定要提供给公司的Microsoft Dynamics AX的功能组件。</span></span>

<span id="goog-gtc-unit-79" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">配置键</span> ：允许管理员为所有用户启用或禁用应用程序中的功能。</span></span>

<span id="goog-gtc-unit-80" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">安全密钥</span> ：安全密钥在Microsoft Dynamics AX 2012中已经过时，只存在一个代码升级过程中使用以供参考。</span></span><span id="goog-gtc-unit-81" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">基于角色的安全，是一个新的安全架构。</span></span><span id="goog-gtc-unit-82" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">有关新的安全框架的更多信息，请参阅[最新消息：开发者安全性在Microsoft Dynamics AX 2012](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2FEN-US%2Flibrary%2Fgg843512.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNGjj7NovompNzMh9z5rmH4OWpbbaQ) ，并[在AOT为开发者基于角色的安全性](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2FEN-US%2Flibrary%2Fgg847971.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFH6Btn6aXDL8um7S15OjOLOdJGcg) 。</span></span>

<span id="goog-gtc-unit-83" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">表集合</span> ：一个数据表的集合，它包含那些总是在企业之间共享的数据。</span></span>

<span id="goog-gtc-unit-84" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"><span class="label">观点</span> ：我们用来为报表模型组织信息的表的集合。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-85" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Macros</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-86" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">包含用于标准应用的宏的源代码。</span></span><span id="goog-gtc-unit-87" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">除了查看现有的代码，你可以添加你自己的宏。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-88" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Classes</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-89" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">包含应用程序（X + +）类的源代码。</span></span>

<p><span id="goog-gtc-unit-90" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">您还可以使用系统类（也称为核心类）。</span></span><span id="goog-gtc-unit-91" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">它们被列在<span class="label">系统文档\类</span>节点。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-92" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Forms</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-93" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">用户界面的对话框，用于访问数据库。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-94" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Parts配件</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-95" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">包含您可以用于检索和显示数据集合的控件。</span></span><span id="goog-gtc-unit-96" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">欲了解更多信息，请参阅[部件](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2FEN-US%2Flibrary%2Fgg844683.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNGSTbaocAFTmVS4w9-7r9-YriF_VQ) 。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-97" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Data Sets</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-98" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">提供了一个通用的数据访问层，它允许外部表示层绑定到Microsoft Dynamics AX的表和数据类型。</span></span><span id="goog-gtc-unit-99" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">欲了解更多信息，请参见[数据集的企业门户](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2FEN-US%2Flibrary%2Fcc653218.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNFtXsZDRo8s5bwwQRpXS6MLWacqKg) 。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-100" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">SSRS Reports</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-101" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">包含Microsoft Dynamics AX中的SQL Server Reporting Services报表。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-102" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Reports</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-103" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">使用户能够从数据库中打印或显示摘要信息。</span></span></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-104" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Visual Studio Projects</span></span></span></td>
<td><span id="goog-gtc-unit-105" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">包含在Visual Studio中创建和使用应用程序浏览器添加到Microsoft Dynamics AX中的项目。</span></span><span id="goog-gtc-unit-106" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">可以添加到这个节点的项目类型包括Dynamics AX的示范项目，使用C Sharp项目，Visual Basic项目，Web应用程序项目，和Analysis Services项目。</span></span><span id="goog-gtc-unit-107" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">欲了解更多信息，请参见[Visual Studio集成](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2FEN-US%2Flibrary%2Fgg889299.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNESHp7y02zGbwQFAs0OpKGTY5tYsw)和[如何添加一个Visual Studio项目的AOT](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2FEN-US%2Flibrary%2Fgg889249.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNGAOSROkTLCroeo1bbY5TtQ8qaJMw) 。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-108" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Report Libraries</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-109" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">用于存储的Microsoft Dynamics AX 2009的正在升级为Microsoft Dynamics AX的2012 AOT环境中的SQL Server Reporting Services报表库。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-110" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Queries</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-111" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">作为对窗体和报表的记录源。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-112" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Jobs</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-113" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">通常认为，是用来测试新代码的小X + +程序。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-114" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Menus</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-115" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">包含您希望最终用户看到的菜单。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-116" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Menu Items</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-117" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">包含了可以在菜单中显示的菜单项的完整清单。</span></span><span id="goog-gtc-unit-118" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">菜单项充当一个更高的抽象层为窗体，报表，等等。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-119" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Web</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-120" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">包含关于Web开发的对象。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-121" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Services</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-122" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">包含由Microsoft Dynamics AX的公开的服务。</span></span></td>
</tr>
<tr>
<td><span class="label"><span id="goog-gtc-unit-123" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Service Groups</span></span></span></td>
<td><span id="goog-gtc-unit-124" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">包含经常食用和共同管理的服务的集合。</span></span><span id="goog-gtc-unit-125" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">服务组中的所有服务发表在一个单一的WSDL文件。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-126" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Workflow</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-127" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">包含用于创建工作流配置的工作流模型元素。</span></span><span id="goog-gtc-unit-128" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">此节点包含<span class="label">类别</span> ， <span class="label">任务</span> ， <span class="label">认证</span> ，和<span class="label">模板</span> 。</span></span><span id="goog-gtc-unit-129" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">欲了解更多信息，请参见[实施工作流程Microsoft Dynamics AX的](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2FEN-US%2Flibrary%2Fcc585061.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNHZ8VAQD1ylIN_0UdraR5vU9FEllQ) 。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-130" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Security</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-131" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">包含用于实现应用程序安全性的对象，如角色和权限。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-132" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Resources</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-133" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">包含引用的图像和动画文件。</span></span></td>
</tr>
<tr>
<td><span id="goog-gtc-unit-134" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"> Label Files </span></span></td>
<td><span id="goog-gtc-unit-135" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">包含为所有用户界面元素存储标签的标签文件。</span></span><span id="goog-gtc-unit-136" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">欲了解更多信息，请参见[标签编辑器](http://www.google.com/url?q=http%3A%2F%2Fmsdn.microsoft.com%2FEN-US%2Flibrary%2Faa617477.aspx&amp;sa=D&amp;sntz=1&amp;usg=AFQjCNHAxvb6ZV635xHApWBEH3VotgN4dw) 。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-137" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">References</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-138" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">包含对微软.NET程序集和到外部Web服务的引用。</span></span><span id="goog-gtc-unit-139" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">这两种类型的引用可以在X + +语句中使用。</span></span></td>
</tr>
<tr>
<td><span id="goog-gtc-unit-140" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"> Help Documentation Sets </span></span></td>
<td><span id="goog-gtc-unit-141" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">指定帮助服务器上​​的文档集。</span></span></td>
</tr>
<tr>
<td colspan="1"><span class="label"><span id="goog-gtc-unit-142" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">System Documentation</span></span></span></td>
<td colspan="1"><span id="goog-gtc-unit-143" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">包含表示系统（内核）类，函数，表，等项目。</span></span></td>
</tr>
</tbody>
</table>
</div>