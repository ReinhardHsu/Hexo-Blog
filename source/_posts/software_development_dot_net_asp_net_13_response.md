---
title: Software Development DotNet ASP.NET - 13、Response
date: 2013-02-14 15:19:45
categories:
- Software Development
tags:
- Software Development
- ASP.NET
- DotNet
---

**1、响应的缓冲输出**

- 为了提高服务器的性能，Asp.net向浏览器输出的时候，默认并不会每Write一次都立即输出到浏览器，而是会缓存数据，到合适的时机（比如满了）或者响应结束才会将缓冲区中的数据一起发送到浏览器。

**2、Response.Buffer/BufferOutPut**

- 是否采用响应缓存，默认为True

**3、Response.Flash()**

- 立即将缓冲区的数据发给浏览器。
  例如：大批量数据导入，显示正在导入第几条数据
  用Thread.Sleep模拟耗时

```csharp
for(int i=0;i<20;i++) 
{
	System.Threading.Thread.Sleep(5000);
	Context.Response.Write("第"+i+"步执行完毕");
    Context.Response.Flash();
}
```

**4、Response.Clear()**

- 清空缓冲区，不发送给浏览器
- 非Html内容用ashx，Html内容用aspx。aspx的父类会写一些专门为Html准备的东西，所以有些人用aspx生成Jpeg时（输出非Html时），用Clear清楚HttpModule等附加内容。

**5、Response.ContentEncoding**

- 输出流的编码

**6、Response.ContentType**

- 输出流的内容类型 文本（text/plain）

**7、Response.Cookies**

- 返回浏览器的Cookies集合

**8、Response.OutputStream**

- 输出流（图片，Excel等非文本信息。文本信息用Response.Write），用二进制流读写

**9、Response.End()**

- 终止响应。End之前发给客户端，End之后不发。

**10、Response.Redirect**

- 重定向，实际上向服务器发出了两次请求。报文中302 Found重定向，地址栏为新的地址。
  可用于避免Post刷新，提交之后立即进入帖子查看页面

**11、Response.SetCookie(HttpCookie cookie)**

- 向输出流中更新写到浏览器的Coolie，不存在就添加。

**12、Response.WriteFile(filename)**

- 向浏览器输出文件，大文件输出很耗资源



```csharp
Context.Response.ContentType="Image/JPEG"; 
string fullPath=context.server.MapPath("...Jpg");
Context.Response.WriteFile(fullPath);
```

 