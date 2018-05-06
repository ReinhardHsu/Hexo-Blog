---
title: Software Development DotNet ASP.NET - 3、Cookie
date: 2013-01-07 14:24:45
categories:
- Software Development
tags:
- Software Development
- ASP.NET
- DotNet
---

###### 1、Cookie的读写

- - 服务端写：

```csharp
Response.SetCookie(new HttpCookie("Color",Textbox1,Text));
```

- - 服务端读：

```csharp
Request.Cookies["Color"].value
```

- - 客户端也可通过读取：

```csharp
$.cookie
```

###### 2、每次向服务器请求的时候，除了发送表单参数外，还会将和站点相关的所有Cookie数据提交给服务器，这是强制性的。

###### 3、Cookie是与整个站点相关的（域名）。

###### 4、服务器返回数据除了普通的Html数据外，还会返回修改后的Cookie，浏览器拿到Cookie值更新到本地浏览器的Cookie。

###### 5、互联网优化：图片服务器和主站域名不一样，降低Cookie的流量。