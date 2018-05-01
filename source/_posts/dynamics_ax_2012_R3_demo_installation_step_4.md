---
title: Dynamics AX 2012 R3 Demo 安装与配置 – 导入测试数据 (Step 4)
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-06-12 08:14:57
---

![2015-05-28_22-50-28](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_22-50-28.png "2015-05-28_22-50-28")
<p>&nbsp;&nbsp;&nbsp; 在前面三节中，Reinhard分别讲解了[如何配置安装环境](http://reinhardhsu.com/dynamics-ax-2012-r3-demo-安装与配置-配置安装环境-step-1/)，[安装数据库服务器，AOS和客户端](http://reinhardhsu.com/dynamics-ax-2012-r3-demo-安装与配置-安装数据服务器、aos和客户端-step-2/)，[安装后的编译和配置](http://reinhardhsu.com/dynamics-ax-2012-r3-demo-安装与配置-编译和配置-step-3/)。如果一直跟随Reinhard的脚步，到这里，已经拥有一个没有数据的系统。
<p>&nbsp;&nbsp;&nbsp; 本节，Reinhard将要讲解怎样导入微软提供的测试数据。
<p>&nbsp;&nbsp;&nbsp; 首先，将AOS服务停止运行。进入计算机管理，服务，选中AOS服务，右键点击停止。稍等片刻，AOS服务已经停止运行。
<p>![2015-05-28_22-10-40](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_22-10-40.png "2015-05-28_22-10-40")
<p>&nbsp;&nbsp;&nbsp; 接着，Reinhard要将当前空数据库进行备份，避免因导入测试数据失败造成的损失。
<p>&nbsp;&nbsp;&nbsp; 进入数据库管理系统中，在MicrosoftDynamicsAX数据库上点击备份。
<p>![2015-05-28_22-12-11](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_22-12-11.png "2015-05-28_22-12-11")
<p>&nbsp;&nbsp;&nbsp; 备份类型选择完整备份，选择备份文件存放的位置。
<p>![2015-05-28_22-13-36](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_22-13-36.png "2015-05-28_22-13-36")
<p>&nbsp;&nbsp;&nbsp; 在介质选项标签页中，Reinhard选择覆盖所有现有备份集，在可靠性中，Reinhard选择完成后验证备份，避免保存一个损坏的备份。
<p>![2015-05-28_22-14-08](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_22-14-08.png "2015-05-28_22-14-08")
<p>&nbsp;&nbsp;&nbsp; 点击确定，分分钟就备份好了。
<p>&nbsp;&nbsp;&nbsp; 接着，我们解压微软提供的测试数据，选择存放位置，点击安装。
<p>![2015-05-28_22-04-37](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_22-04-37.png "2015-05-28_22-04-37")
<p>&nbsp;&nbsp;&nbsp; 然后，要安装微软提供的测试数据导入工具。
<p>![2015-05-28_22-05-16](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_22-05-16.png "2015-05-28_22-05-16")
<p>&nbsp;&nbsp;&nbsp; 安装完毕后，需要用管理员身份运行命令提示符。
<p>![2015-05-28_22-02-57](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_22-02-57.png "2015-05-28_22-02-57")
<p>&nbsp;&nbsp;&nbsp; 进入测试数据导入工具的安装目录。
<p>![2015-05-28_22-06-29](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_22-06-29.png "2015-05-28_22-06-29")
<p>&nbsp;&nbsp;&nbsp; 运行 DP.exe import [测试数据目录] [数据库名] [计算机名]&nbsp;
<p>![2015-05-28_22-08-23](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_22-08-23.png "2015-05-28_22-08-23")
<p>&nbsp;&nbsp;&nbsp; 输入 y ，确认导入。
<p>![2015-05-28_22-14-50](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_22-14-50.png "2015-05-28_22-14-50")
<p>&nbsp;&nbsp;&nbsp; 开始导入，大概需要一个小时，可以去休息下了。
<p>![2015-05-28_22-15-24](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_22-15-24.png "2015-05-28_22-15-24")
<p>&nbsp;&nbsp;&nbsp; 导入完成后，重启计算机。
<p>&nbsp;&nbsp;&nbsp; 打开客户端，可以看到，测试数据已经导入成功。
<p>![2015-05-28_23-25-15](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_23-25-15.png "2015-05-28_23-25-15")
<p>&nbsp;&nbsp;&nbsp; 如果有微软提供的 Dynamics AX 2012 R3 的测试许可证，可以将许可证导入。进入系统管理，点击许可证信息，加载许可证文件，确认同步表。
<p>![2015-05-28_23-26-46](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_23-26-46.png "2015-05-28_23-26-46")
<p>&nbsp;&nbsp;&nbsp; 导入许可证完毕后，提示如下信息。
<p>![2015-05-28_23-44-40](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_23-44-40.png "2015-05-28_23-44-40")
<p>&nbsp;&nbsp;&nbsp; 进入开发界面，输入以下代码，系统已经能够正常运行。
<p>![2015-05-29_00-16-12](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-29_00-16-12.png "2015-05-29_00-16-12")
<p>&nbsp;&nbsp;&nbsp; 至此，Microsoft Dynamics AX 2012 R3 Demo 的安装配置工作已经完毕。本系列的教程也已经接近尾声。如果同学们遇到什么问题，也欢迎与Reinhard一起交流。
<p>&nbsp;&nbsp;&nbsp; 后续如果有机会，Reinhard将为大家深入讲解各个业务模块。
