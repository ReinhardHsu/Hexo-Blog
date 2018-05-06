---
title: Software Development DotNet ASP.NET - 1、内部原理
date: 2013-01-07 13:51:45
categories:
- Software Development
tags:
- Software Development
- ASP.NET
- DotNet
---

###### 1、WebApplication 与 WebSite 区别

WebSite 不需要创建空间名，CS代码修改后不需要重启就能看到变化，但不利于工程化开发。

###### 2、Asp.net 生命周期

- 当用户请求访问ashx页面时，ProcessRequest方法就被调用，其通过Context.Request获得访问者的请求参数等，然后在ProcessRequest中通过Context.Response向浏览器发回数据。
- 控件ID是给JS操作Dom用的，Name 才是提交给服务器用的。
- 在服务器端用Context.Request[“UserName”]来获取传递给服务器的参数的属性值。
- 用Context.Response.Write向浏览器输出处理后的HTML内容。

###### 3、将虚拟路径转换为文件全路径

```csharp
string fullpath=context.Server.MapPath("Hello.Html");
```

###### 4、读取文件

```csharp
string content=System.IO.File.ReadAllText(fullpath);
```

###### 5、IsPostBack

```csharp
<input type="Hidden" name="IsPostBack" value="true" />
```

- 通过表单提交给服务器，来区分是否是提交进入。

###### 6、替换传递参数的值，html模板文件中的占位符

```csharp
<input type="text" value="@value"/>
```

```csharp
content=content.Replace("@value",username);
```

- 模板页禁止访问
- 在ProcessRequest中，首先从Request中读取IsPostBack，如果读到True，则说明是提交进入。就加载模板，用计算后的值替换占位符。否则将模板中的占位符清空。输出。

###### 7、Form 的Method

- Get通过Url传递表单值，不能传递大数据量和密码等。
- Post通过Http报文传递表单值，浏览器刷新后有重新提交的提示。
- Get方式Url数据格式：服务器端文件名后跟“?”，键值对用“&”分割，汉字、特殊字符用Http Encode。
- 表单域中，只有设定了Name的控件值，才会被提交到服务器，如果Submit有Name,也会提交其Value。

###### 8、请求

- 并非服务器来读取客户的网页，而是浏览器手机用户在表单中输入的字段，然后形成请求参数，发送给服务器处理程序。只有设定了Name的Input，TextArea，Select的Value属性值，才会被提交给服务器。