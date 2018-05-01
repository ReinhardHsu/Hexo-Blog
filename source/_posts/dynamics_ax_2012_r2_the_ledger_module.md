---
title: Dynamics AX 2012 R2 The Ledger module
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-03-30 16:32:39
---

总账模块，是AX中控制和存储所有的财务交易的地方。所有连接到总账模块的其他模块，都是以Money Central的方式在AX中体现。

总账模块的主要实体是Ledger表，它由Chart Of Accounts（会计科目）构成。另外，Transaction表，和其他与Ledger表相关的其他表，你需要理解他们的关联关系。

<span id="more-281"></span>

下面的简单描述与Ledger实体相关的表：

<table border="0" width="400" cellspacing="0" cellpadding="2">
<tbody>
<tr>
<td valign="top" width="200">表名</td>
<td valign="top" width="200">描述</td>
</tr>
<tr>
<td valign="top" width="200">Ledger</td>
<td valign="top" width="200">该表包含总账会计的定义</td>
</tr>
<tr>
<td valign="top" width="200">GeneralJournalAccountEntry</td>
<td valign="top" width="200">该表包含总账实体的信息</td>
</tr>
<tr>
<td valign="top" width="200">GeneralJournalEntry</td>
<td valign="top" width="200">该表包含像过账层，交易日期这样的交易元数据</td>
</tr>
<tr>
<td valign="top" width="200">SubledgerVoucherGeneralJournalEntry</td>
<td valign="top" width="200">该表将子分类账凭证链接到总分类账实体</td>
</tr>
<tr>
<td valign="top" width="200">LedgerEntry</td>
<td valign="top" width="200">该表包含总分类账银行交易信息</td>
</tr>
</tbody>
</table>

## 过账分类账交易

这里有两种方式过账分类账交易：

*   **分类账日记账**：输入日期到日记账，并使用LedgerJournalCheckPost类过账该日记账。
*   **分类账凭证**：创建一个凭证（LedgerVoucherObject）的列表，并使用LedgerVoucher类过账它们。

## 录入并过账一个LedgerJournal类

要过账一个分类账交易的简单方法，是使用LedgerJournal类。这与以前的章节讲的，给库存日记账填充数据，然后从代码中过账该日记账一样。

在下面的例子中，我们会给LedgerJournalTable和LedgerJournalTrans填充数据，然后使用LedgerJournalCheckPost类过账该日记账：

&nbsp;

录入并过账一个LedgerVoucher类

使用LedgerVoucher类过账总账交易，意味着你首先要创建凭证，然后过账他们。这是处理总账交易过账的传统方式。

你可以给LedgerVoucher对象添加多个凭证（LedgerVoucherObject）。对于每个凭证，你典型的有两个交易（LedgerVoucherTransObject），一个是debit（借方、收方），一个是credit（贷方）。在一个凭证中，你当然可以有多个交易，但他们必须兼容。这意味着如果你添加的所有的借方交易的金额和所有的贷方交易的金额，结果必须是0。

当所有的交易都已经添加到一个凭证中，并且所有的凭证都已经被添加到LedgerVoucher对象，你可以简单地钓友ledgerVoucher.end()方法，来验证并过账凭证。代码如下：