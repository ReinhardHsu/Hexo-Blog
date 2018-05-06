---
title: Software Development DotNet ASP.NET - 14、Server
date: 2013-02-14 15:20:45
categories:
- Software Development
tags:
- Software Development
- ASP.NET
- DotNet
---

**1、Server是Context的一个属性**

- 是HttpServerUtility类的一个对象，非静态类，在cs中可点出，在HttpHandle中，用Http.Content.Server

**2、****Server.HtmlEncode/Decode** 

- 文本的编码，是对HttpUtility类中相应方法的调用,用来防止XSS跨站脚本执行。

**3、Server.UrlEncode/Decode**

- 超链接的编码

**4、Server.Transfer(path)**

- 内部重定向，是服务器内部的接管，浏览器意识不到。不是像Response.Redirect那样经历了“通知浏览器”，请重新访问Url这个网址和浏览器接到命令访问新网址的过程。因此地址栏不会发生变化。
- 因为是内部接管，所以在重定向到新的页面中时可以访问到Request和Cookies等来源页面接收的参数。
- 内部接管，无法重定向到外部网址。而Redirect 可以。
- 请求只有一次，响应200 OK
- Redirect("Hello.aspx?q=2")需要把参数写入Url才能拿到参数
- Transfer("Hello.aspx")可直接拿到参数
- Transfer 不能直接重定向到ashx，会报错.
- 在不能拿到HttpContext时，可通过HttpContext.Current拿到当前HttpContext，进而拿到Response.Request.Server等，如（Global.asax），可直接用Current拿，免去判断。