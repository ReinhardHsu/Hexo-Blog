---
title: Dynamics AX 2012 R2 MorphX Concepts
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 15:04:37
---

<span id="goog-gtc-unit-55" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">反复出现在MorphX开发中的一些核心的面向对象的机制和条件。下面将对他们中最重要的部分进行简要说明。</span></span>

<span id="more-53"></span>

<div class="tableSection">
<table>
<tbody>
<tr>
<th colspan="1"><span id="goog-gtc-unit-56" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">MorphX中的概念</span></span></th>
<th colspan="1"><span id="goog-gtc-unit-57" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">它是什么？它​​是如何工作的？</span></span></th>
</tr>
<tr>
<td colspan="1"><span id="goog-gtc-unit-58" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr"> System class </span></span></td>
<td colspan="1"><span id="goog-gtc-unit-59" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">MorphX中定义的一个功能接口。例如，创建或运行一个表单这样的功能。</span></span></td>
</tr>
<tr>
<td colspan="1"><span id="goog-gtc-unit-60" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-tm goog-gtc-from-tm-score-100" dir="ltr">Class</span></span></td>
<td colspan="1"><span id="goog-gtc-unit-61" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">定义一个对象的接口。</span></span><span id="goog-gtc-unit-62" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">类指示或说明了如何构建一个特定类型的对象。</span></span><span id="goog-gtc-unit-63" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">类的基本特征是，你可以创建一个类的新实例（对象）。</span></span></p>

<span id="goog-gtc-unit-64" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">窗体是类的一个例子。</span></span><span id="goog-gtc-unit-65" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">MorphX中有一个类定义，描述了在创建表单对象时，究竟会发生什么。</span></span></td>
</tr>
<tr>
<td colspan="1"><span id="goog-gtc-unit-66" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Controls</span></span></td>
<td colspan="1"><span id="goog-gtc-unit-67" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">一个你在设计窗体或报表时，放在上面的图形对象，如文本框，复选框，命令按钮，或矩形。用他们来显示数据报告，执行操作或使窗体或报表更容易阅读。</span></span></td>
</tr>
<tr>
<td colspan="1"><span id="goog-gtc-unit-68" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Data Source </span></span></td>
<td colspan="1"><span id="goog-gtc-unit-69" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">窗体或查询用来持有数据的变量。</span></span><span id="goog-gtc-unit-70" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">这些数据变量可以是一个或多个表，或者它们可以是表中的各个字段。</span></span></td>
</tr>
<tr>
<td colspan="1"><span id="goog-gtc-unit-71" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Designs </span></span></td>
<td colspan="1"><span id="goog-gtc-unit-72" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">提供对窗体或报表布局定义的访问。</span></span></td>
</tr>
<tr>
<td colspan="1"><span id="goog-gtc-unit-73" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Encapsulation(封装)</span></span></td>
<td colspan="1"><span id="goog-gtc-unit-74" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">将系统的中数据隐藏在一个方法中，并且只能通过该方法来改变。</span></span></td>
</tr>
<tr>
<td colspan="1"><span id="goog-gtc-unit-75" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Final </span></span></td>
<td colspan="1"><span id="goog-gtc-unit-76" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">一个类或方法的修饰符，它定义了该类或方法不能扩展（覆盖）。</span></span></td>
</tr>
<tr>
<td colspan="1"><span id="goog-gtc-unit-77" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Inheritance(继承)</span></span></td>
<td colspan="1"><span id="goog-gtc-unit-78" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">MorphX中的一个中心概念。这意味着你在一个元素定义中定义的东西，可以被该元素的扩展元素继承。</span></span><span id="goog-gtc-unit-79" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">一个继承层次结构的例子是，你自己的方法可以扩展MorphX中定义的方法。在代码中，这是由超级引用指示。</span></span></td>
</tr>
<tr>
<td colspan="1"><span id="goog-gtc-unit-80" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Method </span></span></td>
<td colspan="1"><span id="goog-gtc-unit-81" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">你告诉一个对象要做的任务。</span></span><span id="goog-gtc-unit-82" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">方法可以在几个层次上进行编程：</span></span>

*   <span id="goog-gtc-unit-83" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">作为表的一部分</span></span>
*   <span id="goog-gtc-unit-84" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">作为表单的一部分</span></span>
*   <span id="goog-gtc-unit-85" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">作为一个阶级的一部分</span></span>

<span id="goog-gtc-unit-86" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">窗体的方法可以涉及：</span></span>

*   <span id="goog-gtc-unit-87" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">窗体的一般管理，如运行该窗体，或者关闭它</span></span>
*   <span id="goog-gtc-unit-88" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">在窗体中显示的数据，如删除，或将数据写入</span></span>
*   <span id="goog-gtc-unit-89" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">窗体控件，比如移动光标</span></span>
*   <span id="goog-gtc-unit-90" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">作为查询的一部分</span></span>
*   <span id="goog-gtc-unit-91" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">作为一般的类库的一部分</span></span>

<span id="goog-gtc-unit-92" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">最初，该方法仅用来激活的MorphX的方法（通过<span class="code"> super() </span>调用指示的）。</span></span>

<span id="goog-gtc-unit-93" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">在一个方法中，您可以：</span></span>

*   <span id="goog-gtc-unit-94" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">将代码添加到该方法的主要操作执行之前。</span></span>
*   <span id="goog-gtc-unit-95" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">自己写方法，或者让MorphX处理它（通过<span class="code">super()</span>调用）。</span></span>
*   <span id="goog-gtc-unit-96" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">添加一段代码，在该方法中的主操作执行后执行。</span></span>
</td>
</tr>
<tr>
<td colspan="1"><span id="goog-gtc-unit-97" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Object </span></span></td>
<td colspan="1"><span id="goog-gtc-unit-98" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">MorphX中的核心概念。</span></span><span id="goog-gtc-unit-99" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">任何窗体或控件都是一个对象。</span></span><span id="goog-gtc-unit-100" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">数据库也是一个对象。</span></span><span id="goog-gtc-unit-101" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">对象是从类创建的。</span></span><span id="goog-gtc-unit-102" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">对象是类的实例。</span></span></p>

<span id="goog-gtc-unit-103" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">对象提供了一个约定和合乎逻辑的方式，来组织程序和数据。</span></span><span id="goog-gtc-unit-104" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">对象是经过封装了的，这意味着它们同时包含他们的代码和它们的数据。</span></span>

<p><span id="goog-gtc-unit-105" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">要使用一个对象，你必须在一个对象变量中保持对它的引用。</span></span></td>
</tr>
<tr>
<td colspan="1"><span id="goog-gtc-unit-106" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Property </span></span></td>
<td colspan="1"><span id="goog-gtc-unit-107" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">属性是描述对象的数据。</span></span><span id="goog-gtc-unit-108" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">每种类型的对象有不同的类型的属性。</span></span><span id="goog-gtc-unit-109" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">一种方法，通常只有几个属性，其中一个定义了它的运行时间。</span></span><span id="goog-gtc-unit-110" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">相反，一个控件经常具有约50的属性，来定义它的位置，大小，颜色，等等。</span></span></td>
</tr>
<tr>
<td colspan="1"><span id="goog-gtc-unit-111" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Query </span></span></td>
<td colspan="1"><span id="goog-gtc-unit-112" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-mt" dir="ltr">查询是一种过滤机制来检索你想从你的数据库表中看到的数据。</span></span><span id="goog-gtc-unit-113" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">查询通常用作窗体和报表的记录源。</span></span></td>
</tr>
<tr>
<td colspan="1"><span id="goog-gtc-unit-114" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">Workspace </span></span></td>
<td colspan="1"><span id="goog-gtc-unit-115" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">开发工作区包含Microsoft Dynamics AX应用程序开发工具。</span></span><span id="goog-gtc-unit-116" class="goog-gtc-unit"><span class="goog-gtc-translatable goog-gtc-from-human" dir="ltr">应用程序工作区是用来为最终显示客户端的。</span></span></td>
</tr>
</tbody>
</table>
</div>