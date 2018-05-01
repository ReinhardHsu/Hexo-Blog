---
title: Dynamics AX 2012 R2 AIF No Endpoint Behavior Named clientEndpointBehavior
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-12-22 09:06:41
---

[![Image[4]](http://reinhardhsu.com/wp-content/uploads/2015/12/Image4_thumb.png "Image[4]")](http://reinhardhsu.com/wp-content/uploads/2015/12/Image4.png)

&nbsp;

<span style="font-size: large;">最近，[Reinhard](http://reinhardhsu.com)在使用Http Adapter类型的AIF入站端口时，总是报以下错误：</span>

&nbsp;

> ### Server Error in &#8216;/MicrosoftDynamicsAXAif60&#8217; Application.
>
> * * *
>
> ###
>
> #### _Configuration Error_
>
> **Description: **An error occurred during the processing of a configuration file required to service this request. Please review the specific error details below and modify your configuration file appropriately.**Parser Error Message: **There is no endpoint behavior named &#8216;clientEndpointBehavior&#8217;.

<span id="more-552"></span>

<span style="font-size: large;">[Reinhard](http://reinhardhsu.com)分析，问题可能出在系统自动生成的web.config文件（以下称为A文件）上。现在要找到一个能正常使用的Http Adapter类型的web.config文件（以下称为B文件），做个对比。</span>

&nbsp;

[![Image](http://reinhardhsu.com/wp-content/uploads/2015/12/Image_thumb.png "Image")](http://reinhardhsu.com/wp-content/uploads/2015/12/Image.png)

&nbsp;

<span style="font-size: large;">    打开B文件，[Reinhard](http://reinhardhsu.com)发现85行之前的内容，都是与具体项目无关的通用模板内容。问题恰恰就出在这里。经过对比，[Reinhard](http://reinhardhsu.com)发现A文件与B文件的通用模板内容不一样。</span>

&nbsp;

[![Image](http://reinhardhsu.com/wp-content/uploads/2015/12/Image_thumb1.png "Image")](http://reinhardhsu.com/wp-content/uploads/2015/12/Image1.png)

&nbsp;

<span style="font-size: large;">    具体是什么原因导致的系统自动生成的web.config文件内容变了，[Reinhard](http://reinhardhsu.com)还无法得知。</span>

<span style="font-size: large;">    不过如果你非常着急地想解决这个问题的话，不妨试试这个方法：**用B文件86行之前的内容，替换A文件49行之前的内容，然后再重启下IIS站点**，应该就可以咯。</span>

<span style="font-size: large;">    [Reinhard](http://reinhardhsu.com)修复完毕后，重新打开浏览器，现在服务可以正常调用了。</span>

&nbsp;

[![Image](http://reinhardhsu.com/wp-content/uploads/2015/12/Image_thumb2.png "Image")](http://reinhardhsu.com/wp-content/uploads/2015/12/Image2.png)
