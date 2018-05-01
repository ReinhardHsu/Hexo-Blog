---
title: Dynamics AX 2012 R2 Create A Server Cluster With Load Balancer
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-21 17:14:34
---

安装额外**AOS**的主要目的，是将它添加到集群，或用于创建批处理服务器。

1、创建集群服务器

这里，我们使用上节**[Install An Additional AOS](http://reinhardhsu.com/install-additional-aos/ "Install An Additional AOS") **中创建的**AOS**，来创建集群。

*   进入**System Administration &gt;Setup&gt;System&gt;Cluster configuration**。
*   点击**New** button。
*   输入**Cluster Name**：**MSDynAX Cluster**。
*   在**Map AOS Instances To Clusters**的表格中，将你要加入集群的**AOS**实例的**Cluster Name**列，设为**MSDynAX Cluster**。

[![Screenshot20150121145725](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121145725.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121145725.jpg)

这样就设置好了，关闭窗口。

多打开几个客户端，进入**System Administration&gt;Common&gt;User&gt;Online Users**，查看**AOS Instance Name**列。

[![Screenshot20150121145435](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121145435.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/Screenshot20150121145435.jpg)

2、安装Load Balancer

当一个集群中有两个或更多的活动**AOS**实例时，就可以使用负载均衡**AOS**了。

*   负载均衡**AOS**的安装和标准**AOS**的安装相同。
*   首先将**AOS**实例都加入集群中，除了负载均衡的**AOS**，其他AOS都先停掉。
*   在集群设置中，将负载均衡**AOS**的**Load Balancer**选中。
*   将其他**AOS**启动。

这样带负载均衡的集群服务器就建好了。
