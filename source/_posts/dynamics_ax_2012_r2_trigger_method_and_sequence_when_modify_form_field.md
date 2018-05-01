---
title: Dynamics AX 2012 R2 窗体系列 – 在窗体上修改字段时所触发的方法及其顺序
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2016-02-27 11:13:14
---

<span style="font-family: '微软雅黑 Light'; font-size: large;">    在这个系列里，[Reinhard](http://reinhardhsu.com)将和大家一起探索在AX的窗体上执行操作时，都会触发窗体、窗体数据源和表上的哪些方法，并且是以怎样的顺序触发的。</span>

<span style="font-family: '微软雅黑 Light'; font-size: large;">    这次，我们来看看在窗体上修改或录入数据的情况。图中所示的流程，是在理想情况下的完整触发过程。如果窗体控件、窗体数据源字段或表的验证方法返回False，也可能会提前结束流程。</span><span id="more-583"></span>

<span style="font-family: '微软雅黑 Light'; font-size: large;">![Unnamed QQ Screenshot20160226180410](http://reinhardhsu.com/wp-content/uploads/2016/02/Unnamed-QQ-Screenshot20160226180410.jpg "Unnamed QQ Screenshot20160226180410")</span>

1.  <span style="font-family: '微软雅黑 Light'; font-size: large;">用户在窗体上修改或录入数据后，首先触发了该字段的Form.Control.Validate()方法，如果该方法返回的是False，流程到此结束，用户修改或录入数据失败 。</span>
2.  <span style="font-family: '微软雅黑 Light'; font-size: large;">如果返回的是True，会触发Form.Control.Modified()方法。如果这个字段是窗体数据源里的字段，那么当执行到Super()时，会调用该字段在窗体数据源中的Form.Datasource.Field.Validate()方法。</span>
3.  <span style="font-family: '微软雅黑 Light'; font-size: large;">在Form.Datasource.Field.Validate()方法中，执行到Super()时，会调用表的Table.ValidateField()方法。Table.ValidateField()执行完毕后，会返回一个Boolean结果。</span>
4.  <span style="font-family: '微软雅黑 Light'; font-size: large;">接着继续执行Form.Datasource.Field.Validate()方法中Super()以下的代码。Form.Datasource.Field.Validate()方法执行完毕后，会返回一个Boolean结果。如果返回的是False，则继续执行Form.Control.Modified() 方法中Super()以下的代码。</span>
5.  <span style="font-family: '微软雅黑 Light'; font-size: large;">如果返回的是True，会调用该字段在窗体数据源中的 Form.Datasource.Field.Modified() 方法。</span>
6.  <span style="font-family: '微软雅黑 Light'; font-size: large;">在Form.Datasource.Field.Modified() 方法中，执行到Super()时，会调用表的Table.ModifiedField()方法。Table.ModifiedField ()执行完毕后，继续执行Form.Datasource.Field.Modified ()方法中Super()以下的代码。</span>
7.  <span style="font-family: '微软雅黑 Light'; font-size: large;">Form.Datasource.Field.Modified ()方法执行完毕后，继续执行Form.Control.Modified() 方法中Super()以下的代码。</span>
8.  <span style="font-family: '微软雅黑 Light'; font-size: large;">Form.Control.Modified()方法执行完毕后，会返回一个Boolean结果。如果返回的是False，用户修改或录入数据失败。</span>

<span style="font-family: '微软雅黑 Light'; font-size: large;">    需要注意的一点是，直到Form.Control.Modified()方法执行结束，修改过的数据，依然在内存中，并未持久化到数据库中。所以在做客制化开发的时候，不应在这个流程中所触发的方法里，直接执行更新数据库的操作。</span>

&nbsp;
