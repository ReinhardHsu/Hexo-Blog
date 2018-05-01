---
title: Dynamics AX 2012 R2 Install An Additional AOS
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-21 16:38:16
---

众所周知，AX系统分为三层：**Client**，**Application Server**，**Database Server**。

我们添加额外的**Application Server**主要是出于以下两个原因：

*   使用多台服务器，分担不同的角色（如批处理任务，报表，服务）。
*   增加基础架构的弹性。

AX中的集群服务器，并不依托于Windows服务器，而是通过自己的技术实现的。它可以提高性能，但没有提高可用性。当一台服务器挂了，客户端会失去连接，任何正在处理的任务都会被回滚。重启客户端后，会连接到集群中的另一台服务器。

<span id="more-162"></span>

1、安装额外的应用服务器

1.1、首先设置权限

*   在新应用服务器（**MSDynAX_ApplicationServer**）上，将你的**Domain Account**（**MSDynAX\Reinhard**）添加到本地管理员组。
*   将你的**Domain Account**（**MSDynAX\Reinhard**）添加为**MSSQL**的管理员。

这样权限就设置好了。

1.2、获取数据库信息

进入**System administration&gt;Inquiries&gt;Database&gt;Database Information**。

[![Screenshot201501211527145](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot201501211527145.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot201501211527145.jpg)

这里我们可以得到**Database Server**的**Database Name**（**MicrosoftDynamicsAX**）和**Database Server Name**（**MSDynAX_DatabaseServer**）。

1.3、安装AOS

运行AX安装程序，选择**Application Object Server(AOS)**，下一步。

输入刚刚获取到的**Database Name**（**MicrosoftDynamicsAX**）和**Database Server Name**（**MSDynAX_DatabaseServer**）,下一步。

[![Screenshot20150121153245](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121153245.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121153245.jpg)

输入本AOS实例的名称和端口，保持默认即可，下一步。

[![Screenshot20150121153343](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121153343.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121153343.jpg)

&nbsp;

设置**AOS**的运行账户。这里，我使用前面分配好权限的**Domain Account**：**MSDynAX\Reinhard**。下一步，开始安装。

[![Screenshot20150121153504](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121153504.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121153504.jpg)

&nbsp;

安装完毕后，服务会自动运行，需要等几分钟。

1.4、配置客户端登陆参数

打开**控制面板&gt;管理工具&gt;Microsoft Dynamics AX 2012 Configuration**。

在配置中选择**Original**，点击**Manage** Button，选择**Create configuration**。

[![Screenshot20150121160808](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121160808.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121160808.jpg)

&nbsp;

在弹出的窗口中，输入**Configuration name**：**MSDynAX_ApplicationServer**，点击**OK**。

[![Screenshot20150121161141](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121161141.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121161141.jpg)

&nbsp;

点击编辑，输入咱们刚刚创建的**实例名称**，和**服务器名**。

[![Screenshot20150121161959](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121161959.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121161959.jpg)

&nbsp;

点击确定，保存配置，退出配置工具。这样就设置好了。

打开客户端，进入**System Administration&gt;Common&gt;User&gt;Online Users**，查看在线用户。

[![Screenshot20150121145435](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121145435.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121145435.jpg)

我们可以发现，在**AOS Instance Name**中，有一个叫做**01@MSDynAX_ApplicationServer**的。至此新的应用服务器已经可以使用。
