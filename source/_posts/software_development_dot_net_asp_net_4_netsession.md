---
title: Software Development DotNet ASP.NET - 4、NetSession
date: 2013-01-07 14:42:45
categories:
- Software Development
tags:
- Software Development
- ASP.NET
- DotNet
---

###### 1、每次请求来了，都会new一个新的实现了IHttpHandle接口的类页面的实例，进行处理。用完就GC掉，所以 不会保持上次的值。即访问者访问的是不同i的实例。

```csharp
private int i=0;
i++;
```

###### 2、所有的访问者都访问的同一个j的实例，即可实现全局变量。

```csharp
private static int j=0;
j++; 
```

###### 3、Session原理，自己造轮子

- - 用IDictionary<string,IDictionary<string,object>>来存储素有的多个登陆用户的数据

```csharp
IDictionary<string,IDictionary<string,object>> data=new Dictionary<string,IDictionary<string,object>>();
if(data.ContainsKey(sessionID))
{
    return data[sessionID];
}
else
{
    IDictionary<string,object> session=new Dictionary<string,object>();
    data[sessionID]=session;
    return session;
}
```

- 每次读取客户端提交来的Cookie，若发现Cookie中无SessionID：（Key），给客户端生成一个Guid，把Guid写入客户端Cookie，来标示身份。
- 在服务端生成一个Guid对应的容器，容器里放多个Key-Value。
- 取的时候，读客户端提交来的Cookie中的Guid，找到其在服务器对应的容器。

###### 4、Session有超时。（应用Ajax每隔十分钟骚扰下服务器，告诉服务器自己还活着。）需要定时销毁。

###### 5、ASP.NET内置有Session，内置Session的ID自动分配，只用复制与取值。在Cookie中叫做ASP.NET_SessionId。

###### 6、Session不能放太大的数据，格式是object