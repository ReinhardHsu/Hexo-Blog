---
title: "Data Analysis Python操作MongoDB"
categories:
- Data Analysis
tags:
- Data Analysis
- MongoDB
- Python
date: "2016-09-28 19:01"
---
# MongoDB
其实[Reinhard](http://ReinhardHsu.com)在2012年的时候就已经接触MongoDB了，这里再来熟悉下python操作MongoDB的方法。  
这里主要使用[PyMongo](http://api.mongodb.com/python/current/tutorial.html)模块，看看官方的指南，可以了解基本的操作。

## 基本操作

```python
from pymongo import MongoClient

client=MongoClient('localhost',27017)
db=client.test_db
col=db.test_collection
```
*使用pretty()输出结果，可以看到格式化的json文档*  
*用less能更好地看输出结果*

### 查询

```python
query={"name":"a","gender":"male"}
projection={"_id":0,"name":1}
data=db.student.find(query,projection)
```
这里通过多个查询条件进行查询，并且使用投影，只查看所需的字段。id设为0，说明不获取id。返回的结果集中只有name字段。

#### 查询数组元素
MongoDB最棒的，是可以查询数组中的元素

```python
data={
  "years":[1988,1999,1990]
}
query={"years":1990}
```
含有1990的记录都会匹配到。  
如果再years字段上建立索引，速度会更快。

### 插入

#### 批量插入
```python

db.test_collection.insert_manay(data)
```
也可以使用命令行直接从json文件导入  

```python
mongoimport -d test_db -c test_collection --file student.json
```
#### 运算
常见的有下面这些，都非常简单

* $gt
* $lt
* $gte
* $lte
* $ne
* $exists
* $regex
* $in
* $all

用法如下

```python
query={"letter":{"$gt":"S","$lt":"Y"}}
query={"age":{"$gt":10,"$lt":20}}
query={"birth":{"$gt":datetime(1988,01,01),"$lt":datetime(1994,01,01)}}

#有女朋友字段的记录
query={"girlfriend":{"$exists":1}}

#没有女朋友字段的记录
query={"girlfriend":{"$exists":0}}

query={"name":{"$regex":"[Ff]riend|[Pp]ride"}}
#age包含条件中的至少一个元素，就能匹配到

query={"age":{"$in":[1988,1994]}}
#course包含条件中的所有元素，才能匹配到
query={"course":{"$all":["math","english"]}}
```
[MongoDB的正则运算](https://docs.mongodb.com/manual/reference/operator/query/regex/)  

#### 点表示法
查看大于18的名字
```python
data={"girlfriend":{
  "name":"coco",
  "age":19
}}
query={"girlfriend.age":{"$gt":18},"girlfriend.name"}
```
### 更新

#### 更新一个文档
find_one会取出匹配到的第一条记录

```python
student=db.students.find_one({"name":"reinhard"})
student["age"]=18
db.students.save(student)
```
也可以使用update，默认也只更新一条记录

```python
student=db.students.update({"name":"reinhard"},{"$set":{"age":18}})
```
*如果上面的代码中，忘记写$set，那么将会更新所有匹配到的记录！！！*  
也可以使用$unset来取消某个字段

```python
student=db.students.update({"name":"reinhard"},{"$unset":{"age":18}})
```
这样匹配到的第一条记录如果有age字段，将会删掉该字段

#### 更新多个文档

```python
student=db.students.update({"name":"reinhard"},{"$set":{"age":18}},multi=True)
```
### 删除

```python
db.students.remove({"name":"reinhard"})
db.students.remove({"name":{"$exists":0}})
#删除集合和相关的索引
db.students.drop()
```
## 分析
MongoDB的内置分析工具——聚合框架，产品定位应该对应于Hadoop的MapReduce。  
### 社交分析

社交数据分析思路：

1. 先按用户对数据进行分组
2. 统计用户的发帖数量
3. 降序排列
4. 选择顶部的用户

#### 数据结构

```python
{
    "_id" : ObjectId("5304e2e3cc9e684aa98bef97"),
    "text" : "First week of school is over :P",
    "in_reply_to_status_id" : null,
    "retweet_count" : null,
    "contributors" : null,
    "created_at" : "Thu Sep 02 18:11:25 +0000 2010",
    "geo" : null,
    "source" : "web",
    "coordinates" : null,
    "in_reply_to_screen_name" : null,
    "truncated" : false,
    "entities" : {
        "user_mentions" : [ 
        	{
        		"indices":[3,16],
        		"screen_name":"uckernaradio",
        		"name":"U",
        		"id":111
        	},
        	{
        		"indices":[3,16],
        		"screen_name":"ss",
        		"name":"bb",
        		"id":121
        	}],
        "urls" : [ ],
        "hashtags" : [ ]
    },
    "retweeted" : false,
    "place" : null,
    "user" : {
        "friends_count" : 145,
        "profile_sidebar_fill_color" : "E5507E",
        "location" : "Ireland :)",
        "verified" : false,
        "follow_request_sent" : null,
        "favourites_count" : 1,
        "profile_sidebar_border_color" : "CC3366",
        "profile_image_url" : "http://normal.jpg",
        "geo_enabled" : false,
        "created_at" : "Sun May 03 19:51:04 +0000 2009",
        "description" : "",
        "time_zone" : null,
        "url" : null,
        "screen_name" : "Catherinemull",
        "notifications" : null,
        "profile_background_color" : "FF6699",
        "listed_count" : 77,
        "lang" : "en",
        "profile_background_image_url" : "http://ac6fd4d8-full.jpg",
        "statuses_count" : 2475,
        "following" : null,
        "profile_text_color" : "362720",
        "protected" : false,
        "show_all_inline_media" : false,
        "profile_background_tile" : true,
        "name" : "Catherine Mullane",
        "contributors_enabled" : false,
        "profile_link_color" : "B40B43",
        "followers_count" : 169,
        "id" : 37486277,
        "profile_use_background_image" : true,
        "utc_offset" : null
    },
    "favorited" : false,
    "in_reply_to_user_id" : null,
    "id" : NumberLong("22819398300")
}
```
#### 基本聚合操作

* $group
* $sort
* $project
* $match
* $skip
* $limit
* $unwind，展开运算，可以将字段值的数组元素展开，方便后面对元素进行分组。

##### group和sort
```python
db.weibos.aggregate([
  {"$group":{"_id":"$user.screen_name",
    "count":{"$sum":1}}},
  {"$sort":{"count":-1}}
])
```
这里，按照网名进行分组。用户前面的$，表示了，即使加了引号，这里也不会作为字符串去解释。也就是，不要让_id等同于user.screen_name，而是将网名相同的文档分为一组。

###### 聚合管道
对数据的聚合，可以视为管道处理。聚合的过程都是在数据库端处理的，客户端只是接受一条最后的结果。  
以上面的例子来说，首先从collection加载数据，第一阶段是进行分组聚合，然后输出结果。第二进行是排序，它的数据来源就是第一阶段输出的结果。第二阶段处理完也会输出结果。
##### match和project
这里的friend是指我关注的人，follower指关注我的人。  
*project*，可以：

* 包含元文档中的字段
* 插入计算字段
* 重命名字段
* 创建自文件结构

```python
db.weibos.aggregate([
  {"$match":{"user.friends_count":{"$gt":0},
    "user.followers_count":{"$gt":0}}},
  {"$project":{"ratio":{"$divide":["$user.followers_count","$user.friends_count"]},
    "screen_name":"$user.screen_name"}},
  {"$sort":{"ratio":-1}},
  {"$limit":1}
])
```
这里divide做除法，计算比率。输出的文件类似于

```python
{
  "_id":,
  "screen_name":"reinhard",
  "ratio":19221.5
}
```
[project常用操作符](https://docs.mongodb.com/manual/reference/operator/aggregation/project/#pipe._S_project)

unwind是展开运算

```python
{
	"name":"reinhard",
	"age":18,
	"course":["math","english"]
}	
```
对course展开后，会将变成

```python
{
	"name":"reinhard",
	"age":18,
	"course":["math"]
},
{
	"name":"reinhard",
	"age":18,
	"course":["english"]
}
```
计算@别人最多次数的用户

```python
db.weibos.aggregate([
	{"$unwind":"$entities.user_mentions"},
	{"$group":{"_id":"$user.screen_name",
		"count":{"$sum":1}}},
	{"$sort":{"count":-1}},
	{"$limit":1}
])
```

如果要查看用户微博中的所有标签，并且去除重复项，可以使用$addToSet  

```python
db.weibos.aggregate([
	{"$unwind":"$entities.hashtags"},
	{"$group":{"_id":"$user.screen_name",
		"unique_hashtags":{"$addToSet":"$entities.hashtags.text"}}},
	{"$sort":{"count":-1}}
])

```

而$push与$addToSet相反，它不会去除重复项。比如汇总用户的微博  

```python
db.weibos.aggregate([
	{"$group":{"_id":"$user.screen_name",
		"count":{"$sum":1},
		"weibo_texts":{"$push":"$text"}}},
	{"$sort":{"count":-1}},
	{"$limit":5}
])
```

聚合管道可以添加很多个阶段，只要弄清楚每个阶段的输入和输出即可。比如上面计算@别人次数最多的用户，没有去除重复的@，下面这就用$addToSet来去除。

```python
db.weibos.aggregate([
	{"$unwind":"$entities.user_mentions"},
	{"$group":{"_id":"$user.screen_name",
		"mset":{"$addToSet":"$entities.user_mentions.screen_name"}}},
	{"$unwind":"$mset"},
	{"$group":{"_id":"$_id",
		"count":{"$sum":1}}},
	{"$sort":{"count":-1}},
	{"$limit":1}
])
```
## 索引
数据存储在大的文件中，数据的存储是没有顺序的，要查找数据，就要进行全表扫描（关系数据库），或Collection扫描（MongoDB），这非常得慢。  
如果我们将数据的一个或多个关键信息有序存放，那么即使数据量很大，我们也能通过二分查找，快速地找到相关的数据。这就是索引。  
与其他数据库一样，索引可以加快查找速度。索引的使用也是有代价的：

* 占用磁盘空间
* 更新数据的时候，也会花时间去更新索引

所以，只在需要查找的字段上建立索引。  
索引并没有按照线性顺序存储，而是使用*B-tree*结构。比如使用(tags,date,username)三个字段创建的索引：

1. 第一层是tags层，会首先对tags进行线性排序。
2. 第二层是date层，每个tags下面对应的date，也会线性排序。
3. 第三层是username层，也会线性排序。  

||||tags||||
|-|-|-|-|-|-|
||date|||date||
|username|username|username|username|username|username|


* 如果查找时只给出了tags，那么时可以通过索引进行查找的。
* 如果查找时给出了tags和date，那么可以通过索引，查找某天某个标签的微博。
* 如果查找时给出了tags，date，username，那么可以通过索引，查找某个用户在某天的某个标签的微博。
* *如果只给出了date，那么无法使用索引，因为data处于索引的第二层。只有从第一层开始才能使用索引*

### 建立索引
db.collection.createIndex  
关于索引的说明，可以在[MongoDB的文档](https://docs.mongodb.com/manual/indexes/)中找到。  

### 地理空间索引
可以是二维的点，也可以是三维的。比如要查询一个点附近的加油站或酒店，那么就可以这样查

```python
{'loc':[x,y]}
db.nodes.createIndex([('loc':pymongo.GEO2D)])
db.nodes.find({'loc':{'$near':[x,y]},'tags':{'$exists':1}})
```
其中('loc':pymongo.GEO2D)是一个元组，pymongo.GEO2D是一个预先定一的常量，代表了x轴的方向，一般是正序还是逆序。
