---
title: Dynamics AX 2012 R2 设置报表服务器
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-02-10 03:27:16
---

今天**Reinhard**在使用报表的过程中，发现以下错误：

> The default Report Server Configuration ID could not be found in the SRSServers table.

<span id="more-264"></span>

[![Screenshot20150209140818](http://reinhardhsu.com/wp-content/uploads/2015/02/Screenshot20150209140818.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/02/Screenshot20150209140818.jpg)

**Reinhard**根据错误提示信息，推断这是由于AX的报表服务器配置不正确，所导致的。当发生下面几种情况之一时，我们需要调整或添加报表服务器配置：

*   **安装了一个新的AOS**：当你安装新AOS后，需要告诉该AOS，它应该使用哪个报表服务器。
*   **将报表服务器移动到了另一个物理主机**：在这种情况下，需要将所有AOS中的报表服务器指向，更新为新的位置。
*   **环境刷新**：一旦我们将生产环境还原到测试环境，我们需要调整报表服务器配置，指向适当的报表服务器。

下面我们进入**System Administration&gt;Setup&gt;Business Intelligence&gt;Reporting Services&gt;Report Servers**。

设置**Configuration ID**为**MSDynAXMSSQLSERVER**。

设置**Description**为**MSDynAXMSSQLSERVER**。

将**Server Name**设为报表服务器的**主机名**。我这里的**Host Name**是**MSDynAX**。

将**Server Instance Name**设为报表服务器的**实例名**。默认安装的**实例名**是**MSSQLSERVER**。

将**Report Manager URL**字段设为**SSRS**配置中设置的地址。默认地址是**http://Host Name/Reports**。我这里的地址是**http://MSDynAX/Reports**

将**Web Service URL**字段设为**SSRS**配置中设置的地址。默认地址是**http://Host Name/ReportServer**。我这里的地址是**http://MSDynAX/ReportServer**。

如果你以**SharePoint Integrated Mode**安装的**SSRS**，那么这里必须选中**SharePoint Integrated Mode**。

默认**Report Folder**为**DynamicsAX**。

将**Application Object Server**字段设为**当前AOS**的名字。我这里是**01@MSDynAX**。

最后点击**Validate Settings**，以验证配置。

[![Screenshot201502091419244](http://reinhardhsu.com/wp-content/uploads/2015/02/Screenshot201502091419244.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/02/Screenshot201502091419244.jpg)

&nbsp;
