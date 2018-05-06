---
title: Software Development FontEnd 【jQuery UI 1.8 The User Interface Library for jQuery】.学习笔记.1.CSS框架和其他功能
date: 2013-08-13 10:58:45
categories:
- Software Development
tags:
- Software Development
- jQuery
- JavaScript
- FontEnd
---

## jquery.ui.all.css

1.所有主题必须的文件都包含在这个文件中。它由ui.base.css和ui.them.css两个文件中拉入的@import执行构成。

## jquery.ui.base.css

1.这个文件被ui.all.css文件引用。它依然由ui.core.css文件中拉入的@import指令构成,像每个控件一样。但是，它不包含控制每个控件显示的主题样式。

## jquery.ui.core.css

1.这个文件提供CSS框架的核心样式，诸如clear-fix helper和generic overlay，被所有的组件引用。包含以下样式：

| .ui-helper-hidden            | 使用 display:none 隐藏元素                                   |
| ---------------------------- | ------------------------------------------------------------ |
| .ui.helper-hidden-accessible | 将元素的位置设置到屏幕之外，使其看不见                       |
| .ui-helper-reset             | 清除一些基本的样式，如padding 等被浏览器应用于公共元素的公共默认style |
| .ui-helper-clearfix:after    | 这个calsses提供一种自动清理浮动的跨浏览器解决方案。每当一个元素浮动了，.ui-helper-clearfix class就被加在浮动元素的容器上。当父容器自动清除浮动后，ui.helper-clearfix:after styles被 添加。 |
| .ui-helper-clearfix          | 被用在容器自身，适用于浮动包裹父元素的属性。                 |
| .ui-helper-zfix              | 提供规则，适用于修复iframe元素覆盖的问题。                   |
| .ui-state-disabled           | 应用于那些被禁用的用户界面元素                               |
| .ui-icon                     | 用于设置ui.theme.css文件中的背景图片。                       |
| .ui-widget-overlay           | 设置页面上覆盖层出现时的基本样式，                           |

## jquery.ui.theme.css

1.这个文件包含完整的可视化主题和所有 库中被装扮起来的可视化元素的触发器。

2.被框架大量使用的style sheet和包含大量classes

| 容器     | 为widget,heading,content容器设置style属性                    |
| -------- | ------------------------------------------------------------ |
| 交互状态 | 这个classes为任何可以点击的元素，设置默认,鼠标位于上方(hover),活动时的状态 |
| 交互提示 | 这个类别为元素应用高亮,错误,禁用,主要的(primary),次要(secondary)样式的可视化提示 |
| 状态图片 | 这个classes为content,heading容器的图标设置图片。像任何可以点击的元素，包括默认，鼠标位于上方，活动，高亮，focus，错误的状态。 |
| 图片位置 | 主题使用的所有图标的图片，都存储在同一个文件中，通过background-position属性单独显示个体。这个类别为所有图标个体设置background-position属性。 |
| 圆角半径 | CSS3                                                         |
| 遮罩层   | 这个图片定义在core.css文件中，用在一般的遮罩层上。这个类产生一个半透明的遮罩层盖在指定的元素上。 |

## 容器

```html
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="utf-8">
    <title>CSS Framework - Containers</title>
    <link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css"></head>
  
  <body>
    <div class="ui-widget">
      <div class="ui-widget-header ui-corner-top">
        <h2>This is a .ui-widget-header container</h2></div>
      <div class="ui-widget-content ui-corner-bottom">
        <p>This is a .ui-widget-content container</p>
      </div>
    </div>
  </body>

</html>
```

外层容器使用 ui-widget 样式。

里层有两个容器，一个 ui-widget-heading ，一个 ui-widget-content 。并通过 ui-corner-top 和ui-corner-bottom 设置各自的圆角属性。

## 交互

```html
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="utf-8">
    <title>CSS Framework - Interaction states</title>
    <link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css">
    <script src="development-bundle/jquery-1.4.4.js"></script>
    <script>(function($) {
        $(".ui-widget a").hover(function() {
          $(this).parent().addClass("ui-state-hover");
        },
        function() {
          $(this).parent().removeClass("ui-state-hover");
        });
      })(jQuery);</script>
  </head>
  
  <body>
    <div class="ui-widget">
      <div class="ui-state-default ui-state-active ui-corner-all">
        <a href="#">I am clickable and selected</a></div>
      <div class="ui-state-default ui-corner-all">
        <a href="#">I am clickable but not selected</a></div>
    </div>
  </body>

</html>
```

我们定义了两个可以点击的元素，他们都有 ui-state-default 样式，第一个还有ui-state-active样式。

当鼠标放在 div 的 a 上时，该 div 应用 ui-state-hover ,反之 移除。

## 图标

```html
<div class="ui-widget">
  <div class="ui-state-default ui-state-active ui-corner-all">
    <div class="ui-icon ui-icon-circle-plus"></div>
    <a href="#">I am clickable and selected</a></div>
  <div class="ui-state-default ui-corner-all">
    <div class="ui-icon ui-icon-circle-plus"></div>
    <a href="#">I am clickable but not selected</a></div>
</div>
```



## 交互提示

```html
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="utf-8">
    <title>CSS Framework - Interaction cues</title>
    <link rel="stylesheet" href="development-bundle/themes/base/jquery.ui.all.css">
    <link rel="stylesheet" href="css/jquery.ui.form.css"></head>
  
  <body>
    <div class="ui-widget ui-form">
      <div class="ui-widget-header ui-corner-all">
        <h2>Login Form</h2></div>
      <div class="ui-widget-content ui-corner-all">
        <form action="#" class="ui-helper-clearfix">
          <label>Username</label>
          <div class="ui-state-error ui-corner-all">
            <input type="text">
            <div class="ui-icon ui-icon-alert"></div>
            <p class="ui-helper-reset ui-state-error-text">Required field</p></div>
        </form>
      </div>
    </div>
    <style>
        .ui-form .ui-widget-content { padding:20px;} 
        .ui-form label, .ui-form input, .ui-form .ui-state-error, .ui-form .ui-icon, .ui-form .ui-state-error p { float:left;} 
        .ui-form label, .ui-state-error p { font-size:12px; padding:10px 10px 0 0; } 
        .ui-form .ui-state-error { padding:4px;} 
        .ui-form .ui-state-error p { font-weight:bold; padding-top:5px; } 
        .ui-form .ui-state-error .ui-icon { margin:5px 3px 0 4px;}
	</style>
</body>

</html>
```



## 位置功能

1.位置功能是一个强大的单独的功能，用来设置任何元素相对于窗口，文件，指定的元素或鼠标的位置。它是组件库中独一无二的，不需要jquery.ui.core.js或者jquery.effects.core.js文件支持的。我们可以通过一系列的配置选项来使用它。

| Option          | Format                              | Used to..                                                    |
| --------------- | ----------------------------------- | ------------------------------------------------------------ |
| at              | string                              | 指定元素被放置冲突时的边缘，比如 left bottom                 |
| collision(冲突) | string                              | 当被移动的元素溢出它的容器，将其移动到另一个供选择的位置。   |
| my              | sting                               | 预计在位置冲突的时候，指定用于对齐的边缘。比如 right top     |
| of              | selector,jQuery,object,event object | 指定位置冲突时，被放置的元素。                               |
| offset          | string                              | 移动被放置的元素到指定像素。例如，10,20 x,y                  |
| using           | function                            | 接收一个函数，查看被放置元素的实际位置。这个函数接收一个包含top和left值新位置的对象 |

 

2.使用位置功能

```html
<!DOCTYPE HTML>
<html>
  
  <head>
    <meta charset="utf-8">
    <title>Position Utility - position</title></head>
  
  <body>
    <style>
        .ui-positioning-element { width:200px; height:200px; border:1px solid #000;} 
        .ui-positioned-element { width:100px; height:100px; border:1px solid #ff0000;
    </style>
    <div class="ui-positioning-element">I am being positioned against</div>
    <div class="ui-positioned-element">I am being positioned</div>
    <script src="development-bundle/jquery-1.4.4.js"></script>
    <script src="development-bundle/ui/jquery.ui.position.js"></script>
    <script>(function($) {

        $(".ui-positioned-element").position({
          of: ".ui-positioning-element",
          my: "right",
          at: "left"
        });

      })(jQuery);</script>
  </body>

</html>
```

此处样式一定要定义在元素之前，不然显示不正常。这样设置后，两个元素的右下角相交。

2.避免冲突

```javascript
$(".ui-positioned-element").position({
    of: ".ui-positioning-element",
    my: "right",
    at: "left"
})
```

设置一个元素的右边缘与另一个元素的左边缘对齐。此时两个元素相弹(flip)，不会重合。

```javascript
$(".ui-positioned-element").position({
    collision: "fit",
    of: ".ui-positioning-element",
    my: "right",
    at: "left",
});
```

当添加 collision:”fit” 选项时，两个元素内相交。

3.使用函数

```javascript
$(".ui-positioned-element").position({
    of: ".ui-positioning-element",
    my: "right bottom",
    at: "right bottom",
    using: function(pos) {
        $(this).css({
            backgroundColor: "#fc7676",
            top: pos.top,
            left: pos.left
        });
    }
});
```

此时pos为positioned的左定点。