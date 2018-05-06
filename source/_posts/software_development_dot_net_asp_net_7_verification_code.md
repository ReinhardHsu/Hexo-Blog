---
title: Software Development DotNet ASP.NET - 7、用注册码防止暴力注册
date: 2013-01-07 15:21:45
categories:
- Software Development
tags:
- Software Development
- ASP.NET
- DotNet
---

###### 1、新建一个一般处理程序 ashx，在一般处理程序中使用Session，要为其实现的如下接口

```csharp
System.Web.SessionState.IRequiresSessionState
```

###### 2、一般处理程序的任务有两个，代码如下：

- 生成一个验证码
- 把验证码写入Session

```csharp
content.Response.ContentType="image/JPEG";
using(System.Drawing.Bitmap bitmap=new System.Drawing.Bitmap(100,50))
{
    using(System.Drawing.Graphics g=System.Drawing.Graphics(bitmap))
    {
        using(Font font=new System.Drawing.Font("宋体",12))
        {
            using(PointF point=new System.Drawing.PointF(0,10))
            {
                Random rand=new Random();
                int code=rand.Next(1000,9999);
                string strCode=code.ToString();
                HttpContext.Current.Session["Code"]=strCode;
                g.DrawString(strCode,font,System.Drawing.Brush.Green,point);
                bitmap.Save(content.Response.OutputStream,System.Drawing.Image.ImageFormat.Jpeg);
            }
        }
    }
} 
```

###### 3、CS中的代码如下：

```csharp
string Code=Convert.ToString(Session["Code"]);
if(code==TextBox1.Text)
{
    Response.Write("验证码输入正确!");
}
```

###### 4、点击刷新

```csharp
<img src="YZM.ashx" onclick="this.src='YZM.ashx?aaa='+new Date()" />
```