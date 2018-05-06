---
title: Software Development MySql 中文乱码问题
date: 2013-04-13 21:58:45
categories:
- Software Development
tags:
- Software Development
- MySql
---

又一次被这个问题折腾了一晚上,现在修好了,把过程记录下来.

参考这位兄弟的文章,将

### [MySQL字符集 GBK、GB2312、UTF8区别 解决 MYSQL中文乱码问题 收藏 MySQL中涉及的几个字符集 character-set-server/default-character-set：服务器字符集，默认情况下所采用](http://www.cnblogs.com/alamps/archive/2010/03/02/1676455.html)

1. 通过 show variables like '%char%'; 查询,
2. 将除character_set_filesystem以外的都设为 utf8                (set character_set_client=utf8)
3. 删除数据集,重新配置其 每个adapter的Connection 的 ConnectionString ，后加 ;Character Set=utf8
4. 查看 每个adapter 的 Connection 的 Name 是否指向正确。
5. 修改 Web.config 中的 ConnectionString ，后加 ;Character Set=utf8
6. 测试，OK