---
title: Dynamics-AX-2012-R2-为运行失败的批处理任务设置预警
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-23 09:28:59
---

我们主要有两种类型的系统监视：环境健康监视和性能监视。

环境健康监视一般对系统性能影响非常小，是为了提醒潜在的问题。

性能监视通常更有侵入性。监视期间，添加一个负载到环境。因此，它可以回答特定的问题或真正用户的抱怨。这不同于性能测试那样，主动地改变基础架构，或模拟增加用户负载。

<span id="more-199"></span>

我们关心那些对业务操作非常重要的反复出现的**Batch Job**，例如过账销售发票，所以要为他们设置**Alert**。

**Alert**会配置到你的账户中。所以你必须用自己的账户登录，并且有充分的权限来管理**Batch Job**。

1、进入**System Administration&gt;Inquiries&gt;Batch Jobs**

2、选择一个**Batch Job**，确保它的**Status**不是将被执行。

3、点击行动面板的按钮**Function&gt;Change Status**。

4、选择**Withhold**，这会将**Job**挂起。当我们进行配置期间，它不会执行。

[![Screenshot201501230845556](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot201501230845556.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot201501230845556.jpg)

5、点击**预警**，在弹出窗口中，选择表要的选项。

6、典型地，一个管理员仅仅希望看到错误消息，所以可以选择**Error**。

7、如果想让预警以弹出窗口的形式显示，可以选择**Show pop-ups**。

8、如果希望预警通过邮件的形式发送，可以选择**E-mail**。

[![Screenshot20150123085548](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150123085548.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150123085548.jpg)

9、点击确定，关闭窗体。回到**Batch Job**窗体，进入**General**面板。

10、将**Save Job To History**设为**Errors Only**。这样可以减少存储不必要的信息。

[![Screenshot20150123090910](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150123090910.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150123090910.jpg)

11、这个**Job**还处于**挂起**状态，我们要将它重新启用。点击**Functions&gt;Change Status**，选择**Waiting**。
