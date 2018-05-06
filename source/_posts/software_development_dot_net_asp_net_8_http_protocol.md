---
title: Software Development DotNet ASP.NET - 8、HTTP协议
date: 2013-01-07 16:00:45
categories:
- Software Development
tags:
- Software Development
- ASP.NET
- DotNet
---

###### 1、HTTP协议分析工具

- DebugBar：只能分析当前浏览器
- HttpWatch：只能分析当前浏览器
- HttpAnalyzer：分析计算机上所有Http请求数据

###### 2、几个概念

- 连接（Connection）：请求的时候才连接，请求完就关闭，不会保持连接，浏览器和服务器之间传输数据的通道。
- 请求（Request）：浏览器向服务器发送消息，包含请求的类型，请求的数据，浏览器的信息。
- 响应（Response）：服务器对浏览器请求的返回的数据，包含是否成功，错误代码等。

###### 3、页面中的每个资源（图片，JS，CSS），都是单独请求的，每个资源一个请求，可一起下载。

###### 4、直接在地址栏里敲击地址，都被视为Get请求。

- 页面的请求报文头和响应报文头

```csharp
Request Headers

GET http://www.cnblogs.com/hsuyafeng HTTP/1.1       

//请求类型为Get，客户端支持的HTTP版本为1.1
Host: www.cnblogs.com
Proxy-Connection: keep-alive

//在一个连接中，可能存在多个请求，建议保持连接
Cache-Control: max-age=0
User-Agent: Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11

//用户浏览器内核版本，系统版本，浏览器名称。通过User-Agent可限制特定浏览器的访问
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Encoding: gzip,deflate,sdch

//压缩信息
Accept-Language: zh-CN,zh;q=0.8
Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3
Cookie: ...
If-Modified-Since: Mon, 07 Jan 2013 07:21:13 GMT
```



```http
Response Headers

HTTP/1.0 200 OK

//200代表状态吗，服务器成功处理请求
Content-Length: 9558

//长度
Expires: Mon, 07 Jan 2013 07:28:31 GMT
Content-Encoding: gzip
Vary: Accept-Encoding
Server: Microsoft-IIS/7.5
Last-Modified: Mon, 07 Jan 2013 07:28:21 GMT
Connection: close

//建议保持连接，但是服务器关闭了连接
X-Ua-Compatible: IE=edge
Cache-Control: private, max-age=10
Date: Mon, 07 Jan 2013 07:28:21 GMT
X-Powered-By: ASP.NET
Content-Type: text/html; charset=utf-8

//返回响应的数据类型
X-Aspnet-Version: 4.0.30319
```

- JS文件的请求报文头和响应报文头

```http
Request Headers

GET http://common.cnblogs.com/script/json2.js HTTP/1.1
Host: common.cnblogs.com
Proxy-Connection: keep-alive
Cache-Control: max-age=0
If-Modified-Since: Wed, 07 Dec 2011 10:21:11 GMT
User-Agent: Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11
Accept: */*
If-None-Match: "b2555df1c9b4cc1:0"
Referer: http://www.cnblogs.com/hsuyafeng

//是通过那个页面请求的，服务器可设定Referer，准许那些页面的请求
Accept-Encoding: gzip,deflate,sdch
Accept-Language: zh-CN,zh;q=0.8
Accept-Charset: GBK,utf-8;q=0.7,*;q=0.3
Cookie: ...
```



```http
Response Headers

HTTP/1.0 304 Not Modified
Age: 44816
Expires: Tue, 05 Feb 2013 19:01:46 GMT
Last-Modified: Wed, 07 Dec 2011 10:21:11 GMT
Connection: close
Powered-By-Chinacache: PENDING from 05057123yR
Etag: "b2555df1c9b4cc1:0"
Date: Sun, 06 Jan 2013 19:01:46 GMT
Content-Type: application/x-javascript

//此处说明响应的数据类型是 javascript
```

###### 5、以上说明Http是无状态的，哪怕是同一个页面的JS，CSS，JPG也都要重复提交报文。

###### 6、Content-Type：告诉客户端响应的数据类型，这样浏览器根据返回数据的类型来进行不同的处理，如果是图片类型，就显示，如果是下载类型，就弹出下载工具。

```
text/html    image/gif    image/jpeg
text/plain    text/javascript    application/x-excel
application/octet-stream    (二进制文件)
```

###### 8、Content-Length：报文长度，报文头两个回车后

###### 9、基于安全和性能，一般服务器只有收到请求才推送数据。如果需要主动推送，可使用ServerPush。

###### 10、HTTP是“请求——响应”的工作方式，因此页面会不断刷新，可用Ajax避免刷新。

###### 11、HTTP协议支持断点续传，其原理是下载一部分

```http
Get a.zip HTTP/1.1
Length:3MB-4MB
```

- 多线程下载基于断点续传，每个线程下载一部分，最后拼接在一个。

###### 12、HTTP协议不支持的部分，无法实现

```html
<input type="file" />
```

- 此为上传一个文件到服务器，HTTP协议不支持上传文件夹

###### 13、服务器处理请求可能是成功，可能失败，可能没有权限访问，响应码来告诉浏览器处理结果。

| 100（继续）     | 请求者应当继续提出请求。服务器返回此代码表示已收到请求的第一部分，正在等待其余部分。 |
| --------------- | ------------------------------------------------------------ |
| 101（切换协议） | 请求者已要求服务器切换协议，服务器已确认并准备切换。         |

**2xx** **（成功）**
表示成功处理了请求的状态码。

| 200（成功）       | 服务器已成功处理了请求。通常，这表示服务器提供了请求的网页。如果是对您的 robots.txt 文件显示此状态码，则表示 Googlebot 已成功检索到该文件。 |
| ----------------- | ------------------------------------------------------------ |
| 201（已创建）     | 请求成功并且服务器创建了新的资源。                           |
| 202（已接受）     | 服务器已接受请求，但尚未处理。                               |
| 203（非授权信息） | 服务器已成功处理了请求，但返回的信息可能来自另一来源。       |
| 204（无内容）     | 服务器成功处理了请求，但没有返回任何内容。                   |
| 205（重置内容）   | 服务器成功处理了请求，但没有返回任何内容。与 204 响应不同，此响应要求请求者重置文档视图（例如，清除表单内容以输入新内容）。 |
| 206（部分内容）   | 服务器成功处理了部分 GET 请求。                              |

**3xx** **（重定向）** 
要完成请求，需要进一步操作。通常，这些状态码用来重定向。Google 建议您在每次请求中使用重定向不要超过 5 次。您可以使用网站管理员工具查看一下 Googlebot 在抓取重定向网页时是否遇到问题。**诊断**下的[网络抓取](http://www.google.com/support/webmasters/bin/answer.py?answer=35156)页列出了由于重定向错误导致 Googlebot 无法抓取的网址。

| 300（多种选择）     | 针对请求，服务器可执行多种操作。服务器可根据请求者 (user agent) 选择一项操作，或提供操作列表供请求者选择。 |
| ------------------- | ------------------------------------------------------------ |
| 301（永久移动）     | 请求的网页已永久移动到新位置。服务器返回此响应（对 GET 或 HEAD 请求的响应）时，会自动将请求者转到新位置。您应使用此代码告诉 Googlebot 某个网页或网站已永久移动到新位置。 |
| 302（临时移动）     | 服务器目前从不同位置的网页响应请求，但请求者应继续使用原有位置来响应以后的请求。此代码与响应 GET 和 HEAD 请求的 301 代码类似，会自动将请求者转到不同的位置，但您不应使用此代码来告诉 Googlebot 某个网页或网站已经移动，因为 Googlebot 会继续抓取原有位置并编制索引。 |
| 303（查看其他位置） | 请求者应当对不同的位置使用单独的 GET 请求来检索响应时，服务器返回此代码。对于除 HEAD 之外的所有请求，服务器会自动转到其他位置。 |
| 304（未修改）       | 自从上次请求后，请求的网页未修改过。服务器返回此响应时，不会返回网页内容。如果网页自请求者上次请求后再也没有更改过，您应将服务器配置为返回此响应（称为 If-Modified-Since HTTP 标头）。服务器可以告诉 Googlebot 自从上次抓取后网页没有变更，进而节省带宽和开销。. |
| 305（使用代理）     | 请求者只能使用代理访问请求的网页。如果服务器返回此响应，还表示请求者应使用代理。 |
| 307（临时重定向）   | 服务器目前从不同位置的网页响应请求，但请求者应继续使用原有位置来响应以后的请求。此代码与响应 GET 和 HEAD 请求的 <a href=answer.py?answer=>301</a> 代码类似，会自动将请求者转到不同的位置，但您不应使用此代码来告诉 Googlebot 某个页面或网站已经移动，因为 Googlebot 会继续抓取原有位置并编制索引。 |

**4xx（请求错误）** 
这些状态码表示请求可能出错，妨碍了服务器的处理。

| 400（错误请求）           | 服务器不理解请求的语法。                                     |
| ------------------------- | ------------------------------------------------------------ |
| 401（未授权）             | 请求要求身份验证。对于登录后请求的网页，服务器可能返回此响应。 |
| 403（禁止）               | 服务器拒绝请求。如果您在 Googlebot 尝试抓取您网站上的有效网页时看到此状态码（您可以在 Google 网站管理员工具**诊断**下的**网络抓取**页面上看到此信息），可能是您的服务器或主机拒绝了 Googlebot 访问。 |
| 404（未找到）             | 服务器找不到请求的网页。例如，对于服务器上不存在的网页经常会返回此代码。如果您的网站上没有 robots.txt 文件，而您在 Google 网站管理员工具["诊断"标签的 robots.txt 页](http://www.google.com/support/webmasters/bin/answer.py?answer=35237)上看到此状态码，则这是正确的状态码。但是，如果您有 robots.txt 文件而又看到此状态码，则说明您的 robots.txt 文件可能命名错误或位于错误的位置（该文件应当位于顶级域，名为 robots.txt）。如果对于 Googlebot 抓取的网址看到此状态码（在"诊断"标签的 [HTTP 错误页面](http://www.google.com/support/webmasters/bin/answer.py?answer=35122)上），则表示 Googlebot 跟随的可能是另一个页面的无效链接（是旧链接或输入有误的链接）。 |
| 405（方法禁用）           | 禁用请求中指定的方法。                                       |
| 406（不接受）             | 无法使用请求的内容特性响应请求的网页。                       |
| 407（需要代理授权）       | 此状态码与 <a href=answer.py?answer=35128>401（未授权）</a>类似，但指定请求者应当授权使用代理。如果服务器返回此响应，还表示请求者应当使用代理。 |
| 408（请求超时）           | 服务器等候请求时发生超时。                                   |
| 409（冲突）               | 服务器在完成请求时发生冲突。服务器必须在响应中包含有关冲突的信息。服务器在响应与前一个请求相冲突的 PUT 请求时可能会返回此代码，以及两个请求的差异列表。 |
| 410（已删除）             | 如果请求的资源已永久删除，服务器就会返回此响应。该代码与 404（未找到）代码类似，但在资源以前存在而现在不存在的情况下，有时会用来替代 404 代码。如果资源已永久移动，您应使用 301 指定资源的新位置。 |
| 411（需要有效长度）       | 服务器不接受不含有效内容长度标头字段的请求。                 |
| 412（未满足前提条件）     | 服务器未满足请求者在请求中设置的其中一个前提条件。           |
| 413（请求实体过大）       | 服务器无法处理请求，因为请求实体过大，超出服务器的处理能力。 |
| 414（请求的 URI 过长）    | 请求的 URI（通常为网址）过长，服务器无法处理。               |
| 415（不支持的媒体类型）   | 请求的格式不受请求页面的支持。                               |
| 416（请求范围不符合要求） | 如果页面无法提供请求的范围，则服务器会返回此状态码。         |
| 417（未满足期望值）       | 服务器未满足"期望"请求标头字段的要求。                       |

**5xx****（服务器错误）**
这些状态码表示服务器在处理请求时发生内部错误。这些错误可能是服务器本身的错误，而不是请求出错。

| 500（服务器内部错误）    | 服务器遇到错误，无法完成请求。                               |
| ------------------------ | ------------------------------------------------------------ |
| 501（尚未实施）          | 服务器不具备完成请求的功能。例如，服务器无法识别请求方法时可能会返回此代码。 |
| 502（错误网关）          | 服务器作为网关或代理，从上游服务器收到无效响应。             |
| 503（服务不可用）        | 服务器目前无法使用（由于超载或停机维护）。通常，这只是暂时状态。 |
| 504（网关超时）          | 服务器作为网关或代理，但是没有及时从上游服务器收到请求。     |
| 505（HTTP 版本不受支持） | 服务器不支持请求中所用的 HTTP 协议版本。                     |

