---
title: Software Development FontEnd 【jQuery UI 1.8 The User Interface Library for jQuery】.学习笔记.4.Tabs控件
date: 2013-08-14 10:33:45
categories:
- Software Development
tags:
- Software Development
- jQuery
- JavaScript
- FontEnd
---

之前，我们已经介绍了 jQuery UI 库，CSS 框架。下面，我们将学习这些有增强可视化效果，高度可配置的用户交互组件。

Tab 的特性是，点击 tab 后，会高亮该 tab，并显示他的关联content panel，期间会确保所有其他的 content panel 是 hidden。一次最多只有一个 content panel 可以被打开，也可以没有。

本章我们主要介绍以下几点：

- 默认安装启用控件
- CSS框架是如何触发 tab 控件
- 怎样为一组 tabs 应用自定义样式
- 使用 tab 控件的配置选项配置它
- content panel 变换时，内置过渡效果
- 使用 tab 控件的方法控制他们
- tab 的自定义事件
- AJAX tabs

## 1.默认安装启用 tab

```html
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="utf-8">
    <title>Tabs</title>
    <link rel="stylesheet" href="css/smoothness/jquery-ui-1.8.9.custom.css"></head>
  
  <body>
    <div id="myTabs">
      <ul>
        <li>
          <a href="#a">Tab 1</a></li>
        <li>
          <a href="#b">Tab 2</a></li>
      </ul>
      <div id="a">This is the content panel linked to the first tab, it is shown by default.</div>
      <div id="b">This content is linked to the second tab and will be shown when its tab is clicked.</div></div>
    <script src="development-bundle/jquery-x.x.x,js"></script>
    <script src="development-bundle/ui/jquery.ui.core.js"></script>
    <script src="development-bundle/ui/jquery.ui.widget.js"></script>
    <script src="development-bundle/ui/jquery.ui.tabs.js"></script>
    <script>(function($) {
        $("#myTabs").tabs();
      })(jQuery);</script>
  </body>

</html>
```

Tab 控件一般由几个特定方式组合在一起的基本HTML元素构建：

- 一个调用 tabs 方法的外层容器元素
- 一个元素列表 ，如<ul> 或 <ol>
- 每个 <li> 都是一个 tab，其中包含 一个 <a> 元素
- 每个 tab 的 content panel 元素

链接的 href 属性必须设置 # 为前缀的 识别。content panel 使用 <div> 元素，也可以使用其他HTML元素，panle Template 和 tabTemplate配置选项可以用来设置构成控件的匀速。

在 style sheets 和 page elements 后面加载 script ，被证明是一种能够显然改善加载时间的技巧，一旦有可能就要使用。

在链接了jQuery后，我们链接到所有的组件都必须的jquery.ui.core.js文件（除了 effects，它们有自己的 core 文件），还有jquery.ui.widget.js文件。这时我们连接到组件自己的源文件，jquery.ui.tabs.js。

在加载了必须的 script 后，我们加载自己的 script。

## 2.Tab CSS框架 classes

来简短地复习下 classnames，看看它们如何为控件外貌做贡献 。

外层div 被加上以下 classnames：

| Classname         | Purpose                          |
| ----------------- | -------------------------------- |
| ui-tabs           | 允许应用tab特有的结构CSS         |
| ui-widget         | 设置一般字体样式，被嵌入元素继承 |
| ui-widget-content | 提供主题特有的样式               |
| ui-corner-all     | 为容器应用圆角                   |

<ul>元素被加上以下 classnames：

| Classname          | Purpose                                           |
| ------------------ | ------------------------------------------------- |
| ui-tabs-nav        | 允许应用tab特有的结构CSS                          |
| ui-helper-reset    | 使应用到<ul>上的浏览器应特有的样式失效            |
| ui-helper-clearfix | 当这个元素有子元素在浮动，为这个元素应用clear-fix |
| ui-widget-header   | 提供主题特有的样式                                |
| ui-corner-all      | 应用圆角                                          |

成为tab headings 的每个<li>元素个体，被加上了以下classnames：

| Classname        | Purpose                                                      |
| ---------------- | ------------------------------------------------------------ |
| ui-state-default | 为tab headings 应用基本的、没有激活的、没有被选中的、没有被鼠标悬停的状态 |
| ui-corner-top    | 将元素上边缘设置为圆角                                       |
| ui-tabs-selected | 仅仅被用在活动的tab上。页面加载后默认是第一个tab，选择其他的tab 会从当前被选中的tab上移除这个class，并应用到新的选中的tab上。 |
| ui-state-active  | 为当前选中的tab应用主题特有的样式，像ui-tabs-selected一样工作。ui-tabs-selected提供CSS功能，而ui-state-active提供可视化，装饰样式。 |

每个<li>中的<a>元素，没有得到任何classnames，但是框架依然会为他们应用结构和主题特有的样式。

panel 元素被加上以下classnames：

| Classname         | Purpose                          |
| ----------------- | -------------------------------- |
| ui-tabs-panel     | 为content panels应用结构CSS      |
| ui-widget-content | 应用主题特有的样式               |
| ui-corner-bottom  | 为content panels的下边缘应用圆角 |

所有这些classes被库自动地添加到HTML元素下面，我们在页面编码时或添加基本的化妆时，不需要手动添加他们。

## 3.为tabs应用自定义主题

下面我们通过覆盖的方法，改变tabs的基本外貌。

```
1 #myTabs { 2 width:400px; padding:5px; border:1px solid #636363; 3 background:#c2c2c2 none; 4 } 5 .ui-widget-header { 6 border:0; background:#c2c2c2 none; font-family:Georgia; 7 } 8 #myTabs .ui-widget-content { 9 border:1px solid #aaa; background:#fff none; font-size:80%; 10 } 11 .ui-state-default, .ui-widget-content .ui-state-default { 12 border:1px solid #636363; background:#a2a2a2 none; 13 } 14 .ui-state-active, .ui-widget-content .ui-state-active { 15 border:1px solid #aaa; background:#fff none; 16 }
```

我们覆盖了jquery.ui.tabs.css中的规则。我们需要使用我们容器元素和jquery.ui.theme.css中的选择器   的ID选择器，最后击败 .ui-tabs .ui-tabs-panle。

## 4.配置选项

不是默认的行为如下：

| Option        | Default value                                        | Used to…                                                     |
| ------------- | ---------------------------------------------------- | ------------------------------------------------------------ |
| ajaxOptions   | null                                                 | 指定额外的AJAX选项。我们可以使用任何jQuery的$.ajax()方法暴漏的选项，如data,type,url等。 |
| cache         | false                                                | 控制远程数据仅在页面初始化时被加载一次。还是每次相应的tab被点击时都被重新加载。 |
| collapsible   | false                                                | 允许一个活动的tab被点击后不被选中，所有的content panels被hidden ，只有tab headings 可见。 |
| cookie        | null                                                 | 使用页面加载的cookie data来显示活动tab。这个选项必须使用cookie插件。 |
| disabled      | false                                                | 页面加载时禁用控件。我们也可以传送一个tab索引（从0开始）目录数组来禁用指定的tabs。 |
| event         | “click”                                              | 指定播放content panels时触发的事件                           |
| fx            | null                                                 | 指定一个变换tabs时的动画效果。支持一个对象或一个动画效果数组。 |
| idPrefix      | “ui-tabs-”                                           | 当远程tab heading的<a>元素没有title attribute，为其生成一个独一无二的ID和碎片标识。 |
| panelTemplate | “<div></div>”                                        | 指定tab panel的 content 部分所使用的元素名称。               |
| selected      | 0                                                    | 当页面加载时，显示一个不是第一个的tab panel（覆盖cookie属性） |
| spinner       | “Loding&#8230”                                       | 为远程tabs指定加载图标。                                     |
| tabTemplate   | <li><a href=”#{href}”><span>#{label}</span></a></li> | 指定当创建一个新的tabs时所使用的元素。当新tab被创建时，#{href}和#{label}字符串会被控件内部替换 |

### 4.1 选一个tab，selected、disabled、collapsible选项

```
1 var tabOpts = { 2 selected: 1, 3 disabled:[2], 4 collapsible:true 5 }; 6 $("#myTabs").tabs(tabOpts);
```

索引从0开始。当页面加载后，第三个tab被应用上ui-widget-disabled，从ui.theme.css获得disabled样式。它不再会相应任何鼠标的交互。

### 4.2 过渡效果，fx 选项

```
1 var tabOpts = { 2 fx: [{ 3 opacity: "toggle", 4 duration: "slow" 5 }, 6 null] 7 };
```

设置 fades-out 为淡出，设置 fades-in 为null。

toggle是切换的意思，opacity是不透明，即在可见和不可见见切换。duration是持续时间。

```
1 var tabOpts = { 2 fx: { 3 opacity: "toggle", 4 duration: "slow" 5 } 6 };
```

只设置一个时，此时fades-out 和 fades-in 共享此选项。

## 5. tab的事件

| Event   | Fired when…                     |
| ------- | ------------------------------- |
| add     | 一个新tab已经被添加             |
| disable | 一个tab已经被禁用               |
| enable  | 一个tab已经被启用               |
| load    | 一个tab的远程数据已经被加载完毕 |
| remove  | 一个tab已经被移除               |
| select  | 一个tab已经被选择               |
| show    | 一个tab已经被显示               |

 

 

 

每个组件都有回调选项，我们总是在变更执行之前调用回调函数。因此，你可以从你的回调返回一个false来防止执行。

```html
<script>(function($) {
    var handleSelect = function(e, tab) {
      $("<p></p>", {
        text: "Tab at index " + tab.index + " selected",
        "class": "status-message ui-corner-all"
      }).appendTo(".ui-tabs-nav", "#myTabs").fadeOut(5000,
      function() {
        $(this).remove();
      });
    },
    tabOpts = {
      select: handleSelect
    }
    $("#myTabs").tabs(tabOpts);
  })(jQuery);
</script>
<style>
    .status-message{ 
        padding:11px 8px 10px; margin:0; 
        border:1px solid #aaa; 
        position:absolute; 
        right:10px; 
        top:9px; 
        font-size:11px; 
        background-color:#fff; 
    }
<style>
```



### 5.1 绑定事件

使用组件暴漏的事件回调函数是控制交互的基本的方式，然而，我们也可以抓住在任何组件任何时间触发的事件。我们可以使用基本的jQuery bind()方法，将自定义事件绑定到 event handler，通过像绑定一个基本DOM事件那样，以同样的方式触发，例如点击。下面是自定义绑定事件和它们的触发时机：

| Event       | Fired when…           |
| ----------- | --------------------- |
| tabsselect  |                       |
| tabsload    |                       |
| tabsshow    |                       |
| tabsadd     | 一个tab已经被加到界面 |
| tabsremove  | 一个tab已经从界面移除 |
| tabsdisable |                       |
| tabsenable  |                       |

列表中的前三个事件依次发生。这些事件有不同的触发时机，有时在执行之前触发，有时在执行后触发。

```javascript
<script>(function($) {
    $("#myTabs").tabs();
    $("#myTabs").bind("tabsselect",
    function(e, tab) {
      alert("The tab at index " + tab.index + " was selected");
    });
  })(jQuery);
</script>
```

通过绑定 tabsselect 和使用 select 回调函数产生同样的效果，在新tab激活前，显示提示信息。所有的空间都能使用bind()方法，只需简单地替换事件的前缀。

## 6 使用tab的方法

| Method  | Used to…                                                     |
| ------- | ------------------------------------------------------------ |
| abort   | 停止当前进程中的任何的动画或AJAX请求                         |
| add     | 以编码的方式添加一个新tab，指定 content的 URL，一个 label，和可选的index作为参数。 |
| destroy | 完全地移除tabs控件                                           |
| disable | 通过传递一个以0开头的索引数字给此方法，禁用指定tab。或什么都不传，禁用全部tabs |
| enable  | 通过传递一个以0开头的索引数字给此方法，启用指定tab。或什么都不传，启用全部tabs |
| length  | 返回tabs控件的个数                                           |
| load    | 重载AJAX tab的 content，指定tab的索引数字。                  |
| option  | 在控件初始化后，get或set 任何属性                            |
| remove  | 指定tab的索引，通过编码的方式移除一个tab。如果没有提供索引，则第一个tab被移除。也可以用tab的href值移除它 |
| rotate  | 在指定的milliseconds后，自动改变活动tab，一次或者重复地。    |
| select  | 基于索引，以编码的方式选择一个tab，与浏览者点击一个tab的效果一样。 |
| url     | 改变AJAX tab的content的URL。这个方法需要tab的索引数字和新url。 |
| widget  | tabs() widget方法被调用时，返回该元素。                      |

### 6.1 启用、禁用tabs

```html
<button type="button" id="enable">Enable</button>
<button type="button" id="disable">Disable</button>
<script>(function($) {
    $("#myTabs").tabs({
      disabled: [1]
    });
    $("#enable").click(function() {
      $("#myTabs").tabs("enable", 1);
    });
    $("#disable").click(function() {
      $("#myTabs").tabs("disable", 1);
    });
  })(jQuery);
</script>
```

第一个参数是方法名称，第二个参数是索引号。不传递第二个参数将启用禁用全部tabs。

### 6.2 添加、移除tabs

```
1 <label>Enter a tab to remove:</label> 
2 <input for="indexNum" id="indexNum"> 
3 <button type="button"id="remove">Remove!</button><br> 4 <button type="button" id="add">Add a new tab!</button> 5 6<script> 7 (function($){ 8 $("#myTabs").tabs(); 9 $("#remove").click(function() { 10$("#myTabs").tabs("remove", parseInt($("#indexNum").val(), 11 10)); 12 }); 13 $("#add").click(function() { 14$("#myTabs").tabs("add", "remoteTab.txt", "A New Tab!"); 15 }); 16 })(jQuery);
```

remove若没有指定索引参数，则删除全部tabs。

add的第二个参数会读取文件中的内容，还可以增加一个索引参数，定义新标签新增的位置，如果没有，则默认在最后一个。

### 6.3 创建旋转木马样式的tab

rotate方法会使得所有的tabs（和它关联的content panel）自动地一个接一个地播放。

```
1 <script>2 (function($){ 3 $("#myTabs").tabs().tabs("rotate", 1000, true); 4 })(jQuery); 5 </script>
```

尽管我们不能直接地使用初始化的tabs()方法，我们依然可以在链式地使用它。第一个参数是milliseconds，第二个参数是表明循环式是一直不断地还是仅仅发生一次。

### 6.4 destroy 方法

和所有的jQuery UI控件一样，拥有destroy方法。这个方法会完全移除tab控件，回到HTML的原始状态。如果原始tabs采用硬编码的形式，而不是那些使用add方法添加的，destroyed后会依然残存。

### 6.5 Getting 和 Setting 选项

```html
<button id="show" type="button">Show Selected!</button>
<label for="newIndex">Enter a index to actiave</label>
<input id="newIndex" type="text">
<button id="setIndex" type="button">Set Index</button>
<div id="myTabs">
  <ul>
    <li>
      <a href="#a">a</a></li>
    <li>
      <a href="#b">b</a></li>
  </ul>
  <div id="a">ddafaf</div>
  <div id="b">fasdfafa</div></div>
<script>$(function() {
    $("#myTabs").tabs();
    $("#show").click(function() {
      $("<p></p>").text("Tab at index" + $("#myTabs").tabs("option", "selected") + " is active").appendTo(".ui-tabs-nav").fadeOut(1000);
    });
    $("#setIndex").click(function() {
      $("#myTabs").tabs("option", "selected", parseInt($("#newIndex").val(), 10));
    });
  });
</script>
```

我们通过传递一个字符串 selected 作为第二个参数。任何option的值都能通过这种方法访问到。

## 7 AJAX tabs

```html
<li><a href="remoteTab.txt">AJAX Tab</a></li>
$("#myTabs").tabs();
```

如果你使用的是DOM浏览器，你会看到我们添加的远程tab的文件路径已经被替换。作为替代，它生成了一个新的片段标示符，并设置给了href。新的片段作为新tab的id，所以tab heading依然显示这个tab。
从外部文件加载数据，依然可以从URLs加载。当使用查询字符串加载content从数据库，或者从web service的时候，很有用。AJAX tabs包含 load 和 url 方法。load 方法用来从在或者重载 content，它能够非常方便地刷新变化很频繁content。
tabs 空间的AJAX功能没有构建固有的 cross-domain 支持 。因此，除非附加地使用PHP或也谢其他的server-scripting language作为代理，
才能使用JSON结构的数据和jQuery的JSONP功能，不然的话文件或者URLs必须处于同一个domain。

### 7.1 改变远程tab的content 的URL

```html
<select id="fileChooser">
  <option value="buttonTheme.css">buttonTheme.css</option>
  <option value="remoteAccordion.txt">remoteAccordion</option></select>
<div id="myTabs">
  <ul>
    <li>
      <a href="#a">a</a></li>
    <li>
      <a href="remoteAccordion.txt">b</a></li>
  </ul>
  <div id="a">ddafaf</div></div>
<script>$(function() {
    $("#fileChooser").change(function() {
      $("#myTabs").tabs("url", 1, $(this).val());
    });
    $("#myTabs").tabs();
  });
</script>
```

我们只需调用url方法，传递tab的索引和新的URL。

### 7.2 远程tab的重载

也许你已经注意到了，当远程tab的url已经变更，但是此时content没有更新。直到切换到不同的tab再切换回来。为了维修这个问题，可以使用 load 方法。

```javascript
$(function() {
    $("#fileChooser").change(function() {
        $("#myTabs").tabs("url", 1, $(this).val()).tabs("load", 1);
    });
    $("#myTabs").tabs();
});
```

tab heading轻微的闪烁是因为 spinner 选项的默认值被设为 Loading。

### 7.3 显示通过JSONP获得的数据

使用 jQuery 库的 getJSON 方法，可以绕过 cross-domain 的排除政策，并显示来自其他的 domain 的供给。

```html
<html>
  
  <head>
    <title>ssss</title>
    <link rel="Stylesheet" href="jq/jquery-ui-1.8.9.css" /></head>
  
  <body>
    <div id="myTabs">
      <ul>
        <li>
          <a href="#a">a</a></li>
        <li>
          <a href="#flickr">b</a></li>
      </ul>
      <div id="a">ddafaf</div>
      <div id="flickr"></div>
    </div>
    <script src="development-bundle/jquery-1.4.4.js"></script>
    <script src="development-bundle/ui/jquery.ui.core.js"></script>
    <script src="development-bundle/ui/jquery.ui.widget.js"></script>
    <script src="development-bundle/ui/jquery.ui.tabs.js"></script>
    <script>(function($) {
        var img = $("<img />", {
          height: 100,
          width: 100
        }),
        tabOpts = {
          select: function(event, ui) {
            if (ui.tab.toString().indexOf("flickr") != -1) {
              console.log("flickr");
              var flickerAPI = "http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?";
              $.getJSON(flickerAPI, {
                tags: "nebula",
                format: "json",
                tagmode: "any"
              },
              function(data) {
                console.log("sucess");
                $("#flickr").empty();
                $.each(data.items,
                function(i, item) {
                  console.log(i);
                  img.clone().attr("src", item.media.m).appendTo("#flickr");
                  if (i == 5) {
                    returnfalse;
                  }
                });
              });
            }
          }
        };
        $("#myTabs").tabs(tabOpts);
      })(jQuery);</script>
  </body>

</html>
```

每次id 为 filickr 的 tab 被选中，jQuery getJSON 方法被用来重新获得 [http://www.flickr.com](http://www.flickr.com/)提供的供给。
一旦数据返回，首先清空contents来防止。。。。然后使用 jQuery 的 each() 功能方法，迭代返回的JSON中的每一个对象，并创建一个 img 克隆来存储。
没个图像的新的拷贝都有src属性，它被设为当前供给对象的信息，并把图像添加到空的tab中。一旦迭代超过6次，我们退出each()方法。

 

## 8 总结

tab控件是一个卓越的方式，来组织相关或完全无关的 content 节，当访问者点击的时候让它们隐藏或显示，来节省页面上的空间。它可以调高站点的交互性，提升全部的功能，提供有吸引力的页面。