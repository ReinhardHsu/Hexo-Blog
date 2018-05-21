---
title: Software Development 使用Webhook将 Github 持续部署到 VPS
date: 2018-05-12 23:29:21
categories:
- Software Development
tags:
- Blog
- VPS
- Auto Deploy
- Webhook
- Github Pages
- Continuous Deployment
---

[ReinhardHsu](http://reinhardhsu.com/) 做个人空间、搭网站也有些年头了。

## 折腾的心

### 2003 ASP个人空间

一开始使用的是免费空间，那时还在读初中，大概在2003年左右吧。找一些asp的整站代码，修修改改，用ftp工具上传到空间上。记得后来有一阵子流行韩国Flash站，又去折腾Flash去了。这期间没什么正儿八经地写出点什么东西，细细想想主要是折腾建站技术吧。

### 2005 和讯财经博客

后来有了博客这么个东西，那时还在读高中，新浪博客正火。[ReinhardHsu](http://reinhardhsu.com/) 没有在新浪注册博客，反而跑去和讯开了一个，可能是因为那阵子老爸正炒股，天天逛和讯的缘故吧。在和讯上发了些不疼不痒的博文，就没有然后了。

### 2007 CSDN博客

读大学后，因为学的软件工程的缘故，每期《电脑报》、《程序员》都在看，不知怎么地就注册了一个CSDN的博客，还把状态改成"专攻C++ ing"。好吧，至今一篇像样的文章也没发。

### 2012 [博客园](https://www.cnblogs.com)博客

工作后，因为使用的 DotNet ，就开始混 [博客园](https://www.cnblogs.com) 了。社区里有不少大神，对 [ReinhardHsu](http://reinhardhsu.com/)  影响非常大，从那时起 [ReinhardHsu](http://reinhardhsu.com/)  就开始在 [博客园](https://www.cnblogs.com) 上安家，专心写技术博。

### 2014 VPS + WordPress

不知从什么时候开始，Google 越来越调皮了，以至于经常访问不了。为了连接自由世界， [ReinhardHsu](http://reinhardhsu.com/) 购买了日本的 vps 做了个小梯子。那个 vps 配置还行，想想只拿来做梯子太浪费了，不如搭个个人网站吧。这不，刚安心写了几年技术博，就又开始折腾了。

### 2016 Github Pages

与动态网站相比， [ReinhardHsu](http://reinhardhsu.com/) 觉得在个人网站这个场景，静态网站更有优势。于是就折腾各种技术，将 WordPress 静态化、加 CDN 镜像等。

这年 [ReinhardHsu](http://reinhardhsu.com/) 学会了 Markdown ，但是 WrodPress 死活不支持。按照静态化的思路， [ReinhardHsu](http://reinhardhsu.com/) 找到了一个静态网站生成器——Hexo，直接托管在Github Pages上，连vps都省了。

说干就干， [ReinhardHsu](http://reinhardhsu.com/) 把WordPress上的博文都迁移了过来。

虽然写了一些博文发上去，但是始终因为git不熟，用着有些别扭。

### 2017 回归[博客园](https://www.cnblogs.com)

建个人网站不难，难的是推广。[ReinhardHsu](http://reinhardhsu.com/) 意识到博客的意义在于自己写了什么东西，而不是折腾那些有的没的。于是就关掉 vps 上的个人网站，继续用 Markdown 写[博客园](https://www.cnblogs.com)的博客。

### 2018 Github Pages

好吧， [ReinhardHsu](http://reinhardhsu.com/) 又开始折腾了。

学习了 git 后， [ReinhardHsu](http://reinhardhsu.com/) 决心把Github Pages搞起来，以后所有的博文都放在这里了。

但是 Github Pages 把百度爬虫给拒绝了，导致个人主页没什么流量。

查了一些文章，发现可以给百度爬虫单独做一个镜像站。于是就有了这篇文章。

## 百度无法爬取 Github Pages 的解决方案

利用梯子的vps，放一个 Github Pages 个人主页的镜像，然后将来自百度爬虫流量的解析那台vps上。

这个镜像其实是只给百度看的，让百度帮我们建立网站的索引。

用户点击百度搜索结果，这部分流量还是会被解析到 Github Pages 。

每次push到github后，还要到vps上pull一下，实在是太麻烦了，能不能让vps一直自动保持与github一致呢？

## 持续部署

答案是肯定有，这个技术就叫持续部署。

原理是利用 Github 的 WebHook，在push的时候提醒vps 及时更新本地仓库。这里在vps上没必要做Fetch，只要pull就够了，因为不会在vps上提交，所以不涉及merge的问题。