---
title: Dynamics AX 2012 的工业物联网解决方案
date: 2016-12-28 11:51:29
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
- IOT
---

## 物联网

物联网的概念在这两年非常火，包括近期很火的共享单车初创公司——摩拜单车，在产品中运用了[Azure Iot物联网](https://azure.microsoft.com/zh-cn/services/iot-hub/)技术。但是，物联网并不是一个新词汇，也没有特别深奥的含义，它的核心就是用网络将物品连接起来。这里的网络，可以是局域网，比如我们身边的公交卡、门禁卡、学校食堂的饭卡。也可以是互联网，比如上面说的摩拜单车。

这两年政府报告中一直在提互联网+的概念，所以大家印象中物联网就和互联网联系得比较紧密。

另一个在政府报告中常被提到，并且与物联网相关的概念，是工业4.0 ，甚至有人提出要在2025年弯道超车实现工业4.0。我们都知道，工业3.0是自动化、信息化，工业4.0是智能化、物联网。未来十年物联网相关的技术也一定会在工业领域被大量地应用。

与此同时，Dynamics AX在制造业有着大量的客户，所以，下一个风口浪尖微软自然也不愿错过，早早地就开始布局了。我们看到Dynamics 365的架构中，已经有了[Azure Iot物联网平台](https://azure.microsoft.com/zh-cn/services/iot-hub/)的身影。

![img](https://images2015.cnblogs.com/blog/453825/201612/453825-20161212112114042-1416242613.png)

## Dynamics AX 当下的工业物联网解决方案

这次[Reinhard](http://cnblogs.com/reinhard)先不讲最新的[Azure Iot](https://azure.microsoft.com/zh-cn/services/iot-hub/)，而是讲讲我们Dynamics AX当下的工业物联网解决方案是怎样的。

### 需要采集的数据

生产制造企业里需要采集进Dynamics AX里的数据有很多，比如：

- 工序报工
- 产品的出入库
- 关键机器的传感器产生的数据流

这些数据可能都要进到Dynamics AX系统中。

### 用于采集数据的设备

用于采集数据的设备更是多种多样的，比如：

- 单片机
- 工控机
- 手持采集终端
- 我们的手机

这些设备都可以用于采集数据。

### 项目中面临的挑战

我们在项目中都面临哪些挑战呢？

#### 需要对接的设备多种多样，不同设备的系统可能不一样

比如工控机有Windows和Linux，手机有安卓和iOS。手持采集终端在过去一二十年以WinCE系统的居多，而最近几年安卓系统的手持采集终端也有大量的应用，比如顺丰定制的第五代手持采集终端。![img](https://img.alicdn.com/imgextra/i2/1330161/TB2q79VX2TJXuFjSspeXXapipXa_!!1330161.jpg)

#### 采集传感器的数据

即使设备厂商提供了通信协议的细节，也需要花费大量的精力去测试，短则几个月，长则一两年，才能真正稳定下来。在这类项目中，与机器对接的效果，直接影响了项目的成败。

#### 网络环境不稳定

断网、丢包等问题，层出不穷，可能会让你焦头烂额。

#### 现场环境恶劣

震动、强腐蚀等环境因素，都会缩短设备寿命。

#### 所依赖的系统的可用性

如果你的物联网系统严重依赖于其它系统，那么其它系统的可用性，一定程度上也会影响你的物联网系统。

#### 物联网系统的速度

以工序报工的场景为例，我们知道车间关心的是完工数量，工人关心的是计件数量（这直接跟工人的收入挂钩）。如果工人报工的时候需要等很长时间，影响了计件数量也就是收入，那就别指望车间能给你这个系统什么好的评价。

### 如何应对挑战

#### 需要对接的设备多种多样

- 如果设备是可以选择的，那么可以根据自身的技术栈，选择相应的设备。比如你只会做Windows应用，那么就选个Windows系统的电脑吧。
- 如果设备是确定的，那么最好使用跨平台的解决方案，将来万一需要更换设备的时候，选择上更从容一点，移植起来也方便。虽然[Reinhard](http://cnblogs.com/reinhard)可以做iOS、安卓、WinCE、Windows、Linux的原生应用，但是还是会选择一个跨平台的方案，以节省开发和维护的精力。

#### 采集传感器的数据

这部分还是推荐跟设备原厂，或有经验的第三方进行合作，看看有没有现成的东西可以用，花点小钱，却会让你的项目进度突飞猛进。

#### 网络环境不稳定

这部分也是比较关键的部分，因为车间的工作是不能停的，**如果你的方案里，没有离线的解决方案，那么一定会让你焦头烂额**。

#### 现场环境恶劣

在选择设备的时候，这里有两种方案，其实是考虑了成本的。

- 用贵的工业级设备。比如[Reinhard](http://cnblogs.com/reinhard)在一个项目里用了价值一万多的工业级设备，共三台其中一台备用，保修2年，总共用了4年，报废了2台，还有一台在苟延残喘。中间过保了还花钱修过几次屏幕和硬盘。平均设备成本不到9000元/年。
- 用便宜的易替代的设备，多备几台备用的。[Reinhard](http://cnblogs.com/reinhard)在另一个项目里，换了价值两千的设备，共四台其中两台备用，保修2年，过保后再坏了就不修了。共用了2年，报废了2台，还有2台状况良好。平均设备成本不到4000元/年。

#### 所依赖的系统的可用性

**在设计的时候最好能够保证物联网系统的独立性，不要依附于其他系统，而是要在其他系统都挂掉的情况下，依然能够正常工作（至少是一段时间）**。这样做的好处有：

- 易于移植。在所依赖的其它系统升级后，甚至被更换掉的时候，只需要做少量的移植工作即可。
- 故障影响面小，可以最大程度地将影响控制在物联网系统范围内。毫无疑问，一旦有严重的故障发生，需要停止Dynamics AX生产环境进行修复的话，牵涉面太广，你得给全公司发OA通告或邮件。而物联网系统独立的情况下，只需给相关人员打一个电话，将物联网系统暂停几分钟做修复或升级，影响也不会太大。
- 掌控性。保持物联网系统的独立性的一个最大的好处就是感觉一切尽在掌握之中，虽然有点夸张，但事实也确实如此。
- 可用性。物联网系统的可用性不再受制于其它系统。

#### 物联网系统的速度

我们知道Dynamics AX里工艺卡过账是需要一些时间的。如果是需要实时报工的场景，那么就应该考虑将创建工艺卡，和过账的流程分开，毕竟工人要做的是如实汇报自己的工作，过账并不是他们关心的，不要让过账的等待影响了他们的工作效率。

### 如何设计

在设计上，[Reinhard](http://cnblogs.com/reinhard)尽量站在更高的抽象层面来讲，这样指导意义更大些。因为内容较多，[Reinhard](http://cnblogs.com/reinhard)后续有机会再讲。