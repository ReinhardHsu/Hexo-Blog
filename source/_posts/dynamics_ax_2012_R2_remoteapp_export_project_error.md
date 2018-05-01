---
title: Dynamics AX 2012 R2 RemoteApp导出项目报错
categories:
- Microsoft Dynamics AX
tags:
  - Microsoft Dynamics AX
date: 2015-06-22 17:28:13
---

<font size="4" face="微软雅黑">&nbsp;&nbsp;&nbsp; 今天，Reinhard使用RemoteApp的方式登陆AX开发环境，对项目文件进行修改后，习惯性地将项目导出到Reinhard的电脑上，做个备份。但是导出时弹出错误提示框，报以下错误：</font>
<p>_<u><font size="4" face="微软雅黑">&nbsp;&nbsp;&nbsp; 在记录中的写入=9C9360时文件C:\Windows\TEMP\$tmp00030007.$$$中出错 Windows错误:=错误代码:112=Unknown error 是否重试?</font></u>_
<p><font size="4" face="微软雅黑">![Unnamed QQ Screenshot20150601151657](http://reinhardhsu.com/wp-content/uploads/2015/06/Unnamed-QQ-Screenshot20150601151657.jpg "Unnamed QQ Screenshot20150601151657")</font>
<p><font size="4" face="微软雅黑">&nbsp;&nbsp;&nbsp; 一开始，Reinhard以为文件的写入权限出错了，所以将之前的备份文件删除，重新导出，依然报错。</font>
<p><font size="4" face="微软雅黑">&nbsp;&nbsp;&nbsp; 最后无意间，Reinhard进入到RemoteApp的AOS所在服务器中，发现是AOS服务器的C盘空间不足导致的。</font>
<p><font size="4" face="微软雅黑">![Unnamed QQ Screenshot20150601175731](http://reinhardhsu.com/wp-content/uploads/2015/06/Unnamed-QQ-Screenshot20150601175731.jpg "Unnamed QQ Screenshot20150601175731")</font>
<p><font size="4" face="微软雅黑">&nbsp;&nbsp;&nbsp; 清理C盘空间后，Reinhard的项目可以正常导出了。</font>
<p><font size="4" face="微软雅黑"></font>
