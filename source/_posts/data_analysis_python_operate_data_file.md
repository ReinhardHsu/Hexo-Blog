---
title: Data Analysis Python 操作数据文件
categories:
- Data Analysis
tags:
- Python
- Data Structures and Algorithms
- Data Analysis
date: 2016-10-12 5:57
---
# 操作数据文件
## csv文件
我们操作csv文件时，可能会遇到不同的分隔符分隔，如逗号，冒号等。如果字段值里也含有这样的符号，就非常不好处理了。这时，我们可以使用csv模块
```python
import csv

data=[]
with open(filepath,'rb') as sd:
  r=csv.DictReader(sd)
  for line in r:
    data.append(line)
return data
```
这里的DictReader，会自动用第一行的列名，作为字典的键。  
## excel文件
可以使用xlrd模块
```python
import xlrd

workbook = xlrd.open_workbook(datafile)
sheet = workbook.sheet_by_index(0)

data = [[sheet.cell_value(r, col)
            for col in range(sheet.ncols)]
                for r in range(sheet.nrows)]

print "\nList Comprehension"
print "data[3][2]:",
print data[3][2]

print "\nCells in a nested loop:"    
for row in range(sheet.nrows):
    for col in range(sheet.ncols):
        if row == 50:
            print sheet.cell_value(row, col),


### other useful methods:
print "\nROWS, COLUMNS, and CELLS:"
print "Number of rows in the sheet:",
print sheet.nrows
print "Type of data in cell (row 3, col 2):",
print sheet.cell_type(3, 2)
print "Value in cell (row 3, col 2):",
print sheet.cell_value(3, 2)
print "Get a slice of values in column 3, from rows 1-3:"
print sheet.col_values(3, start_rowx=1, end_rowx=4)

print "\nDATES:"
print "Type of data in cell (row 1, col 0):",
print sheet.cell_type(1, 0)
exceltime = sheet.cell_value(1, 0)
print "Time in Excel format:",
print exceltime
print "Convert time to a Python datetime tuple, from the Excel float:",
print xlrd.xldate_as_tuple(exceltime, 0)

return data

print data[3][2]
```
## json文件

```python
import json

def get_from_file(kind, period):
    filename = "popular-{0}-{1}.json".format(kind, period)
    with open(filename, "r") as f:
        return json.loads(f.read())

data = get_from_file(kind, period)

```
还可以使用requests模块，从web api中获取json

```python
def query_site(url, params, uid="", fmt="json"):
    # This is the main function for making queries to the musicbrainz API.
    # A json document should be returned by the query.
    params["fmt"] = fmt
    r = requests.get(url + uid, params=params)
    print "requesting", r.url

    if r.status_code == requests.codes.ok:
        return r.json()
    else:
        r.raise_for_status()
```
## xml文件
xml文件设计的目的，是不依赖于平台的数据转移。

```python
import xml.etree.ElementTree as ET

def get_author(root):
    authors = []
    for author in root.findall('./fm/bibl/aug/au'):
        data = {
                "fnm": None,
                "snm": None,
                "email": None
        }
        data["fnm"] = author.find('./fnm').text
        data["snm"] = author.find('./snm').text
        data["email"] = author.find('./email').text

        authors.append(data)

    return authors

def get_authors(root):
    authors = []
    for author in root.findall('./fm/bibl/aug/au'):
        data = {
                "fnm": None,
                "snm": None,
                "email": None,
                "insr": []
        }
        data["fnm"] = author.find('./fnm').text
        data["snm"] = author.find('./snm').text
        data["email"] = author.find('./email').text
        insr = author.findall('./insr')
        for i in insr:
            data["insr"].append(i.attrib["iid"])
        authors.append(data)

    return authors
```
如果attrib不存在，可能会引发KeyError异常，可以先判断attrib是否存在

```python
if 'username' in element.attrib:
	username=element.attrib['username']
```

### 迭代解析
之前说的解析方式是树型解析，就是先把xml文件整个加载到内存后进行解析。如果文件非常大，2G大小，那就需要一行一行地解析了。

```python
import xml.etree.cElementTree as ET

for event,elem in ET.iterparse(filepath):
	if elem.tag=='tag' and elem.attrib['ss']=='vvv':
		pass
```

## html文件

```python
def extract_data(page):
    data = {"eventvalidation": "",
            "viewstate": ""}
    with open(page, "r") as html:
        soup = BeautifulSoup(html, "lxml")
        ev = soup.find(id="__EVENTVALIDATION")
        data["eventvalidation"] = ev["value"]

        vs = soup.find(id="__VIEWSTATE")
        data["viewstate"] = vs["value"]

    return data
```
不同的会话，可能会导致提交失败。如果要使用相同的会话，那么需要开启session。

```python
s=requests.Session()

r=s.get('')
soup=BeautifulSoup(r.text)
xx=soup.find(id='')['value']

r=s.post('',data={'xx':xx})

f=open('filepath','w')
f.write(r.text)
```


