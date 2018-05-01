---
title: Dynamics AX 2012 R2 Accounts Payable modules
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-03-30 17:41:18
---

在AX中，Account Receivable（AR）和Accounts Payable（AP）模块是很相似的。从一方面将，你有客户和销售订单，另一方面，你有供应商和采购订单。本章的例子只讲AR模块，但是将其应用到AP是没有问题的。

下面你会看到，这两边的表很相似，在AOT中使用了table map的公共级别。这是使得作为开发者的你，写一个类，就能简单地同时处理AR和AP，你可以引用table map，而不用写两个类。

## 实体架构——基本的数据和订单

实体架构显示了AR和AP模块中，基本数据是如何相互关联的。它也显示了AR和AP模块中的公共字段，被放入map中。

架构很简单，下面的表简短地描述了实体架构中的表：

<table border="0" width="400" cellspacing="0" cellpadding="2">
<tbody>
<tr>
<td valign="top" width="200">表名</td>
<td valign="top" width="200">描述</td>
</tr>
<tr>
<td valign="top" width="200">CustGroup</td>
<td valign="top" width="200">该表包含客户组。所有客户必须指定一个CustGroup值。该组包含像默认支付条款和结算周期。</td>
</tr>
<tr>
<td valign="top" width="200">VendGroup</td>
<td valign="top" width="200">该表包含供应商组的定义</td>
</tr>
<tr>
<td valign="top" width="200">CustTable</td>
<td valign="top" width="200">该表包含客户，用于AR和客户关系管理。</td>
</tr>
<tr>
<td valign="top" width="200">VendTable</td>
<td valign="top" width="200">该表包含用于AP的供应商。</td>
</tr>
<tr>
<td valign="top" width="200">SalesTable</td>
<td valign="top" width="200">该表包含所有的销售订单头，无论是否已经过账</td>
</tr>
<tr>
<td valign="top" width="200">PurchTable</td>
<td valign="top" width="200">该表包含所有的采购订单头，无论是否已经过账</td>
</tr>
<tr>
<td valign="top" width="200">SalesLine</td>
<td valign="top" width="200">该表包含所有的销售订单行，无论是否已经过账</td>
</tr>
<tr>
<td valign="top" width="200">PurchLine</td>
<td valign="top" width="200">该表包含所有的采购订单行，无论是否已经过账</td>
</tr>
</tbody>
</table>

## 实体架构——交易

该交易实体架构显示了客户和供应商交易如何链接到结算表和总账交易，这些表如何关联到总账维度。

下面的表给了一个简短的描述：

<table border="0" width="400" cellspacing="0" cellpadding="2">
<tbody>
<tr>
<td valign="top" width="200">表名</td>
<td valign="top" width="200">描述</td>
</tr>
<tr>
<td valign="top" width="200">CustTrans</td>
<td valign="top" width="200">该表包含客户已过帐的交易信息</td>
</tr>
<tr>
<td valign="top" width="200">VendTrans</td>
<td valign="top" width="200">该表包含该供应商已过帐的交易信息</td>
</tr>
<tr>
<td valign="top" width="200">CustSettlement</td>
<td valign="top" width="200">该表包含与结算或反结算这两个交易相关的信息。</td>
</tr>
<tr>
<td valign="top" width="200">VendSettlement</td>
<td valign="top" width="200">该表包含结算或反结算这两个交易相关的信息。</td>
</tr>
</tbody>
</table>
