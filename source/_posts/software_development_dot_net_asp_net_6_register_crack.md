---
title: Software Development DotNet ASP.NET - 6、暴力注册原理
date: 2013-01-07 15:02:45
categories:
- Software Development
tags:
- Software Development
- ASP.NET
- DotNet
---

- 用WebBrowser将Url设为注册页地址，如127.0.0.1/Reg.asp

```csharp
webBrowser1.Document.GetElementById("TextBox1").setAttribute("value","user1");
webBrowser1.Document.GetElementById("TextBox2").setAttribute("value","password1");
webBrowser1.Document.GetElementById("Button1").InvokeMember("Click");
```

