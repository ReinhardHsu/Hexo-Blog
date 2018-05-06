---
title: Software Development DotNet ASP.NET - 2、ViewState
date: 2013-01-07 14:11:45
categories:
- Software Development
tags:
- Software Development
- ASP.NET
- DotNet
---

###### 1、可以用工具ViewStateDecoder查看ViewState。

###### 2、ViewState是XML格式的数据，进行了Encode序列化。

###### 3、WebForm默认为Post提交，无法用Get提交。

###### 4、WebForm都有ViewState。

###### 5、对于下次还要用的，控件有无法提交的数据，用ViewState记录，如Label，而Input就不用。

###### 6、禁用ViewState，以减小ViewState的尺寸

- 可以在<Page区域禁用页面的ViewState，代码如下

```csharp
enableviewstate=false
```

- 也可以在单个控件属性中禁用单个控件的。
- 禁用后TextBox不受影响，Div受影响。一般禁用ListView的ViewState即可。
- 内网，互联网的后台可尽情ViewState。

###### 7、Http的无状态性，不记得上次的状态，也不记得上次做过什么。

- 一个方法是在对浏览器相应结束之前，将状态信息保存到页面表单中，下次页面再向服务器发出请求时，会带上这些状态信息。

###### 8、状态信息保存在隐藏字段中，加大了网站流量，降低了访问速度，机密数据放到表单中会有数据欺骗等安全问题。