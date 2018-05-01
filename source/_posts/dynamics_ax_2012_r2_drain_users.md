---
title: Dynamics AX 2012 R2 Drain Users
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-22 09:13:33
---

有时，你想执行一些操作，但是这些操作必须让所有用户都登出后才能执行，例如加强安全设置，创建虚拟公司等。这时，你可以使用系统的**消耗用户**（**Darin Users**）功能。

进入**System Administration&gt;Common&gt;Users&gt;Online Users**。

点击**Server Instances**标签页。

选中要消耗用户的服务器实例，点击**Reject New Clients**。

在弹出窗体中，点击**OK**。


[![Screenshot20150122082925](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150122082925.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150122082925.jpg)

服务器实例的**Status**会由**Alive**变成**Draining**。

[![Screenshot20150122083120](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150122083120.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150122083120.jpg)

用户的客户端会弹出这样的提醒：

> The administrator is shutting down the Application Object Server.You must save your work and log off.If your user session is idle,you will be logged off automatically.
>
> 管理员即将关闭应用程序对象服务器。您必须保存您的工作并注销。如果您的用户会话处于空闲状态，则您将被自动注销。

[![Screenshot20150122083209](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150122083209.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150122083209.jpg)

当**AOS**实例处于**Draining**时，所有新打开的客户端都不能登陆到这个实例。如果这时你把你的客户端关闭了，你也不不能登陆到这个实例了。除非你重启**AOS**实例，或者当前在线的其他管理员点击**Accept New Clients**。

[![Screenshot20150122092341](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150122092341.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150122092341.jpg)

如果一个会话空闲超过2分钟，服务器也会强制关闭该会话。系统管理员不会被强制关闭。

如果你想强制关闭一个客户端会话，进入**Client Sessions**标签页。选中你要关闭的会话，点击**End Sessions**。

[![Screenshot20150122083836](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150122083836.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150122083836.jpg)

等你处理完了所有的操作，就要点击**Accept New Clients**，将**AOS**实例的**Status**，由**Draining**变为**Alive**，让新打开的客户端可以登录到该实例。当服务器实例重启后，**Status**也会自动变成**Alive**。

如果要进行一些跟数据库有关的操作，最好将所有链接到该数据库的AOS实例都停掉再进行。
