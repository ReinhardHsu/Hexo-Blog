---
title: Dynamics AX 2012 R2 The Inventory module
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-02-25 16:27:39
---

## 理解主要的类层次结构

### InventMovement类

**InventMovement**类用于验证和准备数据，这些数据用于生成库存交易记录。在这个层次结构中，**Super**类是叫做**InventMovement**的抽象类。在这个层次结构中的所有其他类，都以InventMov_前缀开头。

例如，在处理**Sales line transactions**时，**InventMov_Sales**类用于验证和准备库存。在处理库存转移日记账时，使用**InventMov_Transfer**。

### InventUpdate类

**InventUpdate**类用于插入和更新库存交易。每当一个交易应该被过账时，**InventUpdate**相应的子类的**updateNow()**方法都会执行。在这个层次结构中，**Super**类是**InventUpdate**类，这个结构中的其他类是以**InventUpd_**前缀开头。

例如，每当在系统中输入一个物料行，代表着将来会生成一个物理交易，都会使用**InventUpd_Estimated**类。它可以是，例如，一个销售订单行，有在单销售状态。当一个这样的行在**AX**中被输入或生成，**InventUpd_Estimated**类会被触发，库存交易。。。

### InventAdj类

每当库存交易调整时，会使用**InventAdj**类。典型的调整发生在，你关闭库存时。

### InventSum类

**InventSum**类用于查看特定物料在特定日期的现有量信息。**InventOnHand**类用于查看当前的现有量信息。**InventSum**类不像之前的类，它没有在一个层次结构中。

## 使用Inventory dimensions

你马上不得不学的，是库存维度如何工作。基本的，**InventDim**表持有与一个物料相关联的所有不同维度的信息。这些维度可以被派生为三个类型：**Item**，**Storage**，和**Tracking**维度。默认地，**AX**有下面的维度：

*   四个**Item**维度：这些维度是**Color**,**Size**,**Style**和**Configuration**。
*   六个**Storage**维度：这些维度是**Size**,**Warehouse**,**Location**,**Pallet**（托盘）,**Inventory status**,和**License plate**(号码牌，车辆的牌照)。
*   五个**Tracking**维度：分别是**Batch**,**Serial**,**Owner**,**Inventory Profile**,和**GTD**号码。

基于配置键的启用，系统中会看到大量的维度编号。

### 查找库存维度

当在日记账中或交易中需要这些维度的结合时，我们总是查看是否已经存在该结合。如果有，我们将该日记账或交易记录连接到**InventDim**表。如果它不存在，就在**InventDim**新建一个，接着，我们连接到新纪录。这是通过使用**InventDim**表中的一个叫做**findOrCreate**的方法做的。你可以看看在下面的代码中是如何使用它的：

```c#
static void MSDynAX.Net_ReinhardTestJob1(Args _args)
{
    InventDim inventDim;
    inventDim.InventLocationId='01';
    inventDim.InventColorId='02';
    inventDim=InventDim::findOrCreate(inventDim);
    info(inventDim.inventDimId);
}
```

### 查找当前现有量信息

你要知道的另一个事情，是如何查找在一个特定**InventDim**范围里，有多少物料可用。你可以通过将**InventDim**字段转换成一个**InventDim**变量，然后指定要使用哪个维度字段或维度字段的结合，用于获取现有量信息。在下面的例子中，我们搜索一个特定颜色的物料的现有量信息。

```c#
static void MSDynAX.Net_ReinhardTestJob1(Args _args)
{
    ItemId          itemId;
    InventDim       inventDimCriteria;
    InventDimParm   inventDimParm;
    InventOnhand    inventOnhand;
    itemId='10001';
    //inventdimcriteria.InventColorId=&#8217;02&#8217;;
    //inventdimparm.initFromInventDim(inventDimCriteria);
    inventOnhand=inventOnhand::newItemId(itemId);
    inventOnhand.parmInventDim(inventDimCriteria);
    //inventOnhand.parmInventDimParm(inventDimParm);
    inventOnhand.parmItemId(itemId);
    info(strfmt('Available Physical:%1',inventOnhand.availPhysical()));
    info(strfmt('On order:%1',inventonhand.onOrder()));
}
```

你也可以在**inventDimCriteria**的**InventLocationId**指定仓库。

### 查找特定日期的现有量信息

下面的例子让你可以查看特定颜色的特定物料，在特定日期的现有量信息。

```c#
static void MSDynAX.Net_ReinhardTestJob1(Args _args)
{
    ItemId          itemId;
    InventDim       inventDimCriteria;
    InventDimParm   inventDimParm;
    InventSumDateDim    inventSumDateDim;
    
    itemId='10001’;
    //inventdimcriteria.InventColorId=&#8217;02&#8217;;
    //inventdimparm.initFromInventDim(inventDimCriteria);
    inventSumDateDim = InventSumDateDim::newParameters(mkDate(01,01,2015), 
                                                       itemId, 
                                                       inventDimCriteria,
                                                       inventDimParm);
    info(strfmt('PostedQty:%1',inventSumDateDim.postedQty()));
    info(strfmt('DeductedQty:%1',inventSumDateDim.deductedQty()));
    info(strfmt('ReceivedQty:%1',inventSumDateDim.receivedQty()));
}
```

### 从代码中创建并过账一个库存日记账

下面，要学习如何自动创建并过账日记账。典型的，当执行数据迁移时，可以使用该方法。

```c#
static void MSDynAX.Net_ReinhardTestJob1(Args _args)
{
    InventJournalName  inventJournalName;
    InventJournalTable inventJournalTable;
    InventJournalTrans inventJournalTrans;
    InventJournalTableData inventJournalTableData;
    inventJournalTransData inventJournalTransData;
    InventTable            inventTable;
    InventDim              inventDim;
    
    select firstonly inventTable;
    select firstOnly inventJournalName
    	where inventJournalName.JournalType==InventJournalType::Movement;
    
    inventJournalTable.clear();
    inventJournalTable.initValue();
    inventJournalTable.initFromInventJournalName(inventJournalName);
    inventJournalTable.insert();
    inventJournalTableData=JournalTableData::newTable(inventJournalTable);
    inventJournalTrans.clear();
    inventJournalTrans.initFromInventJournalTable(inventJournalTable);
    inventJournalTrans.TransDate=systemDateGet();
    inventJournalTrans.initFromInventTable(inventTable);
    inventJournalTrans.Qty=3;
    inventDim.initFromInventTable(inventJournalTrans.inventMovement()
                                  .inventTable(),
                                  InventItemOrderSetupType::Invent,inventDim);
    inventDim=InventDim::findOrCreate(inventDim);
    inventJournalTrans.InventDimId=inventDim.inventDimId;
    inventJournalTransData=inventJournalTableData.journalStatic()
        .newJournalTransData(inventJournalTrans,inventJournalTableData);
    inventJournalTransData.create();
    if(InventJournalCheckPost::newPostJournal(inventJournalTable).validate())
    	InventJournalCheckPost::newPostJournal(inventJournalTable).run();
}

```