---
title: '[译]Dynamics AX 2012 R2 BI系列-规划分析的注意事项'
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
- Data Analysis
date: 2015-10-09 16:32:54
---

[<span style="font-family: 微软雅黑; font-size: large;">https://msdn.microsoft.com/en-us/library/gg731898.aspx</span>](https://msdn.microsoft.com/en-us/library/gg731898.aspx)

&nbsp;

<span style="font-family: 微软雅黑; font-size: large;">    在开始实施AX的分析特性前，有很多事情要考虑。本文描述了你必须考虑的事情，和在规划过程中每一步你必须做的决定。</span>

## <span style="font-family: 微软雅黑;">1、验证必备项</span>

## <span style="font-family: 微软雅黑;">2、明确拓扑结构</span>

<span style="font-family: 微软雅黑; font-size: large;">    要帮助你的AX实施规划，明确一个支持你组织需求的拓扑结构。明确拓扑结构时，考虑下面的信息。</span>

<span id="more-542"></span>

### <span style="font-family: 微软雅黑;">2.1、性能注意事项</span>

<span style="font-family: 微软雅黑; font-size: large;">    要确保AX的OLTP(Online Transaction Processing)数据库能够很好得运行，我们建议你将分析服务安装在一个专用的服务器上。</span>

&nbsp;

### <span style="font-family: 微软雅黑;">2.2、高可用性</span>

<span style="font-family: 微软雅黑; font-size: large;">    靠可用性是一种提供最小中断服务的能力。你可以通过使用NLB(Network Load Balancing)，故障转移集群(Failover Clustering)技术等，在高可用的环境中实施分析服务。</span>

*   <span style="font-family: 微软雅黑; font-size: large;">网络负载均衡-你可以使用网络负载均衡来提升查询的相应时间。网络负载均衡，也成为向外扩展，将负载分配到几个小型服务器。</span>
*   <span style="font-family: 微软雅黑; font-size: large;">故障转移集群-一个故障转移集群，是一个或多个节点或服务器的结合，有多个共享的磁盘。一个SQL Server故障转移集群实例，在网络上显示为一个单一计算机。然而，该实例有故障转移的功能，如果当前节点不可用，可以转移到另一个节点。</span>

&nbsp;

### <span style="font-family: 微软雅黑;">2.3、AlwaysOn</span>

<span style="font-family: 微软雅黑; font-size: large;">    SQL Server AlwaysOn 是一种高可用和灾难恢复解决方案（Disaster Recovery Solution），在SQL Server 2012和2014中提供。你可以在AlwaysOn环境中实施分析服务数据库：</span>

*   <span style="font-family: 微软雅黑; font-size: large;">减少对主AX OLTP的加载</span>
*   <span style="font-family: 微软雅黑; font-size: large;">减少Cube和Cube-based Report和KPIs(Key Performance Indicators)的数据延迟</span>

<span style="font-family: 微软雅黑; font-size: large;">    要在AlwaysOn环境中实施分析服务数据库，要完成下面的任务：</span>

1.  <span style="font-family: 微软雅黑; font-size: large;">创建一个AX OLTP数据库的只读拷贝</span>
2.  <span style="font-family: 微软雅黑; font-size: large;">将分析服务数据库的数据源，指向第一步创建的数据库。可以这样做：</span>

    1.  <span style="font-family: 微软雅黑; font-size: large;">在SSMS中，连接到你的分析服务实例</span>
    2.  <span style="font-family: 微软雅黑; font-size: large;">在树形图中，展开数据库&gt;数据源节点</span>
    3.  <span style="font-family: 微软雅黑; font-size: large;">在Dynamics DataBase数据源上右键，选择属性</span>
    4.  <span style="font-family: 微软雅黑; font-size: large;">在连接字符串一行，定位到文本Initial Catalog=[数据库名字]</span>
    5.  <span style="font-family: 微软雅黑; font-size: large;">改变数据库名字到第一步创建的那个数据库上</span>

&nbsp;

## <span style="font-family: 微软雅黑;">3、明确AX提供的Cube是否能满足你的需求</span>

<span style="font-family: 微软雅黑; font-size: large;">    你可以使用AX提供的Cube，也能修改它。</span>

&nbsp;

## <span style="font-family: 微软雅黑;">4、明确你将使用哪个配置键</span>

<span style="font-family: 微软雅黑; font-size: large;">    AX包含的默认Cube，需要你启用特定的配置键。如果你禁用了Cube必须的配置键，你必须完成下面的任务：</span>

1.  <span style="font-family: 微软雅黑; font-size: large;">运行分析服务项目向导，移除不在可用（因为配置键被禁用）的测量，维度，和KPI。</span>
2.  <span style="font-family: 微软雅黑; font-size: large;">修改或移除需要该配置键的报表</span>

&nbsp;

## <span style="font-family: 微软雅黑;">5、理解数据分区是如何影响Cube部署的</span>

<span style="font-family: 微软雅黑; font-size: large;">    AX R2和R3通过数据分区来隔离数据。例如，一个组织有多个子公司。如果组织管理者不希望这个子公司的员工访问另一个子公司的数据，数据分区可以为数据隔离提供必要的边界。</span>

<span style="font-family: 微软雅黑; font-size: large;">    如果你的AX安装了多个数据分区，你必须为每个分区部署Cube。例如，假设你有两个数据分区，分区1和分区2。你必须为每个分区部署Cube。这意味着你有一个总账Cube是给分区1的，还有另一个单独的总账Cube是给分区2的。</span>

&nbsp;

## <span style="font-family: 微软雅黑;">6、学习安全模型</span>

<span style="font-family: 微软雅黑; font-size: large;">    Cube的安全设置，与AX的安全设置相独立。要让用户访问Cube，你必须将用户分配到分析服务的数据库角色中。</span>

<span style="font-family: 微软雅黑; font-size: large;">    如果你部署的是AX包含的Cube，当你部署Cube时，会在数据库中创建默认角色。这些角色与AX众的安全角色相对应。例如，如果你分配一个用户到AX中的Accountant角色，你应该分配相同的用户到分析服务中的Accountant角色。</span>

<table border="5" width="600" cellspacing="0" cellpadding="2">
<tbody>
<tr>
<td valign="top" width="600"><span style="font-family: 微软雅黑; font-size: large;">重点</span></td>
</tr>
<tr>
<td valign="top" width="600"><span style="font-family: 微软雅黑; font-size: large;">在分析服务中分配用户角色时，牢记下面的信息： </span></p>

<span style="font-family: 微软雅黑; font-size: large;">角色成员有权限浏览该角色能访问的Cube中的所有数据。例如，如果你分配一个用户到Project Supervisor角色，该用户将可以访问Project Accounting Cube中的所有数据。 </span>

<span style="font-family: 微软雅黑; font-size: large;">分析服务中创建的默认角色，不会和AX众的安全角色同步。例如，如果你修改了AX中的Accountant角色的权限，不会影响分析服务中的Accountant角色。</span></td>
</tr>
</tbody>
</table>
<p>&nbsp;

## <span style="font-family: 微软雅黑;">7、明确你想要多长时间处理一次Cube</span>

<span style="font-family: 微软雅黑; font-size: large;">    一个Cube包含历史的，或缓存的数据。要在Cube中刷新这些数据，你必须处理Cube。明确多长时间处理一次Cube。考虑这些，当一个Cube被处理时，它会访问AX OLTP数据库中的数据。因此，处理可能会影响该数据库的性能。</span>

&nbsp;

## <span style="font-family: 微软雅黑;">8、明确你想如何显示Cube数据</span>

<span style="font-family: 微软雅黑; font-size: large;">    你可以以多种方式显示Cube数据，例如在SSRS 报表中，KPIs中，和Excel中。</span>