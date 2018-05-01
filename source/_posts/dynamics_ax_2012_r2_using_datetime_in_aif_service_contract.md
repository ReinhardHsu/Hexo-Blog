---
title: Dynamics AX 2012 R2 Using DateTime In AIF Service Contract
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-06-27 11:18:15
---

<a name="5011">
<p>![Unnamed QQ Screenshot20150627103313[4]](http://reinhardhsu.com/wp-content/uploads/2015/06/Unnamed-QQ-Screenshot201506271033134.jpg "Unnamed QQ Screenshot20150627103313[4]")
<p></a>&nbsp;&nbsp;&nbsp; [Reinhard](http://reinhardhsu.com/)在AIF中使用DateTime作为服务契约的参数，与DotNet程序进行交互时，总是因为时区的问题，导致DotNet提交的System.DateTime与AIF中接收的DateTime 不一致。
<p>&nbsp;&nbsp;&nbsp; 这个问题着实困扰了[Reinhard](http://reinhardhsu.com/) 许久。为了解决这个问题，[Reinhard](http://reinhardhsu.com/)这次专门写一篇博文，通过一系列的实验，找到通过AIF服务契约，对DateTime进行存储、获取、比较的最佳方式。
<p>**1、DateTime存储实验**
<p>&nbsp;&nbsp;&nbsp; 在AX中，[Reinhard](http://reinhardhsu.com/)写了三个存储DateTime方法，分别测试了System.DateTime和UtcDateTime作为服务契约参数的不同情况。这三个服务契约如下：

<table cellspacing="0" cellpadding="2" width="498" border="5">
<tbody>
<tr>
<td valign="top" width="488">

[SysEntryPointAttribute]
<p>**public** **void** saveSystemDateTime(System.DateTime _dt)
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>**&nbsp;&nbsp;&nbsp; ttsBegin**;
<p>&nbsp;&nbsp;&nbsp; table.UtcDateTime=_dt;
<p>&nbsp;&nbsp;&nbsp; table.insert();
<p>**&nbsp;&nbsp;&nbsp; ttsCommit**;
<p>}
<p>[SysEntryPointAttribute]
<p>**public** **void** saveSystemDateTime2(System.DateTime _dt)
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>**&nbsp;&nbsp;&nbsp; ttsBegin**;
<p>&nbsp;&nbsp;&nbsp; table.UtcDateTime=Global::clrSystemDateTime2UtcDateTime( _dt);
<p>&nbsp;&nbsp;&nbsp; table.insert();
<p>**&nbsp;&nbsp;&nbsp; ttsCommit**;
<p>}
<p>[SysEntryPointAttribute]
<p>**public** **void** saveUtcDateTime( **utcDateTime** _utcDateTime)
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>**&nbsp;&nbsp;&nbsp; ttsBegin**;
<p>&nbsp;&nbsp;&nbsp; table.UtcDateTime=_utcDateTime;
<p>&nbsp;&nbsp;&nbsp; table.insert();
<p>**&nbsp;&nbsp;&nbsp; ttsCommit**;
<p>}

</td>
</tr>
</tbody>
</table>

<p>&nbsp;&nbsp;&nbsp; 接着，在VS中，[Reinhard](http://reinhardhsu.com/)调用这三个服务契约，分别存储三个不同的System.DateTime实例，看哪个服务契约能够正确地存储DateTime。这三个日期分别是：

<table cellspacing="0" cellpadding="2" width="498" border="5">
<tbody>
<tr>
<td valign="top" width="488">

DateTime saveSystemDateTimeDT = new DateTime(2013, 3, 3, 3, 3, 3);
<p>DateTime saveSystemDateTime2DT = new DateTime(2014, 4, 4, 4, 4, 4);
<p>DateTime saveUtcDateTimeDT = new DateTime(2015, 5, 5, 5, 5, 5);

</td>
</tr>
</tbody>
</table>

<p>&nbsp;&nbsp;&nbsp; 调用完毕后，到AX中，查看ReinhardTest_Table中保存的日期。
<p>![Image[4]](http://reinhardhsu.com/wp-content/uploads/2015/06/Image4.png "Image[4]")
<p>&nbsp;&nbsp;&nbsp; [Reinhard](http://reinhardhsu.com/)发现，只有SaveUtcDateTime这个服务契约，正确保存了DotNet中System.DateTime的值。
<p>**结论**：正确的日期存储方式是SaveUtcDateTime。
<p>**2、DateTime对比实验**
<p>&nbsp;&nbsp;&nbsp; 在AX中，[Reinhard](http://reinhardhsu.com/)写了两个比较DateTime方法，分别测试了System.DateTime和UtcDateTime作为服务契约参数的不同情况。这两个服务契约如下：

<table cellspacing="0" cellpadding="2" width="600" border="5">
<tbody>
<tr>
<td valign="top" width="600">

[SysEntryPointAttribute]
<p>**public** **boolean** compareUtcDateTime(**utcDateTime** _utcDateTime)
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>**&nbsp;&nbsp;&nbsp; select** table **order** **by** table.UtcDateTime **desc**;
<p>**&nbsp;&nbsp;&nbsp; return** table.UtcDateTime==_utcDateTime;
<p>}
<p>[SysEntryPointAttribute]
<p>**public** **boolean** compareSystemDateTime(System.DateTime _dt)
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>**&nbsp;&nbsp;&nbsp; utcDateTime** dt= Global::clrSystemDateTime2UtcDateTime(_dt);
<p>**&nbsp;&nbsp;&nbsp; select** table **order** **by** table.UtcDateTime **desc**;
<p>**&nbsp;&nbsp;&nbsp; return** table.UtcDateTime==dt;
<p>}

</td>
</tr>
</tbody>
</table>

<p>&nbsp;&nbsp;&nbsp; 这里，[Reinhard](http://reinhardhsu.com/)选择了ReinhardTest_Table表中的最后一条记录，进行比较，也就是2015-05-05 05:05:05那条。
<p>&nbsp;&nbsp;&nbsp; 接着，在VS中，[Reinhard](http://reinhardhsu.com/)调用这两个服务契约，与同一个System.DateTime实例做比较，这个DateTime是：
<p>DateTime saveUtcDateTimeDT = new DateTime(2015, 5, 5, 5, 5, 5);
<p>&nbsp;&nbsp;&nbsp; 这个DateTime其实就是[Reinhard](http://reinhardhsu.com/)在第一个实验中，最后一个保存的那个DateTime。不出意外的话，它应该与ReinhardTest_Table表中的最后一条记录是等价的。那么，我们来看看调用的结果吧。
<p>![Image [1]](http://reinhardhsu.com/wp-content/uploads/2015/06/Image-1.png "Image [1]")
<p>&nbsp;&nbsp;&nbsp; [Reinhard](http://reinhardhsu.com/)发现，只有CompareUtcDateTime这个服务契约，正确比较了DotNet中System.DateTime与AX中UtcDateTime的值。
<p>**&nbsp;&nbsp;&nbsp; 结论**：正确的日期比较方式是CompareUtcDateTime。
<p>**3、DateTime获取实验**
<p>&nbsp;&nbsp;&nbsp; 在AX中，[Reinhard](http://reinhardhsu.com/)写了七个获取DateTime方法，分别测试了System.DateTime和UtcDateTime作为服务契约返回值的不同情况。这七个服务契约如下：

<table cellspacing="0" cellpadding="2" width="600" border="5">
<tbody>
<tr>
<td valign="top" width="600">

[SysEntryPointAttribute]
<p>**public** **utcDateTime** getUtcDateTime()
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>**&nbsp;&nbsp;&nbsp; select** table **order** **by** table.UtcDateTime **desc**;
<p>**&nbsp;&nbsp;&nbsp; return** table.UtcDateTime;
<p>}
<p>[SysEntryPointAttribute]
<p>**public** **utcDateTime** getUtcDateTime2()
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>**&nbsp;&nbsp;&nbsp; select** table **order** **by** table.UtcDateTime **desc**;
<p>**&nbsp;&nbsp;&nbsp; return** DateTimeUtil::applyTimeZoneOffset(table.UtcDateTime ,DateTimeUtil::getUserPreferredTimeZone());
<p>}
<p>[SysEntryPointAttribute]
<p>**public** **utcDateTime** getUtcDateTime3()
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>**&nbsp;&nbsp;&nbsp; str** strDT;
<p>**&nbsp;&nbsp;&nbsp; select** table **order** **by** table.UtcDateTime **desc**;
<p>**&nbsp;&nbsp;&nbsp; return** DateTimeUtil::applyTimeZoneOffset(table.UtcDateTime ,DateTimeUtil::getCompanyTimeZone());
<p>}
<p>[SysEntryPointAttribute]
<p>**public** System.DateTime getSystemDateTime()
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>**&nbsp;&nbsp;&nbsp; select** table **order** **by** table.UtcDateTime **desc**;
<p>**&nbsp;&nbsp;&nbsp; return** table.UtcDateTime;
<p>}
<p>[SysEntryPointAttribute]
<p>**public** System.DateTime getSystemDateTime2()
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>**&nbsp;&nbsp;&nbsp; select** table **order** **by** table.UtcDateTime **desc**;
<p>**&nbsp;&nbsp;&nbsp; return** DateTimeUtil::removeTimeZoneOffset(table.UtcDateTime,DateTimeUtil::getCompanyTimeZone());
<p>}
<p>[SysEntryPointAttribute]
<p>**public** System.DateTime getSystemDateTime3()
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>&nbsp;&nbsp;&nbsp; System.DateTime dt;
<p>**&nbsp;&nbsp;&nbsp; utcDateTime** utcDT;
<p>**&nbsp;&nbsp;&nbsp; select** table **order** **by** table.UtcDateTime **desc**;
<p>&nbsp;&nbsp;&nbsp; utcDT=DateTimeUtil::removeTimeZoneOffset(table.UtcDateTime,DateTimeUtil::getCompanyTimeZone());
<p>&nbsp;&nbsp;&nbsp; dt=Global::utcDateTime2SystemDateTime(utcDT);
<p>**&nbsp;&nbsp;&nbsp; return** dt;
<p>}
<p>[SysEntryPointAttribute]
<p>**public** System.DateTime getStringDateTime4()
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>**&nbsp;&nbsp;&nbsp; str** strDT;
<p>**&nbsp;&nbsp;&nbsp; select** table **order** **by** table.UtcDateTime **desc**;
<p>&nbsp;&nbsp;&nbsp; strDT = DateTimeUtil::toStr(table.UtcDateTime);
<p>**&nbsp;&nbsp;&nbsp; return** System.DateTime::Parse(strDT);
<p>}

</td>
</tr>
</tbody>
</table>

&nbsp;&nbsp;&nbsp; 这里，[Reinhard](http://reinhardhsu.com/)同样选择了ReinhardTest_Table表中的最后一条记录，将其返回给DotNet，也就是2015-05-05 05:05:05那条。
<p>&nbsp;&nbsp;&nbsp; 接着，在VS中，[Reinhard](http://reinhardhsu.com/)调用这七个服务契约，看看他们返回给DotNet的Date
Time：
<p>![Image [2]](http://reinhardhsu.com/wp-content/uploads/2015/06/Image-2.png "Image [2]")
<p>&nbsp;&nbsp;&nbsp; [Reinhard](http://reinhardhsu.com/)发现，只有GetUtcDateTime2和GetUtcDateTime3这个两个服务契约，给DotNet返回了正确的DateTime。
<p>**结论**：正确的日期获取方式是GetUtcDateTime2和GetUtcDateTime3。
<p>**4、总结**
<p>&nbsp;&nbsp;&nbsp; 下面，[Reinhard](http://reinhardhsu.com/)对通过AIF服务契约，进行DateTime存储、获取、比较的正确方式，进行总结。
<p>**4.1、DateTime存储**

<table cellspacing="0" cellpadding="2" width="600" border="5">
<tbody>
<tr>
<td valign="top" width="600">

[SysEntryPointAttribute]
<p>**public** **void** saveUtcDateTime( **utcDateTime** _utcDateTime)
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>**&nbsp;&nbsp;&nbsp; ttsBegin**;
<p>&nbsp;&nbsp;&nbsp; table.UtcDateTime=_utcDateTime;
<p>&nbsp;&nbsp;&nbsp; table.insert();
<p>**&nbsp;&nbsp;&nbsp; ttsCommit**;
<p>}

</td>
</tr>
</tbody>
</table>

<p>**4.2、DateTime对比**

<table cellspacing="0" cellpadding="2" width="600" border="5">
<tbody>
<tr>
<td valign="top" width="600">

[SysEntryPointAttribute]
<p>**public** **boolean** compareUtcDateTime( **utcDateTime** _utcDateTime)
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>**&nbsp;&nbsp;&nbsp; select** table **order** **by** table.UtcDateTime **desc**;
<p>**&nbsp;&nbsp;&nbsp; return** table.UtcDateTime==_utcDateTime;
<p>}

</td>
</tr>
</tbody>
</table>

<p>**4.3、DateTime获取**

<table cellspacing="0" cellpadding="2" width="600" border="5">
<tbody>
<tr>
<td valign="top" width="600">

[SysEntryPointAttribute]
<p>**public** **utcDateTime** getUtcDateTime2()
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>**&nbsp;&nbsp;&nbsp; select** table **order** **by** table.UtcDateTime **desc**;
<p>**&nbsp;&nbsp;&nbsp; return** DateTimeUtil::applyTimeZoneOffset(table.UtcDateTime ,DateTimeUtil::getUserPreferredTimeZone());
<p>}
<p>[SysEntryPointAttribute]
<p>**public** **utcDateTime** getUtcDateTime3()
<p>{
<p>&nbsp;&nbsp;&nbsp; ReinhardTest_Table table;
<p>**&nbsp;&nbsp;&nbsp; str** strDT;
<p>**&nbsp;&nbsp;&nbsp; select** table **order** **by** table.UtcDateTime **desc**;
<p>**&nbsp;&nbsp;&nbsp; return** DateTimeUtil::applyTimeZoneOffset(table.UtcDateTime ,DateTimeUtil::getCompanyTimeZone());
<p>}

</td>
</tr>
</tbody>
</table>

<p>&nbsp;&nbsp;&nbsp; 这次，[Reinhard](http://reinhardhsu.com/)就分享到这里。如果同学们遇到什么问题，也欢迎和[Reinhard](http://reinhardhsu.com/)沟通交流。
