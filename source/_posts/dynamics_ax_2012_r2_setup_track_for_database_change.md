---
title: Dynamics AX 2012 R2 为数据库配置变更跟踪
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-23 10:21:01
---

数据库变更跟踪处理，允许我们跟踪对记录或字段的变更，包括变更人信息。

数据库变更跟踪会添加到**AX**和**SQL**服务器中，所以我们应该跟踪必须的项目。一般处于管理需要，经常会跟踪这些项目：

<span id="more-206"></span>

*   供应商的银行账户，尤其是使用电子银行的情况下。
*   客户信用限制
*   客户信用卡变更
*   客户价格组
*   BOM审核
*   Route审核

1、进入到**System Administration&gt;Setup&gt;Database&gt;Database log setup**。

2、在数据库日志设置窗体，点击新建按钮。

3、在**Logging database changes**想到中，选择下一步。

4、展开**General Ledger Group**，选中**Customers**。

5、展开**Customers**表，选择要跟踪的字段。

[![Screenshot20150123095636](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150123095636.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150123095636.jpg)

6、在**Types of Change**面板中，你可以选中要跟踪的类型。

[![Screenshot20150123100609](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150123100609.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150123100609.jpg)

7、下一步，完成。
