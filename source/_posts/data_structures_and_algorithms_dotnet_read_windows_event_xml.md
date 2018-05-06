---
title: Data Structures and Algorithms DotNet 读取Windows事件XML日志
date: 2013-01-18 09:09:45
categories:
- Data Structures and Algorithms
tags:
- DotNet
- Data Structures and Algorithms
- XML
---

最近截取了服务器的日志，发现Windows的事件查看器的检索功能并不好用，就想导出后自己检索出所需要的信息。

另存为可以保存为evtx格式的文件，也可以保存为XML。正好想学下怎么操作XM，那就保存为XML咯。

我这次要检索的是Windows日志->安全 中的事件，感兴趣的信息是IpAddress，IpPort，WorkstationName，LogonProcessName 这四个内容，顺便记录下每个IP地址 产生事件的次数 Times。

说干就干，我们先新建一个事件类，每个事件在实例化、赋值完后加入到一个容器以存储它们。最后遍历、输出到文本。

```csharp
//事件类
class EventElement
{
    public EventElement()
    {
    Times = 1;
    }

    //IP
    public string IP
    { get; set; }

    //机器名
    public string WorkstationName
    { get; set; }

    //进程名
    public string LogonProcessName
    { get; set; }

    //次数
    public int Times
    { set; get; }

    //端口
    public string IpPort
    { get; set; }

    public override string ToString()
    {
        return "IP: " + IP 
            + "\t\t,WorkstationName: " + WorkstationName 
            + "\t\t,LogonProcessName: " + LogonProcessName 
            + "\t\t,Times: " + Times 
            + " ,IpPort: " + IpPort + "\n";
    }
}
```

然后，我们新建一个容器，用来存储这些事件，这里用SortedDictionary，因为它能排序。Key用来存储IP地址，Value用来存储IP对应的事件类。

```csharp
SortedDictionary<string, EventElement> data = new SortedDictionary<string, EventElement>();
```

因为有很多IP重复的事件，此处我们只需记录下同一IP事件出现的次数，和每次的端口即可。

```csharp
if (eventElement.IP != null)
{
    if (data.ContainsKey(eventElement.IP))
    {
        data[eventElement.IP].Times += 1;
        data[eventElement.IP].IpPort += "," + eventElement.IpPort;
    }
    else
    {
        data[eventElement.IP] = eventElement;
    }
}
```

下面开始读取XML文件

```csharp
Console.Write("Input filename:");
string filename = Console.ReadLine();
XmlDataDocument xmldoc = new XmlDataDocument();
 xmldoc.Load(@"C:/"+filename+".xml");
XmlNodeList nodelist = xmldoc.SelectSingleNode("Events").ChildNodes;
```

因为这个事件日志的结构如下

```xml
<Events>
    <Event>
        <EventData>
            <Data Name='IpAddress'>192.168.1.1</Data>
        </EventData>
    </Event>
</Events>
```

此处我们遍历三层取出EventData下每一个Data，代码如下

```csharp
foreach (XmlNode fir1 in nodelist)
{
    XmlElement xmle = (XmlElement)fir1;

    XmlNodeList nodelist2 = xmle.ChildNodes;

    foreach (XmlNode fir2 in nodelist2)
    {
        XmlElement xmle2=(XmlElement)fir2;
        XmlNodeList nodelist3=xmle2.ChildNodes;

        EventElement eventElement = new EventElement();

        foreach (XmlNode fir3 in nodelist3)
        {
            if (fir3.Name == "Data")
            {
                if (fir3.Attributes[0].Value == "IpAddress")
                {
                    eventElement.IP = fir3.InnerText;
                }
                else if (fir3.Attributes[0].Value == "WorkstationName")
                {
                    eventElement.WorkstationName = fir3.InnerText;
                }
                else if (fir3.Attributes[0].Value == "LogonProcessName")
                {
                    eventElement.LogonProcessName = fir3.InnerText;
                }
                else if (fir3.Attributes[0].Value == "IpPort")
                {
                    eventElement.IpPort = fir3.InnerText;
                }
            }
        }

        if (eventElement.IP != null)
        {
            if (data.ContainsKey(eventElement.IP))
            {
                data[eventElement.IP].Times += 1;
                data[eventElement.IP].IpPort += "," + eventElement.IpPort;
            }
            else
            {
                data[eventElement.IP] = eventElement;
            }
        }
        
    }
}
```

现在遍历容器输出

```csharp
foreach( KeyValuePair<string,EventElement> key in data )
            {
                EventElement e = (EventElement)key.Value;
                System.IO.File.AppendAllText(@"C:/"+filename+".txt", e.ToString());
            }
            Console.WriteLine("Output to C:/" + filename + ".txt finish");
            Console.ReadKey(); 
```

OK，已经输出到文本中了。

现在贴出全部代码

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;

namespace ConsoleApplication2
{

    //事件类
    class EventElement
    {
        public EventElement()
        {
            Times = 1;
        }

        //IP
        public string IP
        { get; set; }

        //机器名
        public string WorkstationName
        { get; set; }

        //进程名
        public string LogonProcessName
        { get; set; }

        //次数
        public int Times
        { set; get; }

        //端口
        public string IpPort
        { get; set; }

        public override string ToString()
        {
            return "IP: " + IP + "\t\t,WorkstationName: " + WorkstationName + "\t\t,LogonProcessName: " + LogonProcessName + "\t\t,Times: " + Times + " ,IpPort: " + IpPort + "\n";
        }
    }


    class Program
    {
        
        static void Main(string[] args)
        {
            Console.Write("Input filename:");
            string filename = Console.ReadLine();
            XmlDataDocument xmldoc = new XmlDataDocument();
            xmldoc.Load(@"C:/"+filename+".xml");
            XmlNodeList nodelist = xmldoc.SelectSingleNode("Events").ChildNodes;
            //int num = nodelist.Count;

            SortedDictionary<string, EventElement> data = new SortedDictionary<string, EventElement>();

            foreach (XmlNode fir1 in nodelist)
            {
                XmlElement xmle = (XmlElement)fir1;

                XmlNodeList nodelist2 = xmle.ChildNodes;

                foreach (XmlNode fir2 in nodelist2)
                {
                    XmlElement xmle2=(XmlElement)fir2;
                    XmlNodeList nodelist3=xmle2.ChildNodes;

                    EventElement eventElement = new EventElement();

                    foreach (XmlNode fir3 in nodelist3)
                    {
                        if (fir3.Name == "Data")
                        {
                            if (fir3.Attributes[0].Value == "IpAddress")
                            {
                                eventElement.IP = fir3.InnerText;
                            }
                            else if (fir3.Attributes[0].Value == "WorkstationName")
                            {
                                eventElement.WorkstationName = fir3.InnerText;
                            }
                            else if (fir3.Attributes[0].Value == "LogonProcessName")
                            {
                                eventElement.LogonProcessName = fir3.InnerText;
                            }
                            else if (fir3.Attributes[0].Value == "IpPort")
                            {
                                eventElement.IpPort = fir3.InnerText;
                            }
                        }
                    }

                    if (eventElement.IP != null)
                    {
                        if (data.ContainsKey(eventElement.IP))
                        {
                            data[eventElement.IP].Times += 1;
                            data[eventElement.IP].IpPort += "," + eventElement.IpPort;
                        }
                        else
                        {
                            data[eventElement.IP] = eventElement;
                        }
                    }
                    
                }
            }
            
            foreach( KeyValuePair<string,EventElement> key in data )
            {
                EventElement e = (EventElement)key.Value;
                System.IO.File.AppendAllText(@"C:/"+filename+".txt", e.ToString());
            }
            Console.WriteLine("Output to C:/" + filename + ".txt finish");
            Console.ReadKey();
        }
    }
}
```

