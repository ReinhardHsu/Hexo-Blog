---
title: Data Analysis Weekend Project 开放街道地图(OpenStreetMap)
categories:
- Data Analysis
tags:
- Data Analysis
- Weekend Project
date: "2016-11-03 20:50"
---
# OpenStreetMap Project Data Wrangling with MongoDB
[Reinhard](http://www.cnblogs.com/msdynax)使用OpenStreetMap的开放地图数据作为本次数据分析的数据源，使用Python进行数据清洗，使用MongoDB进行数据探索和分析。  
这里先看看什么是OpenStreetMap：
>开放街道地图（英语：OpenStreetMap，缩写为OSM）目标是创造一个内容自由且能让所有人编辑的世界地图，并且让一般便宜的移动设备有方便的导航方案。

## 在地图中遇到的问题
[Reinhard](http://www.cnblogs.com/msdynax)下载了台北市的地图数据后，对地址进行审查时，主要发现存在以下几个问题：

1. 有些数据过于明细，不仅写出了街道地址，还将单位名称写在后面，如：“235新北市中和區中山路三段122號、中和環球購物中心”。
2. 有些英文地址中，存在过度简写的情况。比如：“Ln 26 Taishun St.”。
3. 有些地址中即包含中文地址，又包含英文地址，比如：“台北市市民大道四段207號/ English: No. 207, Section 4, Civic Blvd, Songshan District, Taipei City, Taiwan 105”。
4. 这里将node和way作为文档的type的值，但是会被地址描述tag中的值替换。比如：`<tag k="type" v="multipolygon" />`，会将文档的type变成multipolygon 。
5. 地址的邮政编码和台北市的邮政编码不一致。比如：`<tag k="addr:city" v="桃園市龜山區" /><tag k="addr:postcode" v="333" />`。

### 地址过于明细的情况
[Reinhard](http://www.cnblogs.com/msdynax)通过定位到问题地址中的分隔符，将单位名称从地址信息中去除。比如将“235新北市中和區中山路三段122號、中和環球購物中心”，转换成“235新北市中和區中山路三段122號”。

#### 改进的益处和预期的问题
经过这样的清洗，使得地址的格式更加一致。  
[Reinhard](http://www.cnblogs.com/msdynax)仅仅是通过分隔符将单位名称从地址信息中去除，但是因为分隔符的多样性，甚至压根就没有分隔符，所以清洗过的数据中，依然可能存在地址过于明细的情况。

### 英文地址中有过度简写的情况
[Reinhard](http://www.cnblogs.com/msdynax)用全称，替换问题地址中的简称，比如将“Ln 26 Taishun St.”，转换成“Lane 26 Taishun Street”。

#### 改进的益处和预期的问题
[Reinhard](http://www.cnblogs.com/msdynax)将数据导入到数据库中后，是通过地址关键字进行查询的。[Reinhard](http://www.cnblogs.com/msdynax)将关键字进行统一后，便于今后的使用。  
[Reinhard](http://www.cnblogs.com/msdynax)仅仅是用有限的几个特定简写，定位到问题数据，并进行处理。但是因为英文简写的多样性，很难进行穷举。所以清洗过的数据中，依然可能存在英文地址中有过度简写的情况。

### 即包含中文地址，又包含英文地址的情况
[Reinhard](http://www.cnblogs.com/msdynax)定位到问题地址中的分隔符，只保留分隔符前面的地址。比如将“台北市市民大道四段207號/ English: No. 207, Section 4, Civic Blvd, Songshan District, Taipei City, Taiwan 105”，转换成“台北市市民大道四段207號”。

#### 改进的益处和预期的问题
经过这样的清洗，使得地址的格式更加一致。  
[Reinhard](http://www.cnblogs.com/msdynax)这里仅仅是通过分隔符将英文地址从地址信息中去除，但是因为分隔符的多样性，甚至压根就没有分隔符，所以清洗过的数据中，依然可能存在即包含中文地址，又包含英文地址的情况。

### 文档的type被替换的情况
[Reinhard](http://www.cnblogs.com/msdynax)这里在生成json文档的时候，会判断node和way节点下的tag的键，如果键是type或某些关键字，就不将tag的值添加到json文档中，防止文档的type被替换。

#### 改进的益处和预期的问题

[Reinhard](http://www.cnblogs.com/msdynax)这里通过一些关键字，对address中的数据进行了过滤，排除了文档关键信息被替换掉的可能。  
但是这样的过滤方式，可能会损失一些有用的信息。

### 地址的邮政编码和台北市的邮政编码不一致
[Reinhard](http://www.cnblogs.com/msdynax)这里主要通过邮政编码对地址进行过滤。  
台湾的邮政编码是5位，其中前3位是投递区号，只写3位也能投递。  
在数据探索的过程中，通过将邮政编码前3位的邮递区号提取出来，发现了以下两个问题：

* 一些不属于台北市范围的数据。包括新北、基隆、桃源的数据。
*  还有一些邮政编码长度不足3位的。  

在台湾的行政区划中，台北市只包含城市范围，周围的郊区是归台北县的。台北县与基隆、桃源相邻。后来台北县提升为新北市，成为与台北市一样的直辖市。  
所以，[Reinhard](http://www.cnblogs.com/msdynax)需要使用台北市12个区的邮递区号，将台北市以外的数据，和邮政编码长度不足3位的数据，全部过滤掉。  
#### 改进的益处和预期的问题
这样的过滤方式，显然可以过滤掉一部分有问题的数据。   
我这里只通过邮政编码进行过滤，但是并非所有的文档都提供了邮政编码信息，所以清洗过的数据中，依然可能存在地址超出台北市范围的情况。  
## 数据概览
这里，[Reinhard](http://www.cnblogs.com/msdynax)使用了台北市的地图数据，清洗后转换为json格式，导入到MongoDB中。
### 文件大小
taipei_taiwan.osm ......... 167.6 MB  

taipei_taiwan.osm.json .... 182.8 MB
### 文档的数量

```python
def print_doc_num(query):
    print db.test_collection.find(query).count()

print_doc_num({})

826198
```
### node的数量

```python
def print_doc_num(query):
    print db.test_collection.find(query).count()

print_doc_num({"type":"node"})

732147
```

### way的数量

```python
def print_doc_num(query):
    print db.test_collection.find(query).count()

print_doc_num({"type":"way"})

94051
```

### 用户的数量

```python
result= db.test_collection.distinct("created.user")
print len(result)

1566  
```

### 贡献最多的用户

```python
def print_doc_aggregate(query):
    result=db.test_collection.aggregate(query)
    pprint.pprint(list(result))


print_doc_aggregate([
        {"$group":{"_id":"$created.user","count":{"$sum":1}}},
        {"$sort":{"count":-1}},
        {"$limit":1}
])

[{u'count': 180515, u'_id': u'Supaplex'}]
```

### 只贡献过一次的用户

```python
def print_doc_aggregate(query):
    result=db.test_collection.aggregate(query)
    pprint.pprint(list(result))


print_doc_aggregate([
        {"$group":{"_id":"$created.user","count":{"$sum":1}}},
        {"$match":{"count":1}},
        {"$group":{"_id":"$count","num_users":{"$sum":1}}}
])

[{u'num_users': 314, u'_id': 1}]
```

## 额外的想法
### 贡献者的统计信息
用户的贡献呈现出非常严重的倾斜。少量的用户贡献了绝大多数的地图信息。这里，有一些关于用户贡献的统计信息：  

* 贡献最多的用户（Supaplex），占全部贡献的21.8% 。
* 贡献最多的前10个用户（占全部用户的0.6%），合计占全部贡献的57.8% 。
* 贡献最多的前100个用户（占全部用户的6.4%），他们的贡献占全部贡献的94.3% 。
* 贡献最少的前1200个用户（占全部用户的76.6%），他们的贡献只占全部贡献的1% 。

[Reinhard](http://www.cnblogs.com/msdynax)认为贡献度高的用户，提供的数据可能在一致性和可靠性上更好一些。而那些贡献度低的用户，可能并不是很熟悉OpenStreetMap地图的使用方法，他们的数据的一致性和可靠性可能会差一些。所以可以考虑删除掉这部分数据，以提高数据的一致性和可靠性。
#### 改进的益处和预期的问题
删除贡献度低的用户所提供的数据后，数据集更一致和可靠。  
与此同时，可能会损失一些有用的信息，并且数据集会变小。但是因为这部分用户所提供的数据相对来说非常少，所以只会删除很少的数据。  
总的来说，删除这部分数据比保留要好。

### 使用MongoDB进行额外的数据探索

#### 出现次数最多的便利设施

```python
def print_doc_aggregate(query):
    result=db.test_collection.aggregate(query)
    pprint.pprint(list(result))


print_doc_aggregate([
        {'$match':{'amenity':{'$exists':1}}},
        {'$group':{'_id':'$amenity','count':{'$sum':1}}},
        {'$sort':{'count':-1}},
        {'$limit':10}
])

[{u'_id': u'restaurant', u'count': 4729},
 {u'_id': u'parking', u'count': 1553},
 {u'_id': u'place_of_worship', u'count': 1129},
 {u'_id': u'cafe', u'count': 878},
 {u'_id': u'bank', u'count': 698},
 {u'_id': u'bench', u'count': 540},
 {u'_id': u'drinking_water', u'count': 529},
 {u'_id': u'toilets', u'count': 518},
 {u'_id': u'bicycle_rental', u'count': 491},
 {u'_id': u'shelter', u'count': 489}]

```

#### 出现最多的餐厅

```python
def print_doc_aggregate(query):
    result=db.test_collection.aggregate(query)
    pprint.pprint(list(result))


print_doc_aggregate([
        {'$match':{'amenity':{'$exists':1}}},
        {'$match':{'amenity':'restaurant'}},
        {'$match':{'name':{'$exists':1}}},
        {'$group':{'_id':'$name','count':{'$sum':1}}},
        {'$sort':{'count':-1}},
        {'$limit':3}
])

[{u'_id': u'八方雲集', u'count': 65},
 {u'_id': u'永和豆漿', u'count': 32},
 {u'_id': u'吉野家', u'count': 20}]
```

#### 出现最多的咖啡店

```python
def print_doc_aggregate(query):
    result=db.test_collection.aggregate(query)
    pprint.pprint(list(result))


print_doc_aggregate([
        {'$match':{'amenity':{'$exists':1}}},
        {'$match':{'amenity':'cafe'}},
        {'$match':{'name':{'$exists':1}}},
        {'$group':{'_id':'$name','count':{'$sum':1}}},
        {'$sort':{'count':-1}},
        {'$limit':3}

[{u'_id': u'星巴克', u'count': 39},
 {u'_id': u'85度C', u'count': 38},
 {u'_id': u'Starbucks', u'count': 34}]

```

#### 出现最多的宗教场所

```python
def print_doc_aggregate(query):
    result=db.test_collection.aggregate(query)
    pprint.pprint(list(result))


print_doc_aggregate([
        {'$match':{'amenity':{'$exists':1}}},
        {'$match':{'amenity':'place_of_worship'}},
        {'$match':{'name':{'$exists':1}}},
        {'$group':{'_id':'$name','count':{'$sum':1}}},
        {'$sort':{'count':-1}},
        {'$limit':3}
])

[{u'_id': u'福德宮', u'count': 38},
 {u'_id': u'土地公廟', u'count': 12},
 {u'_id': u'福興宮', u'count': 7}]
```

## 结论
经过本次清洗，数据在一致性和完整性上有了一定的提升。虽然清洗过的数据中，依然可能存在数据一致性和完整性的问题，但是[Reinhard](http://www.cnblogs.com/msdynax)相信这次数据清洗已经很好地达到了本次练习的目的。  
本次清洗让[Reinhard](http://www.cnblogs.com/msdynax)注意到，OpenStreetMap可以让所有人都参与编辑地图、提供数据，这种形式能够提升数据的准确性、增加多样性，但是也带来了数据一致性和完整性上的问题。因为数据的质量会影响分析的结果，所以在使用此类数据进行分析前，要进行必要的数据清洗。