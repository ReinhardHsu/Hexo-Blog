---
title: Microsoft Dynamics AX 7 新特性探索 – Demo 部署(Part 1)
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2016-05-31 23:29:54
---

### [![2016-06-01_01-10-46](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-06-01_01-10-46_thumb.jpg "2016-06-01_01-10-46")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-06-01_01-10-46.jpg)

<a name="11814"></a>    Dynamics AX 7已经发布了一段时间了，我们知道这次微软为我们带来了许多令人激动的新特性。在这个系列里，[Reinhard](http://reinhardhsu.com/)将揭开New Dynamics AX的神秘面纱，和大家一起探索这些新的特性。<span id="more-591"></span>

国际惯例，第一部分呢，还是说说怎么配置Demo环境吧。我们都知道，Dynamics AX 7 主要有两种部署模式，一种是由Dynamics Lifecycle Services提供的云环境部署，另一种是和之前版本一样的On-Premises的部署方式。从这个链接获取Demo环境：[Get an evaluation copy of Dynamics AX](https://ax.help.dynamics.com/en/wiki/get-an-evaluation-copy/)。

有条件的同学可以使用微软提供的云环境进行体验。

我这里采用On-Premises的部署方式，跟之前的版本一样，配置Hyper-V的虚拟机，进入系统，一切都异常得顺利。

打开[https://usnconeboxax1aos.cloud.onebox.dynamics.com](https://usnconeboxax1aos.cloud.onebox.dynamics.com/)，用自带的管理员账户administrator@contosoax7.onmicrosoft.com登录，提示以下错误：

_We don’t recognize this user ID or password_

_Be sure to type the password for your work or school account._

[![2016-06-01_00-18-22](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-06-01_00-18-22_thumb.jpg "2016-06-01_00-18-22")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-06-01_00-18-22.jpg)

自带的这个管理员账号已经不能使用了，需要使用自己的AAD账号。下面Reinhard先创建自己的Azure Active Directory。进入[https://manage.windowsazure.com](https://manage.windowsazure.com/)，点击**新建**。

[![2016-05-31_23-50-22](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-50-22_thumb.jpg "2016-05-31_23-50-22")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-50-22.jpg)

选中**Azure Active Directory**，**目录**，点击**自定义创建**。

[![2016-05-31_23-52-36](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-52-36_thumb.jpg "2016-05-31_23-52-36")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-52-36.jpg)

录入必要的信息，点击确定。

[![2016-05-31_23-54-14](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-54-14_thumb.jpg "2016-05-31_23-54-14")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-54-14.jpg)

如果命名没有冲突的话，Azure Active Directory就已经创建好了，下面开始添加用户。

[![2016-05-31_23-55-48](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-55-48_thumb.jpg "2016-05-31_23-55-48")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-55-48.jpg)

选择**管理访问权限**，**添加新用户**。

[![2016-06-01_00-20-23](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-06-01_00-20-23_thumb.jpg "2016-06-01_00-20-23")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-06-01_00-20-23.jpg)

选择用户类型，录入用户名，点击下一步。

[![2016-06-01_00-21-26](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-06-01_00-21-26_thumb.jpg "2016-06-01_00-21-26")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-06-01_00-21-26.jpg)

输入用户的详细信息，角色我这里选择**全局管理员**，点击下一步。

[![2016-06-01_00-22-52](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-06-01_00-22-52_thumb.jpg "2016-06-01_00-22-52")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-06-01_00-22-52.jpg)

系统会分配一个临时的密码，第一次登陆时会让你修改密码。

[![2016-06-01_00-23-52](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-06-01_00-23-52_thumb.jpg "2016-06-01_00-23-52")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-06-01_00-23-52.jpg)

[![2016-06-01_00-24-42](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-06-01_00-24-42_thumb.jpg "2016-06-01_00-24-42")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-06-01_00-24-42.jpg)

到这里，Azure Active Directory和用户都已经建好了。接下里啊，我们把刚建好的这个AAD用户，设置为Dynamics AX 7 的管理员。

以管理员身份，运行桌面上的那个**Dynamics administrator provisioning tool**，输入[reinhard@msdynax.onmicrosoft.com](mailto:reinhard@msdynax.onmicrosoft.com) ，点击提交。稍等片刻，就可以看到Dynamics AX 7 的管理员用户成功设为[reinhard@msdynax.onmicrosoft.com](mailto:reinhard@msdynax.onmicrosoft.com)了。

[![2016-05-31_23-43-08](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-43-08_thumb.jpg "2016-05-31_23-43-08")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-43-08.jpg)

接下来我们用[reinhard@msdynax.onmicrosoft.com](mailto:reinhard@msdynax.onmicrosoft.com)来登陆系统。

[![2016-05-31_23-02-52](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-02-52_thumb.jpg "2016-05-31_23-02-52")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-02-52.jpg)

第一次登陆的时候，提示需要更新密码，按照提示更新下密码。

少许等待，出现500错误：

_There is a problem with the server_

_Sorry, the server has encountered an error. It is either not available or it can’t respond at this time. Please contact your system administrator._

_500 Error_

[![2016-05-31_23-09-01](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-09-01_thumb.jpg "2016-05-31_23-09-01")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-09-01.jpg)

仔细阅读错误提示，应该是本机时间不在正常的误差范围内，导致的服务器不响应。

接下来我们更新下系统时间。我这里从互联网上的时间服务器那里同步本机时间，服务器列表里的第一个服务器地址我这里同步失败，但是time.nist.gov这个服务器地址可以同步成功。

[![2016-05-31_23-36-05](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-36-05_thumb.jpg "2016-05-31_23-36-05")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-36-05.jpg)

接下来[Reinhard](http://reinhardhsu.com/)重新登陆。

[![2016-05-31_23-44-52](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-44-52_thumb.jpg "2016-05-31_23-44-52")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-44-52.jpg)

[![2016-05-31_23-45-21](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-45-21_thumb.jpg "2016-05-31_23-45-21")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-45-21.jpg)

又收到如下错误提示：

You are not authorized to login with your current credentials.You will be redirected to the login page in a few seconds.

[![2016-05-31_23-46-20](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-46-20_thumb.jpg "2016-05-31_23-46-20")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-46-20.jpg)

[Reinhard](http://reinhardhsu.com/) 又重试了几次，终于成功进入到系统里面。

[![2016-05-31_23-48-51](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-48-51_thumb.jpg "2016-05-31_23-48-51")](http://reinhardhsu.com/wp-content/uploads/2016/06/2016-05-31_23-48-51.jpg)

本节我们主要了解了如何部署 Demo 环境，如何新建Azure Active Directory和用户。这次我们就先分享到这里。
