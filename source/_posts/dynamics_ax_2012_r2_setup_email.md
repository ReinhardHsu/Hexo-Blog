---
title: Dynamics AX 2012 R2 为AX设置E-Mail
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-23 12:00:48
---

恰当地使用**E-Mail**，可以使系统看起来更专业，对用户更友好。AX中主要有两种发送**E-Mail**的方法：**SMTP**和**MAPI**。

**MAPI**（**Messaging Application Programming Interface**），是一个**Client-Side**方法，它在你的本机**E-Mail**客户端（例如**Outlook**）上，打开一个新的消息，用**AX**里的数据设置好了接收者和主题。**MAPI**也可以发送报表之类的附件。

<span id="more-213"></span>

如果以远程应用的方式运行**AX**客户端时，使用**MAPI**会出现问题。

**SMTP**（**Simple Mail Transfer Protocol**）是一个**Server-Side**方法，用于服务器生成**E-Mail**，例如提醒和工作流通知。

**SMTP**服务器端邮件的一个优势是，可以使用**HTML模板**。

**SMTP**需要一个**邮件服务器**，如**Microsoft Exchange**。

1、进入**System Administrator&gt;Setup&gt;System&gt;E-mail Parameters**。

2、基于你**SMTP服务器**的配置，填写。**Outgoing Mail Server**的值，要设置成**SMTP服务器**的完整域名或IP。

3、如果指定了**Outgoing Mail Server**，**Local Computer Name**就不用填。

4、录入**User Name** 和** Password**。

5、如果你选中**Use NTLM**，你就不能录入用户名和密码。如果代码在服务器层运行，它会使用AX服务器的安全上下文。如果在客户端层运行，它会使用用户的安全上下文。

6、**Attachment size limit(MB)**用于防止用户附件文件的大小，超过邮件系统允许的大小。