---
title: Dynamics AX 2012 R2 Create A Dedicated Batch Server
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-21 17:31:49
---

安装额外**AOS**的另一原因，是要创建一个专用的**Batch服务器**。

**AOS**实例在处理**batch job**时，会影响它的响应速度。安装一个专用**Batch服务器**，可以解决这个问题。

批处理服务器不能加到集群中，用户也不应连接到它。


1.  进入**System Administrator&gt;Setup&gt;System&gt;Server Configuration**。
2.  在左边的列表，选中要设为**Batch服务器**的**AOS**。
3.  在右边的明细中，选中**Is Batch Server**。
4.  在**Batch Server Groups**中，选择**Batch Group**。
5.  取消其他**AOS**的**Is Batch Server**。

[![Screenshot20150121172831](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121172831.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121172831.jpg)当一切都完成后，打开**System Administrator&gt;Common&gt;Users&gt;Online Users**。你会看到**Server Name** 为**MSDynAX_ApplicationServer**的服务器上，有许多**工作线程**，这就是正在执行的批处理。

[![Screenshot20150122084223](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150122084223.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150122084223.jpg)
