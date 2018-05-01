---
title: Dynamics AX 2012 R2 IIS WebSite Unauthorized 401
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-14 16:25:11
---

今天部署好**Aif Customer Service** ，打开http://host:port/MicrosoftDynamicsAXAif60/，发现提示以下错误：

> 401 &#8211; Unauthorized: Access is denied due to invalid credentials
>
> 401 &#8211; 未授权: 由于凭据无效，访问被拒绝。
>
> 您无权使用所提供的凭据查看此目录或页面。

[![Screenshot20150114155447](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150114155447.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150114155447.jpg)

我们都知道，AX使用的**Windows Authentication**方式。出现上面的错误的原因，是因为IIS中的Windows身份认证没有启用。

首先进入**Server Manager&gt;Roles&gt;Web Server(IIS)**中，查看**Windows Authentication**是否安装。如果没有安装，需要安装。

[![Screenshot20150114160730](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150114160730.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150114160730.jpg)

安装完毕后，进入到**IIS管理器&gt;Authentication**。

[![Screenshot20150114161849](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150114161849.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150114161849.jpg)

将**Windows Authentication**设为**Enable**。

[![Screenshot20150114162144](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150114162144.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150114162144.jpg)

现在，重新打开站点，已经可以正常访问了。

&nbsp;

&nbsp;
