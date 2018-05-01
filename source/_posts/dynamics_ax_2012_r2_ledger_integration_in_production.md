---
title: Dynamics AX 2012 R2 Ledger Integration in Production
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-04-16 15:41:37
---

不像采购、销售和库存中的总账交易，生产中的总账交易必须包含字资源工序的成本，该成本用于计算成品物料的库存价值。

<span id="more-288"></span>

## 1、生产控制参数

在生产参数的**Ledger posting**字段控制着总账集成，包含下面的选项：

*   **Item and resource**
*   **Item and category**
*   **Production groups**

### 1.1、Item and  Resource

如果选中该项，库存记账设置中的指定的主要科目，会应用到物料交易。对于资源工序，主要的科目设置在资源的总账标签页。

### 1.2、物料和分类

如果选中了该项，库存记账设置中指定的主要科目，会应用到物料交易。对于资源工序，在成本分类中设置。（Production control&gt;Setup&gt;Routes&gt;Cost categories,tab Ledger-resources）。

### 1.3、生产组

如果选中了该项，会应用记账组中的主要会计科目。（Production control&gt;Setup&gt;Production&gt;Production groups）。

生产组在生产订单和会计科目之间建立了一种关系。将每个生产组附加到默认的过账模板。默认的过账模板决定如何将该组中的生产订单的交易记录过账到分类账。

#### 1.3.1、生产池

还有一个叫做生产池的概念。生产池是一种为生产订单分组的方式。例如，可以通过以下方式使用这些类别：

*   作为内部批注系统
*   创建包含紧急或优先级最高的生产订单池
*   对生产信息进行排序或筛选

## 2、生产中的总账交易

当处理一个生产订单时，下面的总账交易会被过账给主要的科目（基于上面的总账过账参数）：

*   **Picking list**
*   **Resource operation**
*   **Report as finished**

### 2.1、关于生产日志

生产订单日志记录了在使用生产订单时发生的不同物料交易记录。这些物料交易记录对公司的财务记录具有直接影响。当过账某一生产日志时，所有物料交易记录都将自动转移到总账中。

*   **领料单**：该日志用于记录从库存取出的原材料
*   **工艺卡**：该日志记录工艺路线消耗量
*   **作业卡**：该日志用于记录，在使用作业卡时，消耗的运营资源。
*   **完工入库**：该日志是所有已完成的物料的记录。