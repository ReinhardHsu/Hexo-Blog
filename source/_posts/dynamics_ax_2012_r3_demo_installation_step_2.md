---
title: Dynamics AX 2012 R3 Demo 安装与配置 – 安装数据服务器、AOS和客户端 (Step 2)
categories:
- Microsoft Dynamics AX
tags:
  - Microsoft Dynamics AX
date: 2015-06-02 16:59:31
---

![2015-05-27_23-25-53](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_23-25-53.png "2015-05-27_23-25-53")
<p>&nbsp;&nbsp;&nbsp; 上一节中，Reinhard主要讲解了怎么配置安装环境，尤其是域控制器，并在域中添加了一个管理员账户 reinhardhsu.com\Reinhard ，以后的安装配置，均在该账户下进行。
<p>&nbsp;&nbsp;&nbsp; 现在运行 AX 2012 R3 的安装程序，选择安装组件。
<p>![2015-05-27_21-46-53](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_21-46-53.png "2015-05-27_21-46-53")
<p>&nbsp;&nbsp;&nbsp; 选择安装AX，点击下一步。
<p>![2015-05-27_21-47-32](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_21-47-32.png "2015-05-27_21-47-32")
<p>&nbsp;&nbsp;&nbsp; 选择自定义安装，点击下一步。
<p>![2015-05-27_21-47-59](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_21-47-59.png "2015-05-27_21-47-59")
<p>&nbsp;&nbsp;&nbsp; 我们先安装数据库服务器，点击下一步。
<p>![2015-05-27_21-48-31](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_21-48-31.png "2015-05-27_21-48-31")
<p>&nbsp;&nbsp;&nbsp; 安装程序会检查必要的组件是否安装完毕。安装完毕后，点击下一步。
<p>![2015-05-27_21-48-54](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_21-48-54.png "2015-05-27_21-48-54")
<p>&nbsp;&nbsp;&nbsp; 选择船舰数据库，点击下一步。
<p>![2015-05-27_21-49-14](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_21-49-14.png "2015-05-27_21-49-14")
<p>&nbsp;&nbsp;&nbsp; 因为我们将数据库服务器安装到本机，所以保持默认即可。如果要安装到其他机器，可以输入其他机器的名称。
<p>![2015-05-27_21-49-39](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_21-49-39.png "2015-05-27_21-49-39")
<p>&nbsp;&nbsp;&nbsp; 依然保持默认即可，进入下一步。
<p>![2015-05-27_21-50-29](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_21-50-29.png "2015-05-27_21-50-29")
<p>&nbsp;&nbsp;&nbsp; 安装程序检查必须的组件是否安装完毕，进入下一步。
<p>![2015-05-27_21-51-07](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_21-51-07.png "2015-05-27_21-51-07")
<p>&nbsp;&nbsp;&nbsp; 开始安装数据库服务器。
<p>![2015-05-27_21-51-31](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_21-51-31.png "2015-05-27_21-51-31")
<p>&nbsp;&nbsp;&nbsp; 稍等片刻，数据库服务器就已经安装完毕。
<p>![2015-05-27_22-12-41](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_22-12-41.png "2015-05-27_22-12-41")
<p>&nbsp;&nbsp;&nbsp; 接着，我们安装AOS和客户端。在此选择安装组件，选中AOS和客户端的CheckBox，进入下一步。
<p>![2015-05-27_22-15-07](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_22-15-07.png "2015-05-27_22-15-07")
<p>&nbsp;&nbsp;&nbsp; 安装程序会检查必要的组件是否安装完毕，进入下一步。
<p>![2015-05-27_22-15-42](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_22-15-42.png "2015-05-27_22-15-42")
<p>&nbsp;&nbsp;&nbsp; 因为我们要在本机安装AOS，所以保持默认即可。
<p>![2015-05-27_22-16-05](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_22-16-05.png "2015-05-27_22-16-05")
<p>&nbsp;&nbsp;&nbsp; 依然保持默认，进入下一步。
<p>![2015-05-27_22-16-35](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_22-16-35.png "2015-05-27_22-16-35")
<p>&nbsp;&nbsp;&nbsp; 输入上一节中，创建的域账号。
<p>![2015-05-27_22-17-52](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_22-17-52.png "2015-05-27_22-17-52")
<p>&nbsp;&nbsp;&nbsp; 选中在桌面创建客户端快捷方式，进入下一步。
<p>![2015-05-27_22-18-24](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_22-18-24.png "2015-05-27_22-18-24")
<p>&nbsp;&nbsp;&nbsp; 安装程序再次检查必要的组件是否安装完毕，进入下一步。
<p>![2015-05-27_22-18-56](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_22-18-56.png "2015-05-27_22-18-56")
<p>&nbsp;&nbsp;&nbsp; 终于开始安装了。
<p>![2015-05-27_22-19-16](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_22-19-16.png "2015-05-27_22-19-16")
<p>&nbsp;&nbsp;&nbsp; AOS的安装也是分分钟就安装好了，点击完成。
<p>![2015-05-27_22-21-43](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_22-21-43.png "2015-05-27_22-21-43")
<p>&nbsp;&nbsp;&nbsp; 安装完毕后，重启下服务器。
<p>&nbsp;&nbsp;&nbsp; 本节Reinhard主要讲解了如何安装数据库服务器，AOS和客户端，因为前期准备工作已经做好，到这里已经相当简单，只需保持默认安装即可。在下一节中，Reinhard要讲解如何做安装后的编译和配置工作。
<p>&nbsp;&nbsp;&nbsp; 喜欢本系列的同学，请点个赞哦。
