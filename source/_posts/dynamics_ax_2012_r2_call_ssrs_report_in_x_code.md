---
title: Dynamics AX 2012 R2 Call SSRS Report In X++ Code
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-15 17:43:56
---

平时，我们制作的Report的方法主要有两种：使用Query或RDP。如果需要为报表传递参数，就要在代码中为报表参数赋值，然后在代码中调用报表。下面我总结下这两种报表在代码中传参和调用的方式：

1、使用Query作为报表数据源

1.1、**Dynamic Filters**属性

在VS中，需要注意**Report DataSource**的**Dynamic Filters**属性。

1.1.1、如果**Dynamic Filters**属性为**True**的话，会在**Report Parameter**中生成一个叫做**DS_DynamicParameter**的参数。

[![Screenshot20150115171132](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150115171132.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150115171132.jpg)并在Report **Preview**时，生成一个**Select** Button，用于配置**Report Parameter**。

[![Screenshot20150115171743](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150115171743.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150115171743.jpg)

1.1.2、如果**Dynamic Filters**属性为**False**的话，会将**AOT Query Range**中的参数，一个一个添加到**Report Parameter**中。比如我的**AOT Query Range**中有**4**个**Parameter**，那么在**Report Parameter**中就自动添加四个相应的参数：

[![Screenshot20150115170919](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150115170919.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150115170919.jpg)

并在Report **Preview**时，生成**4**个**TextBox**，用于输入**Report Parameter**。

[![Screenshot20150115171918](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150115171918.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150115171918.jpg)

1.2、如何在X++ 代码中调用这种类型的报表

我这里将前面的**Dynamic Filters**属性为**False**。然后在代码中这样写：

```c#
SrsReportRunController controller;
controller=new SrsReportRunController();
controller.parmReportName(ssrsReportStr(YourSSRSReportName,YourReportDesignsName));
if(controller.parmReportContract().parmRdlContract())
{
    controller.parmReportContract().parmRdlContract()
            .setValue('DS_PersonnelNumber','PersonnelNumber01010101');
}
controller.parmDialogCaption('DialogCaption');
controller.startOperation();
```

2、RDP Report

如果使用RDP报表，也将之前提到的Dynamic Filters属性设为False。然后在代码中这样写：

```c#
SrsReportRunController controller;
YourReportDataContract contract;
controller=new SrsReportRunController();
controller.parmReportName(ssrsReportStr(YourSSRSReportName, YourReportDesignsName));
contract=controller.parmReportContract().parmRdpContract() as YourReportDataContract;
contract.YourParameter('YourParameterValue010101101');
controller.parmDialogCaption('DialogCaption');
controller.startOperation();
```