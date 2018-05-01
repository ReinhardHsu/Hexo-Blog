---
title: Dynamics AX 2012 R2 通过数据源保存记录时触发的方法
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-08-06 10:33:33
---

<table cellspacing="0" cellpadding="2" width="600" border="5">
<tbody>
<tr>
<td valign="top" width="138">[<font size="3" face="微软雅黑">![Image](http://reinhardhsu.com/wp-content/uploads/2015/08/Image_thumb.png "Image")</font>](http://reinhardhsu.com/wp-content/uploads/2015/08/Image.png)</td>
<td valign="top" width="462">

<font size="3"><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 我们都知道，在窗体上保存记录时，会像在表上保存时一样，触发很多方法。这里</font>[<font face="微软雅黑">Reinhard</font>](http://reinhardhsu.com)<font face="微软雅黑">找到了一个流程图，看看都触发了哪些方法，并且这些方法是以怎样的顺序被触发的。</font></font><font face="微软雅黑"> </font>

1.  <font size="3" face="微软雅黑">窗体上数据源的Validate()方法被调用。 </font>
<li><font size="3" face="微软雅黑">当Validate()方法里的Super()被调用时，该表的ValideField()&nbsp; 方法会被每个字段调用。 </font>
<li><font size="3" face="微软雅黑">Vlidate()方法里，Super()下面的代码被调用。 </font>
<li><font size="3" face="微软雅黑">窗体上数据源的ValidateWrite()方法被调用。 </font>
<li><font size="3" face="微软雅黑">当ValidateWrite()方法中的Super()被调用时，该表上的ValideWrite()方法会被调用。 </font>
<li><font size="3" face="微软雅黑">窗体数据源的ValidateWrite()方法中，Super()下面的代码被调用。 </font>
<li><font size="3" face="微软雅黑">窗体的Write()方法被调用。 </font>
<li><font size="3" face="微软雅黑">当Write()方法的Super()被调用时，该表的Insert()方法被调用。 </font>
<li><font size="3" face="微软雅黑">窗体的Write()方法中，Super()下面的方法被调用。</font>
</td>
</tr>
</tbody>
</table>
<p><font size="3" face="微软雅黑"></font>

<font face="微软雅黑"></font>
