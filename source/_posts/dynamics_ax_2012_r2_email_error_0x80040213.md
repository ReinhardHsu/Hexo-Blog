---
title: Dynamics AX 2012 R2 电子邮件广播错误 0x80040213
date: 2017-03-22 09:48:52
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
---

![img](https://ws1.sinaimg.cn/large/006tKfTcgy1fr1f5g6a15j309w0cmjrv.jpg)

今天[Reinhard](http://reinhardhsu.com/)在新环境做邮件广播测试时，发现无法发送邮件，并报以下错误：

*类“CDO.Message”的 COM 对象中的方法“send”返回了错误代码 0x80040213 (<未知>)，此错误代码表示: 与服务器的传输连接失败。。*

[Reinhard](http://reinhardhsu.com/)检查了**电子邮件参数**里的配置，与老环境中的配置一致，并没有问题。**电子邮件参数**和**邮件模板**配置方法可以参考[Reinhard](http://reinhardhsu.com/)之前的博文 [Dynamics AX 2012 R2 设置E-Mail](http://reinhardhsu.com/p/set-up-e-mail-for-ax.html) 和 [Dynamics AX 2012 R2 配置E-Mail模板](http://reinhardhsu.com/p/configuring-e-mail-template.html) 。

## 问题排查

### 排除 Dynamics AX 的影响因素

为了排除 Dynamics AX 方面的影响因素，我们用运行Telnet命令来测试下。

#### 新环境

没有安装Telnet的可以在**Windows 功能**里添加。

![img](https://ws4.sinaimg.cn/large/006tKfTcgy1fr1f5hn640j30ll0fvjrv.jpg)

在新环境的终端中，运行telnet，连接邮件服务器的地址和端口。

```
欢迎使用 Microsoft Telnet Client

Escape 字符为 'CTRL+]'

Microsoft Telnet> open mail.msdynax.net 25
正在连接mail.msdynax.net...无法打开到主机的连接。 在端口 25: 连接失败
Microsoft Telnet>
```

我们看到，新环境中是连不上的。

#### 老环境

在老环境的终端中，执行相同的命令。

```
欢迎使用 Microsoft Telnet Client

Escape 字符为 'CTRL+]'

Microsoft Telnet> open mail.msdynax.net 25

220 mail.msdynax.net Microsoft ESMTP MAIL Service ready at Thu, 9 Mar 2
017 15:46:43 +0800
```

我们看到，已打开了邮件服务器的地址和端口。

使用系统的Telnet命令也出现同样的故障，可以排除 Dynamics AX 方面的因素了。

### 其它影响因素

既然相同的配置，在老环境里没问题，在新环境里报错，[Reinhard](http://reinhardhsu.com/)猜可能是以下几个地方出问题了：

- 防火墙
- 域控策略
- 邮件服务器对客户端做了IP限制

[Reinhard](http://reinhardhsu.com/)对这几个部分逐一做了确认，没有发现任何限制。

## 解决方法

[Reinhard](http://reinhardhsu.com/)无奈之下，对新环境重新安装了操作系统。装完后再进行测试，已经可以连上邮件服务器了。