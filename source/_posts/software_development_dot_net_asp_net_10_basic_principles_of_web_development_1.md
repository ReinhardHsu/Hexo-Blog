---
title: Software Development DotNet ASP.NET - 10、Web开发的一些基本原则1
date: 2013-01-08 10:04:45
categories:
- Software Development
tags:
- Software Development
- ASP.NET
- DotNet
---

1、最小权限原则

- - ① 即“只允许客户做。。。”，而不是“不许做。。。”。
  - ② 浏览器查看的是服务端代码的执行输出文本，看不到aspx.cs源码，只能看到aspx的执行结果。JS，HTML是被输出到浏览器上执行的，因此无法禁止用户查看JS,HTML。

```csharp
在Button的onClientClick中写入Javascrip代码，可被输出到客户端浏览器执行。

<asp:Button Text="删除" runat="server" OnClientClick="return confirm('真的要删除吗？')" />

客户端输出为：

<input type="submit" name="ctl02" value="删除" onclick="return confirm('真的要删除吗？');" />
```



```csharp
在Response.Write插入如下代码，会在回应的页面顶端，写入弹出代码，阻塞了客户端大卖，未阻塞服务端代码，后面会用RegisterClientStartupScript

Response.Write("<script type='text/javascript'>alert('你好')</script>");
127.0.0.1 是回环地址（LookBack），未走网卡，Localhost就是127.0.0.，代表本机。
0.0.0.0 代表任意IP（Any IP），不用写死绑定的IP，通过任意一块王珂都可访问。
比如用了Any IP，则外网可用我的外网地址访问我，内网可用我的内网地址访问我。
```

- ③ 服务器只能输出html代码。
- ④ ViewState是与页面有关，不同页面的ViewState不同，不能共用。