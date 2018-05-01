---
title: Dynamics AX 2012 R2 Reporting Deploy Auth Error
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-14 15:22:57
---

今天，在我 Deploy AX Reporting时，发生权限错误。

> 配置 ID: HOSTMSSQLSERVER
>
> 描述: HOST@MSSQLSERVER
>
> 默认值: True
>
> 报表服务器名称: HOST
>
> 报表服务器实例名称: MSSQLSERVER
>
> 报表服务器文件夹名称: DynamicsAX
>
> 报表服务器管理器 URL: http://HOST/Reports
>
> 报表服务器 Web 服务 URL: http://HOST/ReportServer
>
> 应用程序对象服务器名称:
>
> SharePoint 已集成: False
>
> 部署已中止。您不具备部署到服务器的权限: HOST。对于部署，您必须对 SQL Server Reporting Services (SSRS)服务器具有管理权限。请与您的管理员联系以进行部署。

[![Screenshot20150114151809](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150114151809.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150114151809.jpg)

[![Screenshot20150114151929](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150114151929.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150114151929.jpg)

&nbsp;

这是因为我没有报表服务器的权限。将我的账号添加进入到服务器的Administrator Group，即可解决。

&nbsp;
