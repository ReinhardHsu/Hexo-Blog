---
title: Dynamics AX 2012 R2 Transcation RollBack Bug Inside Aif Customer Service
categories:
- Microsoft Dynamics AX
tags:
- Microsoft Dynamics AX
date: 2015-01-14 09:04:35
---

我在一个Customer Service里的一个Method中，发现一个Transcation RollBack Bug。先看该Method的代码：

```c#
[SysEntryPointAttribute(true)]
public void SomeMethod()
{
	ttsbegin;
		createJournalTable;
		createJournalLine;
	ttsend;
	try
	{
		//throw error inside postJournalTable
		throw error('some error message');
	}
	catch
	{
		//Could not catch Exception::Error
	}
}

```

在这个Method中，有一个创建Journal的Transcation，在Transcation外面，有一个 Try Catch Block，用于捕获Exception。

我发现如果Exception是Error类型的话，我的Try Catch Block是捕捉不到的。会导致Whole Method RollBack。也就是说，Journal不会被创建。

如果Exception的类型是Error以外的类型，我的Try Catch Block可能捕捉得到。In this case，Journal 可以被创建。

我查了很多资料，Some Guy 说，是因为Aif Framework Core Code中，有一个Big Transcation导致的。

在我的例子里，我要在Try Catch Block中执行PostJournal操作。我不是很关心该操作的执行结果——成功，还是失败。但是该操作如果产生Error类型的Exception的话，会导致Whole Method RollBack，Journal也不会被创建。

解决方案是，将可能导致Error的PostJournal的操作剥离出来，放到一个Batch中，定时执行。