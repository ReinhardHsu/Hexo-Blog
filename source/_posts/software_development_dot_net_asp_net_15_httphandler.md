---
title: Software Development DotNet ASP.NET - 15、HttpHandler
date: 2013-02-14 15:41:45
categories:
- Software Development
tags:
- Software Development
- ASP.NET
- DotNet
---

**1、HttpHandler**

- 是通过对请求的响应，输出普通html，图片，一个文件（下载）
- 一般，普通Html用aspx响应，非Html用HttpHandler响应输出。

**2、动态输出图片，图片中加一些信息**

```csharp
Context.Response.ContentType="image/JPEG";
Using(System.Drawing.Bitmap bitmap=new System.Drawing.Bitmap(300,300))
{
    Using(System.Drawing.Graphics g=System.Drawing.Graphics.FormImage(bitmap))
    {
        Using(Font font=new System.Drawing.Font("宋体",30))
        {
            g.DrawString("IP:"+Context.Request.UserHostAddress,font,System.Drawing.Brushes.Red,0,0);
            //Context.Request.Browser.Platform    "操作系统"
            //context.Request.Browser.Type        "浏览器"
        }
    }
}
```

**3、下载文件，响应报文头中，会有Content-Disposition**

```csharp
Context.Response.ContentType="image/JPEG"; 
Context.Response.AddHeader("Content-Disposition",
	"attachment:filename=haha.jpg"); //处理，附件，默认文件名
Context.Response.WriteFile("aaa.jpg");
```

**4、如果默认下载文件名为中文，必须使用UrlEncode对文件名进行编码**

```csharp
string filename=HttpUtility.UrlEncode("哈哈.jpg");
```

**5、下载地址为ashx文件**

```html
<a href="tupian.ashx" />
```

**6、图片是动态输出给用户，未生成文件存在服务器以提供下载。**

- 能直接生成的内容以流的形式输出给浏览器，就不要生成临时文件，避免重名问题。

**7、Mdf文件建在App_Data，此文件夹下的文件会禁止下载，连接数据库用 |DataDirectory|,  用DataReader读**