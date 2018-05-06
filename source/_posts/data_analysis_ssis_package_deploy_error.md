---
title: Data Analysis SSIS 包部署错误 0xC0010014
date: 2017-02-09 11:13:39
categories:
- Data Analysis
tags:
- Data Analysis
- SSIS
---

[Reinhard](http://reinhardhsu.com/p/cnblogs.com/msdynax) 在部署 SSIS 包时，提示如下错误。

*由于错误 0xC0010014“发生了一个或多个错误。在此消息之前应有更为具体的错误消息，对这些错误进行详细说明。此消息用作遇到错误的函数的返回值。”，无法加载包。当 CPackage::LoadFromXML 失败时，会出现这种情况。*

*程序位置:*

在 Microsoft.DataTransformationServices.DTSExecUI.Controls.GeneralViewCtrl.GetPackage()

*由于错误 0xC0010014“发生了一个或多个错误。在此消息之前应有更为具体的错误消息，对这些错误进行详细说明。此消息用作遇到错误的函数的返回值。”，无法加载包。当 CPackage::LoadFromXML 失败时，会出现这种情况。*

*程序位置:*

*在 Microsoft.SqlServer.Dts.Runtime.Wrapper.ApplicationClass.LoadPackage(String FileName, Boolean loadNeutral, IDTSEvents100 pEvents)*
*在 Microsoft.SqlServer.Dts.Runtime.Application.LoadPackage(String fileName, IDTSEvents events, Boolean loadNeutral)*

从网上的资料可以知道，应该是SSDT与SSIS的版本兼容问题。

[Reinhard](http://reinhardhsu.com/p/cnblogs.com/msdynax) 使用的是SQL Server 2016 提供的 [SQL Server Data Tools (16.5)](https://docs.microsoft.com/en-us/sql/ssdt/download-sql-server-data-tools-ssdt) ，而 SSIS 环境还是 SQL Server 2008 R2。从微软文档上得知，SSDT 16.5 开发的 SSIS 包，是不支持在 SSIS 2008 上部署的。

## SQL Server Data Tools (16.5) Supported SQL versions

| Project Templates                                  | SQL Platforms Supported                                      |
| -------------------------------------------------- | ------------------------------------------------------------ |
| Relational databases                               | SQL Server 2005* - SQL Server 2016 Azure SQL DatabaseAzure SQL Data Warehouse (supports queries only; database projects are not yet supported)* SQL Server 2005 support is deprecated,please move to an officially supported SQL version |
| Analysis Services modelsReporting Services reports | SQL Server 2008 – SQL Server 2016                            |
| Integration Services packages                      | SQL Server 2012 – SQL Server 2016                            |

既然如此，选择下列方案中的一个，即可解决：

1. 升级SSIS环境
2. 或者降级SSDT。