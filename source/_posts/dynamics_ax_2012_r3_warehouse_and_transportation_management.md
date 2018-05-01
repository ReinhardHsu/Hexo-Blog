---
title: Dynamics AX 2012 R3 仓库和运输管理系列 – 仓库管理模块安装与配置
categories:
- Microsoft Dynamics AX
tags:
  - Microsoft Dynamics AX
date: 2016-01-28 09:58:00
---

<span style="font-family: 微软雅黑; font-size: large;">![2016012705](http://reinhardhsu.com/wp-content/uploads/2016/01/2016012705.png "2016012705")</span>

<span style="font-family: 微软雅黑; font-size: large;">    在AX 2012 R3版本中，新增了仓库和运输管理模块，同时提供了一个在移动设备上进行仓库管理工作的网站。在这个系列里，与[Reinhard](http://reinhardhsu.com)一起，了解仓库和运输管理模块吧。</span>

<span style="font-family: 微软雅黑; font-size: large;">    需要注意的是，微软是不支持同时启用WMS II和仓库和运输管理模块的，WMS II模块也将在后续的版本中淘汰，详情参见 </span>[<span style="font-family: 微软雅黑; font-size: large;">Warehouse and Transportation management vs. the “old” Advanced warehouse management</span>](http://blogs.msdn.com/b/dynamicsaxscm/archive/2014/06/26/warehouse-and-transportation-management-vs-the-old-advanced-warehouse-management.aspx)<span style="font-family: 微软雅黑; font-size: large;"> 。所以我们把WMS II的许可取消掉，只关注仓库和运输管理模块。</span><span id="more-570"></span>

<span style="font-family: 微软雅黑; font-size: large;">    [Reinhard](http://reinhardhsu.com)先从安装移动设备门户开始说起。</span>

<span style="font-family: 微软雅黑; font-size: large;">    我们都知道，AX是一个支持多组织的系统，但是在移动设备门户上登陆时，并没有提供选择组织的功能，那如何登陆到特定组织呢？原来AX要为每一个需要使用移动设备进行仓库管理的组织，都部署一个独立的门户网站。不同的网站在与AX交互时，使用不同的域账号，每个域账号在AX里设置了默认登陆的公司，和移动设别仓库管理员的角色。这样登陆到不同的网站，即是登陆到不同的组织里。</span>

<span style="font-family: 微软雅黑; font-size: large;">![2016012707](http://reinhardhsu.com/wp-content/uploads/2016/01/2016012707.png "2016012707")</span>

<span style="font-family: 微软雅黑; font-size: large;">    了解了原理，我们就先从创建用于移动设备仓库管理的域账号开始吧。</span>

<span style="font-family: 微软雅黑; font-size: large;">    为不同的组织创建不同的域账号，创建域账号的步骤参考[Reinhard](http://reinhardhsu.com)前面的博文。</span>

<span style="font-family: 微软雅黑; font-size: large;">    接着在AX系统里为每个域账号设置移动设备仓库管理员的角色。</span>

<span style="font-family: 微软雅黑; font-size: large;">![2016012703](http://reinhardhsu.com/wp-content/uploads/2016/01/2016012703.png "2016012703")</span>

<span style="font-family: 微软雅黑; font-size: large;">    设置域账号的默认登陆公司。</span>

<span style="font-family: 微软雅黑; font-size: large;">![2016012704](http://reinhardhsu.com/wp-content/uploads/2016/01/2016012704.png "2016012704")</span>

<span style="font-family: 微软雅黑; font-size: large;">    然后运行AX安装程序，为不同组织都安装一次移动设备门户模块。</span>

<span style="font-family: 微软雅黑; font-size: large;">![2016012702](http://reinhardhsu.com/wp-content/uploads/2016/01/2016012702.png "2016012702")</span>

<span style="font-family: 微软雅黑; font-size: large;">    输入相应的域账号，和不同的端口号。在安装的过程中会检查必备项，其中可能需要为IIS添加一些功能，并安装MVC 2 的组件。这里要吐槽下微软，MVC都已经出到6了，还用MVC 2，难道是为了兼容老设备么？</span>

<span style="font-family: 微软雅黑; font-size: large;">    打开浏览器，输入刚刚移动设备门户的地址，显示如下画面：</span>

<span style="font-family: 微软雅黑; font-size: large;">![2016012706](http://reinhardhsu.com/wp-content/uploads/2016/01/2016012706.png "2016012706")</span>

<span style="font-family: 微软雅黑; font-size: large;">    接着，我们添加一个移动设备上的工作用户，并重置其密码。</span>

<span style="font-family: 微软雅黑; font-size: large;">![2016012708](http://reinhardhsu.com/wp-content/uploads/2016/01/2016012708.png "2016012708")</span>

<span style="font-family: 微软雅黑; font-size: large;">    现在，[Reinhard](http://reinhardhsu.com)就可以使用这个用户在移动设备门户上登陆了。</span>

<span style="font-family: 微软雅黑; font-size: large;">![2016012709](http://reinhardhsu.com/wp-content/uploads/2016/01/2016012709.png "2016012709")</span>

<span style="font-family: 微软雅黑; font-size: large;">    点击登陆，即可看到主菜单界面。</span>

<span style="font-family: 微软雅黑; font-size: large;">![2016012701](http://reinhardhsu.com/wp-content/uploads/2016/01/2016012701.png "2016012701")</span>

<span style="font-family: 微软雅黑; font-size: large;">    这样，我们的移动设备门户就已经安装配置完毕。</span>

&nbsp;
