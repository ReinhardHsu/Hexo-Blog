---
title: Software Development DotNet ASP.NET - 9、请求响应模型
date: 2013-01-08 09:36:45
categories:
- Software Development
tags:
- Software Development
- ASP.NET
- DotNet
---

###### 1、行删除HTML版

- - 新建一般处理页面，取得传入参数

```csharp
string name = context.Request["Name"];
context.Response.Write(name);
```

- - Get超链接方式：

```html
<form id="form1" action="Shanchu.ashx">
<input id="Name" type="hidden" name="Name" />
<table>
<tr><td>Get超链接方式</td><td><a href="Shanchu.ashx?Name=tom">删除</a></td></tr>
</table>
```

- - Post提交表单方式：设置一隐藏字段，点击按钮，为字段赋值，提交

```html
<form id="form1" action="Shanchu.ashx">
<input id="Name" type="hidden" name="Name" />
<table>
<tr><td>tom</td><td><input type="submit" value="删除" onclick="document.getElementById('Name').value='tom';document.getElementById('form1').submit()" /></td></tr>
</table>
</form>
```

- - Post LinkButton：

```html
<form id="form1" action="Shanchu.ashx">
<input id="Name" type="hidden" name="Name" />
<table>
<tr><td>Post LinkButton</td><td><a href="javascript:document.getElementById('Name').value='tom';document.getElementById('form1').submit();">删除（submit）</a></td></tr>
</table>
</form>
```

###### 2、行删除aspx版

- 新建Shanchu.aspx页面，判断是否是IsPostBack进来

```csharp
string name = Request["Name"];
Response.Write(name + "欢迎你<br/>");
if (IsPostBack)
{
    Response.Write(name + "删除成功<br/>");
}
```

```html
<form id="form1" action="Shanchu.aspx" runat="server">
<input id="Name" type="hidden" name="Name" />
<table>
<tr><td>Get超链接方式</td><td><a href="Shanchu.aspx?Name=tom">删除</a></td></tr>
<tr><td>tom</td><td><input type="submit" value="删除" onclick="document.getElementById('Name').value='tom';document.getElementById('form1').submit()" /></td></tr>
<tr><td>Post LinkButton</td><td><a href="javascript:document.getElementById('Name').value='tom';document.getElementById('form1').submit();">删除（submit）</a></td></tr>
</table>
</form>
```

- Get方式只传递了特定的参数值，因为没有传递IsPostBack的载体ViewSate，故不认为IsPostBack;
- Post方式传递了表单上的值。

###### 3、RunAtServer 网页默认为Post，若改为Get方式，则ViewState会通过超链接中传输。一般不能使用超链接传输ViewState。

###### 4、客户端，服务端犹豫在两台计算机上，所以无法做到两边变量互读，函数互调。必须通过提交的方式将客户端的变量作为一个表单字段提交到服务器，或者服务器将服务端变量打印到客户端代码中。