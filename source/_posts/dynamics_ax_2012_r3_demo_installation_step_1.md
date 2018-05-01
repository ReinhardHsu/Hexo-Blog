---
title: Dynamics AX 2012 R3 Demo 安装与配置 – 配置安装环境 (Step 1)
categories:
- Microsoft Dynamics AX
tags:
  - Microsoft Dynamics AX
date: 2015-05-30 08:38:46
---

[![2015-05-27_23-25-52](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_23-25-52_thumb1.png "2015-05-27_23-25-52")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_23-25-521.png)

&nbsp;&nbsp;&nbsp; AX 2012 R3 发布后，Reinhard一直想体验一把，可是Reinhard所在的公司暂时不会升级到R3版本。这不，Reinhard就打算在个人电脑上安装下，可是安装的过程中，遇到了很多问题，Reinhard就想着不如写个系列教程吧，一方面纪录下来，另一方面可以帮助其他需要安装的同学。同学们可以跟随着Reinhard的这个系列教程一起来。 [![Image](http://reinhardhsu.com/wp-content/uploads/2015/05/Image_thumb1.gif "Image")](http://reinhardhsu.com/wp-content/uploads/2015/05/Image1.gif)

&nbsp;&nbsp;&nbsp; 系列教程规划如下：

*   Step 1：配置安装环境
<li>Step 2：安装数据服务器、AOS和客户端
<li>Step 3：编译和配置
<li>Step 4：导入测试数据

&nbsp;&nbsp;&nbsp; Reinhard第一步，先从配置安装环境开始。

&nbsp;&nbsp;&nbsp; 通过仔细阅读微软提供的Dynamics AX 2012 系统安装需求（[Microsoft Dynamics AX 2012 System Requirements](https://www.microsoft.com/en-us/download/details.aspx?id=11094)），Reinhard发现AX 2012 R3需要使用Win2012和MSSQL2014。这里Reinhard使用Win2012R2和MSSQL2014。根据Reinhard的安装配置经验，计算机配置最好拥有4G以上内存，120G以上的磁盘可用空间。

&nbsp;&nbsp;&nbsp; 相信大部分同学对微软家的操作系统和数据库的安装已经很熟悉，Reinhard这里就不再啰嗦了，还不清楚的同学可以百度下。Reinhard觉得唯一需要提醒的地方是，在安装数据库时使用混合认证模式，可以避免很多不必要的麻烦。

&nbsp;&nbsp;&nbsp; 操作系统和数据库安装完毕后，下一步，是安装域控制器。Dynamics AX 2012 是基于Windows认证模式的，所以服务器必须要加入到域环境。但是大部分同学的个人电脑，都没有加入到域环境中。为了将个人电脑加入域环境，Reinhard费劲九牛二虎之力，爬遍谷歌百度，曾找到过一篇博文，介绍怎么加入到AX 2012 Demo VM的Contoso域中，Reinhard也成功地加入到了Contoso域中，但是这种方法太过麻烦，而且要运行一个虚拟机，太耗资源，相信大部分同学的个人电脑跑不动，Reinhard最后放弃了该方案。

&nbsp;&nbsp;&nbsp; 既然无法加入到别人的域环境中，Reinhard就想，不如自己建一个域控制器吧，既简单，又方便，而且易于维护。Reinhard啰嗦了半天，各位看官不要拍砖，干货下面就来。

&nbsp;&nbsp;&nbsp; 首先打开服务器管理器，添加角色和功能。

[![2015-05-27_13-49-57](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_13-49-57_thumb1.png "2015-05-27_13-49-57")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_13-49-571.png)

&nbsp;&nbsp;&nbsp; 点下一步

[![2015-05-27_13-53-06](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_13-53-06_thumb1.png "2015-05-27_13-53-06")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_13-53-061.png)

&nbsp;&nbsp;&nbsp; 选择服务器，下一步

[![2015-05-27_13-53-37](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_13-53-37_thumb1.png "2015-05-27_13-53-37")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_13-53-371.png)

&nbsp;&nbsp;&nbsp; 选择域服务的CheckBox，在弹出窗体中，点击添加功能。

[![2015-05-27_19-31-26](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-31-26_thumb1.png "2015-05-27_19-31-26")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-31-261.png)

&nbsp;&nbsp;&nbsp; 继续下一步，安装完毕，点关闭。

[![2015-05-27_19-48-03](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-48-03_thumb1.png "2015-05-27_19-48-03")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-48-031.png)

&nbsp;&nbsp;&nbsp; 在服务器管理器右上角找到黄色小旗子，点击它，将服务器提升为域控制器。

[![2015-05-27_19-48-38](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-48-38_thumb1.png "2015-05-27_19-48-38")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-48-381.png)

&nbsp;&nbsp;&nbsp; 选择添加新林，设置跟域名，点击下一步。

[![2015-05-27_19-49-49](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-49-49_thumb1.png "2015-05-27_19-49-49")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-49-491.png)

&nbsp;&nbsp;&nbsp; 设置密码，点下一步。

[![2015-05-27_19-54-04](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-54-04_thumb1.png "2015-05-27_19-54-04")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-54-041.png)

&nbsp;&nbsp;&nbsp; 保持默认值，点击下一步。

[![2015-05-27_19-55-33](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-55-33_thumb1.png "2015-05-27_19-55-33")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-55-331.png)

&nbsp;&nbsp;&nbsp; 安装位置保持默认即可，点击下一步。

[![2015-05-27_19-56-14](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-56-14_thumb1.png "2015-05-27_19-56-14")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-56-141.png)

&nbsp;&nbsp;&nbsp; 确认配置信息，点击下一步。

[![2015-05-27_19-56-39](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-56-39_thumb1.png "2015-05-27_19-56-39")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-56-391.png)

&nbsp;&nbsp;&nbsp; 开始安装。

[![2015-05-27_19-58-59](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-58-59_thumb1.png "2015-05-27_19-58-59")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_19-58-591.png)

&nbsp;&nbsp;&nbsp; 安装完毕后，重启服务器，再次进入到服务器管理器中，在域中添加一个新用户，用于以后登陆系统。

[![2015-05-27_20-14-04](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-14-04_thumb1.png "2015-05-27_20-14-04")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-14-041.png)

&nbsp;&nbsp;&nbsp; 在用户上点右键，新建用户。

[![2015-05-27_20-14-52](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-14-52_thumb1.png "2015-05-27_20-14-52")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-14-521.png)

&nbsp;&nbsp;&nbsp; 录入用户的基本信息，点击下一步。

[![2015-05-27_20-15-39](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-15-39_thumb1.png "2015-05-27_20-15-39")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-15-391.png)

&nbsp;&nbsp;&nbsp; 输入该用户的登陆密码，设置密码永不过期。

[![2015-05-27_20-16-17](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-16-17_thumb1.png "2015-05-27_20-16-17")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-16-171.png)

&nbsp;&nbsp;&nbsp; 确认配置信息，点击完成后，用户就创建成功了。

[![2015-05-27_20-16-43](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-16-43_thumb1.png "2015-05-27_20-16-43")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-16-431.png)

&nbsp;&nbsp;&nbsp; 接着将改用户添加到域管理员组中。

[![2015-05-27_20-18-49](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-18-49_thumb1.png "2015-05-27_20-18-49")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-18-491.png)

&nbsp;&nbsp;&nbsp; 录入Admin，点击检查名称，系统自动补全用户组的全称。点击确定。该用户久已经称为域管理员了。

[![2015-05-27_20-19-28](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-19-28_thumb1.png "2015-05-27_20-19-28")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-19-281.png)

&nbsp;&nbsp;&nbsp; 接着，我们为该用户配置访问数据库的权限。用密码登陆到数据库管理系统中。

[![2015-05-27_20-21-33](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-21-33_thumb1.png "2015-05-27_20-21-33")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-21-331.png)

&nbsp;&nbsp;&nbsp; 新建登陆名。

[![2015-05-27_20-22-02](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-22-02_thumb1.png "2015-05-27_20-22-02")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-22-021.png)

&nbsp;&nbsp;&nbsp; 选中Windows身份认证，点击搜索，录入Reinhard，点击检查名称。系统会自动补全用户名，点击确定。

[![2015-05-27_20-23-50](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-23-50_thumb1.png "2015-05-27_20-23-50")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-23-501.png)

&nbsp;&nbsp;&nbsp; 进入服务器角色，为该用户赋予系统管理员的角色。

[![2015-05-27_20-24-25](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-24-25_thumb1.png "2015-05-27_20-24-25")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-24-251.png)

&nbsp;&nbsp;&nbsp; 这样已经运行环境已经配置完毕了。我们注销用户，使用刚刚建立的域用户重新登陆到系统中。

[![2015-05-27_20-25-46](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-25-46_thumb1.png "2015-05-27_20-25-46")](http://reinhardhsu.com/wp-content/uploads/2015/05/2015-05-27_20-25-461.png)

&nbsp;&nbsp;&nbsp; 本节Reinhard主要讲解了安装AX2012R3前的环境配置。下一节，Reinhard就要开始安装数据库服务器、AOS和客户端。

&nbsp;&nbsp;&nbsp; 喜欢本系列的同学，请点个赞哦。
