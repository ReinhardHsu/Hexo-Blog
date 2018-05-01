---
title: Dynamics AX 2012 R2 SSRS报表在VS2010中预览没有数据
categories:
- Microsoft Dynamics AX
tags:
  - Microsoft Dynamics AX
date: 2015-09-28 17:35:12
---

[<font face="微软雅黑">![Unnamed QQ Screenshot20150928115305](http://reinhardhsu.com/wp-content/uploads/2015/09/Unnamed-QQ-Screenshot20150928115305_thumb.jpg "Unnamed QQ Screenshot20150928115305")</font>](http://reinhardhsu.com/wp-content/uploads/2015/09/Unnamed-QQ-Screenshot20150928115305.jpg)<font face="微软雅黑"> </font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 今天，</font>[<font face="微软雅黑">Reinhard</font>](http://reinhardhsu.com/)<font face="微软雅黑"> 在VS中制作SSRS报表，预览的时候发现显示不出数据。 </font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 仔细检查了数据处理环节和临时表里的数据，都发现没有问题。 </font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 用同事的账号登陆同样的开发环境，发现他的账号可以在VS中预览到数据。 </font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 很诡异欸，</font>[<font face="微软雅黑">Reinhard</font>](http://reinhardhsu.com/)<font face="微软雅黑"> 就觉得是权限问题，难道他是付费玩家，权限比我高么？ </font>
<p>[<font face="微软雅黑">Reinhard</font>](http://reinhardhsu.com/)<font face="微软雅黑"> 试着将报表部署到AX中，报表在AX中可以显示数据。 </font>
<p>[<font face="微软雅黑">Reinhard</font>](http://reinhardhsu.com/)<font face="微软雅黑"> 突然想到，会不会是</font>[<font face="微软雅黑">Reinhard</font>](http://reinhardhsu.com/)<font face="微软雅黑"> 在AX中设置的默认账套的问题呢？因为这个报表其实是分账套的，在</font>[<font face="微软雅黑">Reinhard</font>](http://reinhardhsu.com/)<font face="微软雅黑"> 的默认账套中，是没有数据的。 </font>
<p>[<font face="微软雅黑">![Image(14)](http://reinhardhsu.com/wp-content/uploads/2015/09/Image14_thumb.png "Image(14)")</font>](http://reinhardhsu.com/wp-content/uploads/2015/09/Image14.png)<font face="微软雅黑"> </font>
<p>[<font face="微软雅黑">Reinhard</font>](http://reinhardhsu.com/)<font face="微软雅黑"> 试着将AX的默认启动公司账户，改为有数据的那个账套，再在VS中预览报表，数据已经显示出来了。 </font>
<p><font face="微软雅黑"></font>

<font face="微软雅黑"></font>
