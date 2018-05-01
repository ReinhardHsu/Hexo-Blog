---
title: Dynamics AX 2012 R3 Demo 安装与配置 – 编译和配置 (Step 3)
categories:
- Microsoft Dynamics AX
tags:
  - Microsoft Dynamics AX
date: 2015-06-09 16:29:50
---

<font size="4">![2015-05-28_23-00-05](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_23-00-05.png "2015-05-28_23-00-05")</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 在前两节中，Reinhard主要讲解了如何配置安装环境，安装数据库服务器，AOS和客户端。至此安装工作已经结束，下面Reinhard开始讲解如何编译和配置。</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 运行客户端后，系统弹出初始化核对清单。将生命周期服务和客户反馈选项标记为完成。点击编译应用程序。编译的过程中，窗体可能处于无法响应的假死状态，也不要关闭。这个过程比较漫长，根据你的计算机硬件配置，可能需要四五个小时。去休息一下吧。</font>
<p><font size="4">![2015-05-27_22-52-37](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-27_22-52-37.png "2015-05-27_22-52-37")</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 当编译完成后，点击编译为DotNet框架通用中间语言。这个过程也比较漫长，大概需要一个小时，期间窗口处于假死状态，大家不要乱点，可以去休息一下。</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 编译完毕后，系统会给出提示。点击关闭。</font>
<p><font size="4">![2015-05-28_20-59-53](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_20-59-53.png "2015-05-28_20-59-53")</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 因为Reinhard一会儿要导入测试数据，所以先将提供许可证和配置应用程序标记为完成。</font>
<p><font size="4">![2015-05-28_21-01-33](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_21-01-33.png "2015-05-28_21-01-33")</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 点击修改数据类型，修改系统字段的长度。因为Reinhard是用于测试用途，所以这里保持默认即可。</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 稍等片刻，点击同步数据库。这个过程可能要半个小时。去休息一下好了。</font>
<p><font size="4">![2015-05-28_21-02-18](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_21-02-18.png "2015-05-28_21-02-18")</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 休息回来，继续配置。因为Reinhard一会儿要导入测试数据，所以将创建分区和初始化用户配置文件标记为完成。</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; AIF暂时也用不到，所以标记为完成，待以后用的时候Reinhard再进行配置。</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 点击配置系统账户。</font>
<p><font size="4">![2015-05-28_21-46-13](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_21-46-13.png "2015-05-28_21-46-13")</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 输入BC代理账户和同步服务账户，Reinhard这里默认都使用第一节里创建的域账户。点击确定。</font>
<p><font size="4">![2015-05-28_21-49-41](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_21-49-41.png "2015-05-28_21-49-41")</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 点击配置分区账户，这里Reinhard也使用第一节里创建的域账户。</font>
<p><font size="4">![2015-05-28_21-52-19](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_21-52-19.png "2015-05-28_21-52-19")</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 点击常见引用数据，稍等片刻。</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 因为Reinhard一会儿要导入的测试数据中，包含法人，所以将创建法人标记为完成。</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 点击设置系统参数，将系统语言设置为中文。</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 后面Reinhard会用测试数据导入工具，进行测试数据的导入，所以将导入数据标记为完成。</font>
<p><font size="4">![2015-05-28_21-57-11](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_21-57-11.png "2015-05-28_21-57-11")</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 重启系统，打开AX客户端，即可看到熟悉的界面。现在系统中还没有数据。</font>
<p><font size="4">![2015-05-28_22-00-40](http://reinhardhsu.com/wp-content/uploads/2015/06/2015-05-28_22-00-40.png "2015-05-28_22-00-40")</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 本节，Reinhard主要讲解了如何进行安装后的编译和配置工作。下节，Reinhard将讲解如何进行测试数据的导入。</font>
<p><font size="4">&nbsp;&nbsp;&nbsp; 喜欢本系列的同学，请点个赞哦。</font>
<p><font size="4"></font>
