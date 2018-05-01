---
title: Dynamics AX 2012 R2 AIF 内部异常
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2016-04-06 09:12:51
---

<span style="font-family: '微软雅黑 Light'; font-size: large;">![Unnamed QQ Screenshot20160328145128](http://reinhardhsu.com/wp-content/uploads/2016/04/Unnamed-QQ-Screenshot20160328145128.jpg "Unnamed QQ Screenshot20160328145128")</span>

<span style="font-family: '微软雅黑 Light'; font-size: large;">    今天，[Reinhard](http://reinhardhsu.com)发现某个入站端口，突然一直报错：</span>

_<span style="font-family: '微软雅黑 Light'; font-size: large;">The server was unable to process the request due to an internal error.  For more information about the error, either turn on IncludeExceptionDetailInFaults (either from ServiceBehaviorAttribute or from the &lt;serviceDebug&gt; configuration behavior) on the server in order to send the exception information back to the client, or turn on tracing as per the Microsoft .NET Framework 3.0 SDK documentation and inspect the server trace logs.</span>_<span id="more-588"></span>

<span style="font-family: '微软雅黑 Light'; font-size: large;">    简单的说，就是遇到了内部错误。如果想知道错误的详情，需要将服务配置文件中的一个参数调整下，允许将异常的详细信息，返回给客户端。我们知道服务在正式发布的时候，出于安全方面的考虑，默认是不允许将异常的详细信息发送给客户端。</span>

<span style="font-family: '微软雅黑 Light'; font-size: large;">    [Reinhard](http://reinhardhsu.com)首先想到在AX系统中 **系统管理-&gt;服务和应用集成框架-&gt;异常** 里面查看，但是发现这里并未捕获到异常信息。[Reinhard](http://reinhardhsu.com)真的很好奇，到底是什么样的内部异常呢？打开服务的**配置文件**，将**IncludeExceptionDetailInFaults**设置为**True**。</span>

<span style="font-family: '微软雅黑 Light'; font-size: large;">![Image](http://reinhardhsu.com/wp-content/uploads/2016/04/Image.png "Image")</span>

<span style="font-family: '微软雅黑 Light'; font-size: large;">    然后再次运行客户端程序，居然不再报错，能够正常使用了。</span>

&nbsp;
