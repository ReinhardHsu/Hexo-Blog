---
title: Dynamics AX 2012 R2 Unchecked Cannot be Called on the Client
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-07 14:51:11
---

有一个Custom Service一直在正常使用。今天，当我尝试在JOB中以X++代码Debug Custom Service的Method时，收到以下错误提示：

> &#8216;unchecked&#8217; cannot be called on the client.
>
> 堆栈跟踪：不能对客户端调用&#8221;unchecked&#8221;。

<span id="more-103"></span>

[![error](http://reinhardhsu.com/wp-content/uploads/2015/01/error1.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/error1.jpg)

从错误提醒中，可以看到在 Custom Service的Method的 line 1处报错。我们进入到该方法中，来看看第一行写的是什么。

[![error2](http://reinhardhsu.com/wp-content/uploads/2015/01/error2.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/error2.jpg)

可以看到，第一行声明了SysEntryPointAttribute，该属性用于将Method作为WCF的Service Operation Contract曝露。参考 [axbytes](http://axbytes.blogspot.jp/ "axbytes") 的博文 [Error when debugging Services class method from X++](http://axbytes.blogspot.jp/2013/04/error-when-debugging-services-class.html "Error when debugging Services class method from X++")，通过将第一行声明注释掉，就可以在job中调用了。

报错的原因，是因为我将Custom Service Class属性中的**Run on**设为了**Called from**。在JOB中以X++代码调用该Method时，导致它**Run on Client**，从而报错。

带有SysEntryPointAttribute的Method，只能设为**Run on Server**。

[![error3](http://reinhardhsu.com/wp-content/uploads/2015/01/error3.jpg)](http://reinhardhsu.com/wp-content/uploads/2015/01/error3.jpg)

将Custom Service Class属性的**Run on**设为**Server**后，就可以从JOB中以X++代码来调试Class中的Method了。

&nbsp;
