---
title: Dynamics AX 2012 R2 Install Dynamics AX Aif IIS Web Service
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 09:55:12
---

**1、为什么使用IIS上的WEB服务 组件？**

如果你要在Dynamics AX Service中使用HTTP Adapter，那么你就要安装**IIS上的WEB服务** 组件。HTTP Adapter会在IIS中生成一个Web Service。

**2、安装IIS上的WEB服务 组件**

下面讲讲怎么安装**IIS上的WEB服务** 组件。在服务器上，启动AX安装程序，选择**添加或修改组件**，选中**IIS上的Web服务**，下一步安装。

<span id="more-11"></span>

[![install](http://reinhardhsu.com/wp-content/uploads/2015/01/install.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/install.jpg)

安装完毕后，会在在AX的**系统管理&gt;服务和应用集成框架&gt;网站** 中，添加了一个站点，

[![site](http://reinhardhsu.com/wp-content/uploads/2015/01/site.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/site.jpg)

并在服务器上IIS的默认站点下，添加一个名为**MicrosoftDynamicsAXAif60**的应用。

[![iis](http://reinhardhsu.com/wp-content/uploads/2015/01/iis.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/iis.jpg)

该应用的路径为**C:\Program Files\Microsoft Dynamics AX\60\AifWebServices\**，网址为**http://host:port/MicrosoftDynamicsAXAif60/**。

以后，AX的Web Service会安装到这里该路径和网址下。

**3、修复MicrosoftDynamicsAXAif60**

如果你在启用HTTP Adapter的AIF服务时，收到如下信息：

> “The deployment web site was not found for port: XXXX”

3.1、那么有两种可能：

*   你当前的服务器没有安装**IIS上的WEB服务** 组件 。这种情况，可以参照上面的安装步骤进行安装。
*   如果运行AX安装程序，发现已经安装过该服务了，可能是安装被覆盖导致的。当你将没有安装**IIS上的WEB服务** 组件的备份数据，还原到已经安装**IIS上的WEB服务** 组件** **的服务器时，就会造成**IIS上的WEB服务** 组件已经安装，但无法使用的情况。

&nbsp;

3.2、以下是修复步骤：

安装 **IIS上的WEB服务** 组件。如果已经安装过，可以跳过。

确认IIS的默认站点中，已经建立 **MicrosoftDynamicsAXAif60 **应用**。**默认由安装程序建立，还原不会造成该应用被删除。

确认AX中**系统管理&gt;服务和应用集成框架&gt;网站**，添加好了**MicrosoftDynamicsAXAif60**站点。如果将没有安装**IIS上的WEB服务** 组件的备份数据，还原到已经安装**IIS上的WEB服务** 组件** **的服务器时，会删除 **MicrosoftDynamicsAXAif60 **站点。如果没有该站点，那么就手工添加它。点击**新建**按钮，输入**名称**，**虚拟路径**（如“\\HostName\MicrosoftDynamicsAXAif60”），**URL**（“http://HostName:Port/MicrosoftDynamicsAXAif60”）。然后点击**验证**，如果提示成功，关闭窗口即可。

如果在启用HTTP Adapter的AIF服务时，依然报权限错误，那么要检查**C:\Program Files\Microsoft Dynamics AX\60\AifWebServices\** 路径的权限。

需要确保该文件夹有以下三个权限：

*   **Microsoft Dynamics AX Web Service Administrators**
*   **IIS_IUSRS**
*   **NETWORK SERVICE**

[![safe](http://reinhardhsu.com/wp-content/uploads/2015/01/safe.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/safe.jpg)

文件夹共享权限：

*   **Microsoft Dynamics AX Web Service Administrators**
*   **Authenticated Users**
*   **NETWORK SERVICE**

[![share](http://reinhardhsu.com/wp-content/uploads/2015/01/share.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/share.jpg)

&nbsp;
