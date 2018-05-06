---
title: Software Development DotNet ASP.NET - 12、Request
date: 2013-01-08 16:41:45
categories:
- Software Development
tags:
- Software Development
- ASP.NET
- DotNet
---

###### 1、路径标识符。

- - http标准定为：

  - - “/”代表网站根目录。
    - “../”代表上级目录。
    - “./”代表当前目录。

  - Asp.net专用，所以要用在<asp: 控件中

  - - “~”代表当前应用根目录。

```csharp
<asp:HyperLink runat="server" NavigateUrl="~/a/b.aspx"></asp:HyperLink>
```

- ###### “~”转换为html能用的相对于应用根路径，经过转换为根路径，Html才认。

  ```csharp
  Response.Write("<a href='"+VirtualPathUtility.ToAbsolute("~/a/b.aspx"));
  ```

###### 2、VirtualPathUtility类的一些主要方法：

- ###### string AppendTrailingSlash(string virtualPath)

- - ###### 检查路径是否为“/”结尾，不是的话加上。

- ###### string Combine(string basePath,string relativePath)

- - ###### “~/a/b”+“c.aspx”=“~/a/c.aspx”

  - ###### “~/a/b/”+“c.aspx”=“~/a/b/c.aspx”

- ###### string GetDirectory(string virtualPaht)

- - ###### 返回虚拟路径的目录部分。

- ###### string MakeRelative(string fromPath,string toPath)

- - ###### 计算两个路径的相对路径。

- ###### string ToAbsolute

- - ###### 转化为绝对路径

###### 3、Request是Page类的一个属性，所以在ashx中需要用context.Request

- ###### Request.AppRelativeCurrentExecutionFilePath

- - ###### 获取当前执行请求相对于应用根目录的虚拟目录。比如“~/Handle.ashx”

- ###### Request.PhysicalApplicationPath

- - ###### 获取当前应用的物理路径。“D:\a\a”

- ###### Request.PhysicalPath

- - ###### 获取当前请求的物理路径。“D:a\a\b.aspx”

- ###### Request.RawUrl

- - ###### 获得原始请求Url

- ###### Request.Url

- - ###### 获得请求Url

  - ###### 区别为设计到Url重写的问题

- ###### Request.UrlReferrer

- - ###### 网页的来源，它去读取Http报文中的Referrer，通过这个做防盗链，全域中

  - ###### 用来防盗链，一般用于图片。因迅雷把所有网页正确的Request.UrlReferrer保存在一个库里，下载的时候伪造Referrer。

- ​

  ```csharp
  context.Response.ContentType = "image/JPEG";
  string fullpath = HttpContext.Current.Server.MapPath("IMG_5433.JPG");
  using (System.Drawing.Bitmap bitmap = new System.Drawing.Bitmap(fullpath))
  {
      using (System.Drawing.Graphics g = System.Drawing.Graphics.FromImage(bitmap))
      {
          using (System.Drawing.Font font = new System.Drawing.Font("宋体", 30))
          {
              if (context.Request.UrlReferrer == null)
              {
                  g.Clear(System.Drawing.Color.White);
                  g.DrawString("图片", font, System.Drawing.Brushes.Red, 0, 0);
              }
              else if(context.Request.UrlReferrer.Host!="localhost")
              {
                  g.DrawString("仅供内部交流使用", font, System.Drawing.Brushes.Red, 0, 0);
              }                    
              bitmap.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);                    
          }
      }
  }
  ```

>  

- ###### Request.UserHostAddress

- - ###### 获得访问者的IP地址，配合来源地址库，分析来源。

- ###### Request.UserLanguages

- - ###### 访问者支持的语言，从报问获得。

- ###### Request.Cookies

- - ###### context.Request.Cookies[“mysessionID”]

  - ###### Response.cookies[“”]

- ###### Request.MapPath(virtulPath)

- - ###### 将虚拟路径转换为磁盘上的物理路径，程序用的时候才稳妥。