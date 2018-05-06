---
title: Dynamics AX 2012 R2 安装Reporting Services 扩展
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-09-28 09:47:21
---

<font face="微软雅黑">![123](http://reinhardhsu.com/wp-content/uploads/2015/09/123.jpg "123")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 今天[Reinhard](http://reinhardhsu.com)在VS中部署SSRS报表时，接到以下错误：</font>

> <p>_<font face="微软雅黑">部署因错误而被取消。在报表服务器上，验证：-SQL Server Reporting Services 服务是否正在运行。</font>_

<font face="微软雅黑">&nbsp;&nbsp;&nbsp; 接着，[Reinhard](http://reinhardhsu.com)进入到AX中，检查系统的报表服务器配置是否正确。不知道怎么配置的同学可以查看[Reinhard](http://reinhardhsu.com)之前的博文 </font>[<font face="微软雅黑">Dynamics AX 2012 R2 配置报表服务器</font>](http://reinhardhsu.com/p/set-up-report-server.html)<font face="微软雅黑">&nbsp; 。检查发现，报表服务器中的配置也正确。[Reinhard](http://reinhardhsu.com)点击了一下 验证设置 按钮，收到以下错误：</font>
<p><font face="微软雅黑">![124](http://reinhardhsu.com/wp-content/uploads/2015/09/124.jpg "124")</font>

> <p>_<font face="微软雅黑">无法连接到位于MSDynAX的报表服务器http://MSDynAX/Reports。确保SQL Server Reporting Services 正确配置为与 Microsoft Dynamics AX 客户端中的报表服务器配置匹配。</font>_

<font face="微软雅黑">&nbsp;&nbsp;&nbsp; 根据错误提示，[Reinhard](http://reinhardhsu.com)进入到报表服务器，检查SSRS服务是否启动。检查发现，报表服务没有启动。[Reinhard](http://reinhardhsu.com)将其启动后，再次点击 验证设置 按钮，又收到以下错误：</font>
<p><font face="微软雅黑">![125](http://reinhardhsu.com/wp-content/uploads/2015/09/125.jpg "125")</font>

> <p><font face="微软雅黑">&nbsp;_在 URL http://MSDynAX/ReportServer 的报表服务器上找不到文件夹 DynamicsAX 。_</font>

<font face="微软雅黑">&nbsp;&nbsp;&nbsp; [Reinhard](http://reinhardhsu.com)判断，报表服务器上很有可能没有安装AX的 Reporting Services 扩展。到服务器上检查了下，果然没有装。接着， Reinhard就开始安装该扩展吧。 ![126](http://reinhardhsu.com/wp-content/uploads/2015/09/126.jpg "126")</font>

<font face="微软雅黑">&nbsp;&nbsp;&nbsp; 点击下一步，进入必备项验证，验证通过后继续下一步，[Reinhard](http://reinhardhsu.com)又收到以下错误：</font>
<p><font face="微软雅黑">![127](http://reinhardhsu.com/wp-content/uploads/2015/09/127.jpg "127")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 这是因为[Reinhard](http://reinhardhsu.com)的AOS和报表服务器不在一台服务器上，并且报表服务器的BC没有指向AOS所在服务器。</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; [Reinhard](http://reinhardhsu.com)进入到AX配置实用程序，将BC指向AOS所在服务器。</font>
<p><font face="微软雅黑">![128](http://reinhardhsu.com/wp-content/uploads/2015/09/128.jpg "128")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 修改完记得点击 应用 按钮。重新回到AX组件安装程序，继续安装，录入BC账号的密码，进入下一步。</font>
<p><font face="微软雅黑">![Image](http://reinhardhsu.com/wp-content/uploads/2015/09/Image.png "Image")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 选择本机的数据库实例，记得把 部署报表 的CheckBox选中，点击下一步。这里我们选择AX的数据库服务器的名称，和数据库名称。这里Reinhard收到以下错误：</font>
<p><font face="微软雅黑">![129](http://reinhardhsu.com/wp-content/uploads/2015/09/129.jpg "129")</font>

> <p>_<font face="微软雅黑">安装程序无法连接到数据库服务器“MSDynAX”。</font>_

<font face="微软雅黑">&nbsp;&nbsp;&nbsp; [Reinhard](http://reinhardhsu.com)猜测可能是BC账户没有AX数据库的权限。检查后，[Reinhard](http://reinhardhsu.com)发现BC账户的权限没有问题。</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 那究竟问题出在哪里呢？Reinhard突然想到刚刚只是将BC指向了AOS，没有将本地客户端指向AOS。</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; [Reinhard](http://reinhardhsu.com)重新运行AX配置工具，将本地客户端指向AOS，应用设置。</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 接着，[Reinhard](http://reinhardhsu.com)重新运行AX组件安装工具，这次可以获取到AX数据服务器的数据库名称了。</font>
<p><font face="微软雅黑">![Image(1)](http://reinhardhsu.com/wp-content/uploads/2015/09/Image1.png "Image(1)")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 点击下一步，必备项检查完毕。</font>
<p><font face="微软雅黑">![Image(2)](http://reinhardhsu.com/wp-content/uploads/2015/09/Image2.png "Image(2)")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp;&nbsp; 接着点击下一步，开始安装。</font>
<p><font face="微软雅黑">![Image(3)](http://reinhardhsu.com/wp-content/uploads/2015/09/Image3.png "Image(3)")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 恭喜[Reinhard](http://reinhardhsu.com)，安装过程中又收到以下错误：</font>
<p><font face="微软雅黑">![Image(4)](http://reinhardhsu.com/wp-content/uploads/2015/09/Image4.png "Image(4)")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 点击完成，打开错误日志。</font>
<p><font face="微软雅黑">![Image(5)](http://reinhardhsu.com/wp-content/uploads/2015/09/Image5.png "Image(5)")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 查看安装日志，</font>
<p><font face="微软雅黑">![Image(6)](http://reinhardhsu.com/wp-content/uploads/2015/09/Image6.png "Image(6)")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; [Reinhard](http://reinhardhsu.com)想到，可能是SSRS没有启动，检查后，发现果真如此。</font>
<p><font face="微软雅黑">![Image(7)](http://reinhardhsu.com/wp-content/uploads/2015/09/Image7.png "Image(7)")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 点击 启动 按钮，待SSRS启动成功后，重新运行AX组件安装程序，执行上面的步骤，在必备项验证时，[Reinhard](http://reinhardhsu.com)又幸运的收到下面的错误：</font>
<p><font face="微软雅黑">![Image(8)](http://reinhardhsu.com/wp-content/uploads/2015/09/Image8.png "Image(8)")</font>

> <p>_<font face="微软雅黑">1.确认安装了支持的 Microsoft SQL Server Reporting Services 版本。有关支持哪些版本的详细信息，请参阅 http://go.microsoft.com/fwlink/?LinkId=165377 上的 System Requirements (系统要求)。</font>_
> <p>_<font face="微软雅黑">2.打开浏览器，然后确认可访问 Reporting Services Web 服务 URL http://MSDynAX/ReportServer</font>_

<font face="微软雅黑">&nbsp;&nbsp;&nbsp; Reinhard打开SSRS的Web服务URL http://MSDynAX/ReportServer，发现根本打不开。</font>
<p><font face="微软雅黑">![Image(9)](http://reinhardhsu.com/wp-content/uploads/2015/09/Image9.png "Image(9)")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 并且，[Reinhard](http://reinhardhsu.com)发现SSRS的系统服务根本就没有启动。[Reinhard](http://reinhardhsu.com)试着重新启动SSRS系统服务，启动不起来。[Reinhard](http://reinhardhsu.com)发现这个服务的登陆账户为BC账户，会不会是这个原因呢。Reinhard将该系统服务的登陆账户改为网络服务，然后可以成功启动了。</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 可是这时SSRS的Web服务URL http://MSDynAX/ReportServer 依然报503错误，[Reinhard](http://reinhardhsu.com)猜测可能是SSRS服务没有部署好。先将BC加入到本地管理员账户，然后重新部署了SSRS，打开http://MSDynAX/Reports，终于把Web服务配置好了。</font>
<p><font face="微软雅黑">![Image(10)](http://reinhardhsu.com/wp-content/uploads/2015/09/Image10.png "Image(10)")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 重新进行必备项检查，这次终于通过了，点击下一步，开始进行安装。</font>
<p><font face="微软雅黑">![Image(11)](http://reinhardhsu.com/wp-content/uploads/2015/09/Image11.png "Image(11)")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 这次还比较顺利，等待命令行窗体自己消失即可。</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 接着，我们进入网页中，确认 DynamicsAX文件夹已经存在。</font>
<p><font face="微软雅黑">![Image(12)](http://reinhardhsu.com/wp-content/uploads/2015/09/Image12.png "Image(12)")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 回到AX中，验证报表服务器配置。</font>
<p><font face="微软雅黑">![Image(13)](http://reinhardhsu.com/wp-content/uploads/2015/09/Image13.png "Image(13)")</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 这样，Dynamics AX R2的Reporting Services 扩展就安装部署好了。</font>
<p><font face="微软雅黑">&nbsp;&nbsp;&nbsp; 绕了这么多弯路，下面总结吧：</font>

1.  <font face="微软雅黑">需要将BC账户加入到报表服务器本机管理员组</font>
<li><font face="微软雅黑">需要授予BC账户在AX数据库的权限</font>
<li><font face="微软雅黑">需要授予BC账户在报表数据库的权限</font>
<li><font face="微软雅黑">需要SSRS服务以网络服务的账户运行</font>
<li><font face="微软雅黑">需要将报表服务器的客户端和BC指向AOS服务器</font>
<li><font face="微软雅黑">安装完SSRS需要配置一下</font>
<li><font face="微软雅黑">需要在AX系统中设置报表服务器</font>
<p><font face="微软雅黑"></font>
