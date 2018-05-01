---
title: Dynamics AX 2012 R2 Server Error in MicrosoftDynamicsAXAif60 Application
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-05 15:34:26
---

如果你的服务端收到如下错误提示之一，并触发InsufficientMemoryException 和ServiceActivationException异常，那么代表你服务器的可用内存过低。<span id="more-55"></span>

&#8220;_Memory gates checking failed because the free memory (14618624 bytes) is less than 5% of total memory. As a result, the service will not be available for incoming requests. To resolve this, either reduce the load on the machine or adjust the value of minFreeMemoryPercentageToActivateService on the serviceHostingEnvironment config element._&#8221;

“内存入口检查失败，因为可用内存( 字节)少于总内存的 5%。因此，该服务不可用于传入的请求。若要解决次问题，请减少计算机上的负载，或调整 serviceHostingEnvironment 配置元素上的 minFreeMemoryPercentageToActivateService 的值。”

[![error](http://reinhardhsu.com/wp-content/uploads/2015/01/error.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/error.jpg)

此时客户端会收到如下提示：

[![error2](http://reinhardhsu.com/wp-content/uploads/2015/01/error2.png)](http://reinhardhsu.com/wp-content/uploads/2015/01/error2.png)

“客户端发现相应内容类型为&#8221;&#8221;，但应为&#8221;text/xml&#8221;。请求失败，响应为空。”

要解决该问题，需要降低主机负荷，或增加硬件内存。如果仅仅想要跳过该问题，可以修改MicrosoftDynamicsAXAif60站点的web.config文件，增加_minFreeMemoryPercentageToActivateService属性。_

[![minFreeMemoryPercentageToActivateService](http://reinhardhsu.com/wp-content/uploads/2015/01/minFreeMemoryPercentageToActivateService.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/minFreeMemoryPercentageToActivateService.jpg)
