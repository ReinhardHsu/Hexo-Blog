---
title: Dynamics AX 2012 R2 客制化RDP报表参数对话框
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-27 16:07:59
---

当我们在使用**RDP报表**时，**AX**会根据**Data Contract**，自动生成**报表参数对话框**上的**字段控件**。一般情况下，该对话框能够满足我们的需求，但是如果有较为复杂或特殊的需求，就要我们对该对话框进行客制化。

**Reinhard**这里就有一张报表，需要使用**员工编号**作为参数。但是**AX**系统中默认的**员工编号EDT**，没有提供**lookup方法**。**Reinhard**将该**员工编号EDT**放在报表参数窗体上后，只能手工录入员工编号，不能通过下拉框进行选择。

默认效果是这样：

[![Screenshot20150127160448](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150127160448.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150127160448.jpg)

但是**Reinhard**想要的效果是这样：

[![Screenshot20150127160544](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150127160544.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150127160544.jpg)

**Reinhard**经过不断地研究，发现**AX**提供了一种可以**客制化报表参数对话框字段控件**的技术——**SysOperation Framework**。如果你也和**Reinhard**一样，想要改变自动生成的对话框上的字段，就可以使用该框架。

**SysOperation Framework**提供了一个**SysOperationAutomaticUIBuilder**类，通过继承该类，可以在系统基于我们**服务操作**的**数据契约**来生成对话框的过程中，添加自己的逻辑。一般包括以下业务逻辑：

*   设置字段控件的属性，如**强制**和**启用**
*   覆盖字段控件的方法，如**lookup()**和**modifiedField()**
*   覆盖**addDialogField()**方法，阻止控件被添加

如果你有大量的控件要使用**UI Builder**添加到对话框中，取而代之，可以考虑在**控制器**中使用**模板窗体**。

如果你在**UI Builder**中有大量的验证代码，取而代之，可以考虑在**数据契约**中实现验证。这样做，是为了遵循**MVC**哲学。

先来看看**Reinhard**的**DataContract**：

```c#
[DataContractAttribute]
public class Reinhard@reinhardhsu.com_DataContract
{
    HcmPersonnelNumberId hcmPersonnelNumberId;
}

[DataMemberAttribute('HcmPersonnelNumberId')]
public HcmPersonnelNumberId parmHcmPersonnelNumberId(HcmPersonnelNumberId 
	_hcmPersonnelNumberId=hcmPersonnelNumberId)
{
    hcmPersonnelNumberId=_hcmPersonnelNumberId;
    return HcmPersonnelNumberId;
}
```

**Reinhard**的**DataContract**中，只有一个属性——**员工编号**。想在报表参数对话框中，为该字段控件添加**lookup方法**。下面创建**UI Builder**类：

```c#
class Reinhard@reinhardhsu.com_UIBuilder extends SysOperationAutomaticUIBuilder
{
    DialogField hcmPersonnelNumberIdField;
}

public void hcmPersonnelNumberIdLookUp(FormStringControl _control)
{
    HcmWorkerLookup lookup=HcmWorkerLookup::newWorkersInCurrentCompany();
    lookup.lookupWorker(_control);
}

public void build()
{
    super();
    hcmPersonnelNumberIdField=this.bindInfo().getDialogField(
    	this.dataContractObject(),
    	methodStr(HPRN_1416_DC,parmHcmPersonnelNumberId)
    );
}

public void postRun()
{
    super();
    hcmPersonnelNumberIdField.registerOverrideMethod(
    methodStr(FormStringControl,lookup),
        methodStr(HPRN_1416_UIBuilder,hcmPersonnelNumberIdLookUp),
    this);
}
```

可以看到，**Reinhard**的**UI Builder**中的第一个方法，是用于覆盖**员工编号字段控件**的**lookup()方法**。

第二个方法，获取到**员工编号字段控件**。

第三个方法，将我们的第一个方法，**注册**到字段控件的**lookup()方法**上。

最后，**Reinhard**修改**Data Contract**的声明：

```c#
[DataContractAttribute,
SysOperationContractProcessingAttribute(
classStr(Reinhard@reinhardhsu.com_UIBuilder))]
public class Reinhard@reinhardhsu.com_DataContract
{
    HcmPersonnelNumberId hcmPersonnelNumberId;
}
```

其他部分依然遵循**RDP**报表的开发方式，不变。至此，打开报表参数对话框上的员工编号字段控件，已经有了下拉效果。
