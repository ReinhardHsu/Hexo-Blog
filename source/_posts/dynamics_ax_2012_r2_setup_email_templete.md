---
title: Dynamics AX 2012 R2 配置E-Mail模板
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-23 15:48:10
---

在AX中使用邮件模板可以，可以让邮件的内容更专业化。

<span id="more-219"></span>

1.  进入**Organization Administration&gt;Setup&gt;E-mail Templates**
2.  选中**Show System E-Mails**。选中后，可以为整个系统（**DAT Company**）设置邮件模板。如果不选中，是为当前公司设置邮件模板。
3.  录入必要的信息。
4.  点击**E-Mail Message**，打开**HTML**编辑器，编辑邮件模板。
5.  [![Screenshot20150123152752](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150123152752.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150123152752.jpg)
6.  关闭并保存模板。
7.  要测试该邮件模板，进入**System Administration&gt;Periodic&gt;E-mail Processing&gt;E-mail Broadcast**。
8.  将**E-mail ID**设为我们的邮件模板。如果这里没有你创建的邮件模板，说明你创建模板的时候，没有选中**Show System E-mails**。
9.  选择用户，点击**OK**。

[![Screenshot20150123154039](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150123154039.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150123154039.jpg)

稍等一会儿，就**邮件客户端**就收到一封邮件。

[![Screenshot20150123154621](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150123154621.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150123154621.jpg)
