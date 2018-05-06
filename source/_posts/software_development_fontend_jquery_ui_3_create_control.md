---
title: Software Development FontEnd 【jQuery UI 1.8 The User Interface Library for jQuery】.学习笔记.3.创建控件
date: 2013-08-14 00:31:45
categories:
- Software Development
tags:
- Software Development
- jQuery
- JavaScript
- FontEnd
---



像jQuery提供 fn.extend() 方法从而可以简单地创建插件一样，jQuery UI也提供了机制使得创造插件变得简单，也确保了公共API功能在新的插件中被保留。

1.首先，创建一个名为  jquery.ui.calculator.js 的文件，代码如下：

```javascript
(function($) {
    $.widget("ui.calculator", {
        options: {
            autoShow: true,
            currentSum: []
        },
        _create: function() {},
        destroy: function() {},
        disable: function() {},
        enable: function() {},
    });
})(jQuery);
```

我们通过 $.widget() 方法定义我们的插件。这个方法接受两个参数。第一个参数定义该插件的名称，此名称需以 ui 命名空间开头。第二个参数是可选属性，表示插件的功能，包含属性和方法。

此处，我们有两个配置选项。

autoShow定义当页面加载时，是否播放。

currentSum是一个空数组。

_create用来添加初始化函数，

destrory,disable,enable方法是公共API，我们总是需要定义这些方法。

\2. _create函数代码如下

```javascript
_create: function() {
    var div = $("<div ></div>"),
    list = $("<ul></ul>", {
        "class": "ui-helper-reset ui-helper-clearfix"
    }),
    li = $("<li ></li>", {
        "class": "ui-corner-all ui-state-default"
    }),
    a = $("<a />", {
        href: "#",
        "class": "ui-calculator-button"
    }),
    container = div.clone().addClass("ui-calculator-container ui-corner-all ui-widget- 
 content ui-helper-clearfix"),
    display = div.clone().addClass("ui-corner-all ui-widget-content ui-calculator- 
 display").text("0").appendTo(container),
    numberpad = div.clone().addClass("ui-calculator-numberpad").appendTo(container),
    functionpad = div.clone().addClass("ui-calculator-functionpad").appendTo(container),
    numberlist = list.clone().appendTo(numberpad),
    functionlist = list.clone().appendTo(functionpad),
    buttons = ["", "clear", 7, 8, 9, 4, 5, 6, 1, 2, 3, 0, "."],
    functions = ["/", "*", "-", "+", "="];
    for (var x = 0; x < buttons.length; x++) {
        var listitem = li.clone().appendTo(numberlist),
        linky = a.clone().text(buttons[x]).appendTo(listitem);
        if (x === 0) {
            $("<span />", {
                "class": "ui-calculator-icon ui-icon ui-icon-arrowthick-1-w",
                text: "Backspace"
            }).appendTo(linky);
        } else if (x === 1 || buttons[x] === 0) {
            linky.addClass("ui-calculator-button-wide");
        }
    }
    for (var y = 0; y < functions.length; y++) {
        var listitem2 = li.clone().addClass("ui-state-default").appendTo(functionlist),
        linky2 = a.clone().text(functions[y]).appendTo(listitem2);
    }
    this.element.addClass("ui-calculator ui-widget ui-helper-reset"); (this.options.autoShow) ? container.appendTo(this.element) : container.appendTo(this.element).hide();
    this.element.this("li").bind({
        mouseenter: this._addHoverState,
        mouseleave: this._removeHoverState,
        click: this._buttonClick
    });
},

```

一开始我们定义了一些列的变量。前四个变量（div , ul , li , a）是我们创建用来构建控件必须的一系列元素。我们添加任何必须的每次基本元素上我们都要用到的一般属性。如 class,anchor,href.

接下来的六个变量是实际的元素，比用来构建控件，从基本元素克隆而来，并添加主题必须的class扩展他们。

我们使用for 循环在 buttonpad 容器中创建按钮容器。按钮由 <a> 构成，被包装在 <li> 中。他们中的一些按钮不是数字键，如回退，清除键。回退键有一个额外的 <span> ，用来显示 返回箭头 的图标。这是按钮数组中的第一个按钮。

清除键和 0 键，比其余的按键宽，我们知道清除label是按钮数组中的第二个按钮，所以我们能发现试用了数组索引1。 0 键是检查实际数组的值。这两个按键使用 ui-calculator-button-wide，其他按键上使用 ui-calculator-button。

我们使用另一个循环创建功能键，如除，乘等。将他们追加到第二个容器中。这时，没有一个按钮拥有附加元素或特殊的class，所以我们不需要 if 条件。

在函数中定义的this对象被局限于我们的插件。jQuery UI给我们的对象添加了两个特殊的属性，第一个是被称为 元素 ，指向触发插件方法的实际元素。第二个被称为 选项，参照 我们在插件一开始定义的属性配置对象。

当插件方法被触发时，我们通过 this.element 给元素添加一些 class 。这时我们检查 autoShow 选项，如果是默认值——true，我们只需附加我们的插件到页面。如果设为 false，我们依然附加它，但是立即 hide 它。

_create函数中做的最后一件事情，是附加一些 event handles 给 <li>。我们还没有 event handles 函数，添加后，我们能通过 this 对象访问他们。event handling 功能不能直接实现，我们用下划线做前缀。

3.公共API方法

```javascript
destroy: function() {
    $.Widget.prototype.destroy.call(this, arguments);
    this.element.removeClass("ui-calculator ui-widget ui-helper-reset");
    this.element.find("li").unbind();
    this.element.children(":first").remove();
},
disable: function() {
    $.Widget.prototype.disable.call(this, arguments);
    this.element.find("li").unbind();
},
enable: function() {
    $.Widget.prototype.enable.call(this, arguments);
    this.element.find("li").bind({
        mouseenter: this._addHoverState,
        mouseleave: this._removeHoverState,
        click: this._buttonClick
    });
},
```

所有这些功能遵循一个共同的格式，jQuery UI为我们做了重量级的。控件工厂已经定义了他们的方法，我们要做的是调用控件工厂使用JavaScript call() 函数定义的原始方法。原始方法能使用我们希望调用、附加给 $.Widget.prototype 的方法的名字，通过控件属性被访问。我们可以提供一些附加的代码。

在销毁功能中，我们移除了 class ，解除绑定了 event handlers ，移除了 DOM 结构。

在禁用功能中，我们再一次调用控件原始 禁用功能，然后简单地解除按钮上绑定的 over-states和 点击 。

在启用功能中，我们再一次调用控件工厂的原始启用方法，然后再一次添加我们的event handles。

3.添加自定义方法

我们提供了 autoShow选项，所以我们的控件可以附加到页面但不立即显示。我们需要提供一个在需要时，可以被用来显示控件的方法。

```javascript
show: function() {
    var el = this.element.children(":first");
    if (el.is(":hidden")) {
        el.show();
    }
    this._trigger("show", null, this.element);
},
```

我们的方法用一个键 show 存储着，所以开发者可以想使用我们已经定义的标准API方法

（如$(”#el”).calculator(“show”)）一样使用它。在这个功能中我们需要做的是找到那个附在了控件的外层元素的第一个子元素，并在当前隐藏的情况下显示它。

一旦我们显示计算器，我们就出发了自定义事件。当开发者使用我们的控件hook关键的交互点时，这使得它变得很有用。 _trigger()方法接收三个参数：第一个用于触发事件，第二个用于原始浏览器事件对象，第三个是参照存储在 this.element中的元素。即使在自定义方法中，this 对象依然局限于我们的控件实例。注意这个 this 可以被任何我们想要传给 handler功能的开发者为我们自定义事件定义的 hash 键值对 。

4.在 _create()功能中，我们绑定了一些时间，如 mouseenter ,mouseleave ,click 。我们现在需要添加 handler 功能，当这些events 检测到被我们的空间检测到时，做出反应。

```javascript
_addHoverState: function() {
    $(this).addClass("ui-state-hover");
},
_removeHoverState: function() {
    $(this).removeClass("ui-state-hover");
},
_buttonClick: function() {
    var buttonText = $(this).text(),
    display = $(".ui-calculator-display"),
    newArray = $.ui.calculator.prototype.options.currentSum;
    if (buttonText == "Backspace") {
        if (display.text() !== "0" && display.text().length > 1) {
            newArray.pop();
            $.ui.calculator.prototype.options.currentSum = newArray;
            display.text(function(i, orig) {
                return orig.substring(0, orig.length - 1);
            });
        }
    } else if (buttonText == "clear") {
        $.ui.calculator.prototype.options.currentSum = [];
        display.text("0");
    } else if (buttonText == "=") {
        result = eval($.ui.calculator.prototype.options.currentSum.join(""));
        display.text(result);
        $.ui.calculator.prototype.options.currentSum = [result];
    } else if (buttonText == "/" || buttonText == "*" || buttonText == "-" || buttonText == "+") {
        $.ui.calculator.prototype.options.currentSum.push(buttonText);
        display.text(buttonText);
    } else {
        $.ui.calculator.prototype.options.currentSum.push(buttonText);
        if (display.text() == "0" || display.text() == "/" || display.text() == "*" || display.text() == "-" || display.text() == "+") {
            display.text("");
        }
        display.text(function(i, orig) {
            return orig + buttonText;
        });
    }
}
```

当mouseenter和mouseleae事件被检测到，这个功能被调用。我们仅仅添加和移除适合的状态class ，这样 悬停状态被应用并分别被移除。

点击 handler 有点复杂，但是所有我们做的，是检查按钮被点击，并且为不同类型的按钮不同方式的反应。

在单击 handler中，我们做的第一件事，是存储一些变量，包括被点击按钮的文本，控件的播放元素，currentSum 配置选项的备份。因为 this 对象不再局限于我们的控件实例，我们不能使用this.options访问这个选项，但是我们依然可以通过使用$.ui.calculator.prototype.options这个控件属性访问他们。

我们这时有一个if 声明，检查每个按钮的类型，包括 backspace ，clear ，= ，/，+等功能键和数字键。

如果回退键 被点击，我们检查 显示 不是仅仅由 0 构成，并且将要显示的文本长度比一个字节长。如果条件，我们将控件属性中获得的 currentSum 移除最后一个项目。使用新的短数组更新currentSum，并且这时从将要显示的文本中移除最后一个字符。

如果清除键被点击，我们仅仅通过设置currentSum选项的值为空数组来清空它，并且将显示块重设为0。

如果 = 键被点击，我们估计存储在currentSum数组中的表达式，在显示元素中显示结果，并在这时更新currentSum，以使它近包含结果。

如果任何其他功能键被点击，我们仅仅添加按键上的文本到currentSum数组，并将显示元素的文本为被点击按键的文本。

最后，如果任何数字键被点击，我们首先检查当前将要显示在计算器上的是什么。如果它是0或功能键，我们清空显示元素。我们这时用心数字更新显示。这时如果一个数字已经被点击，这时显示向新数字一样被更新为包含原始数字。但是如果功能键被按下，数字像一个新数字 +1。

5.控件的样式表

```css
.ui - calculator {
    width: 9.65em;
}
.ui - calculator - container {
    padding: .2em.2em 0;
}
.ui - calculator - display {
    width: 12.3em;
    padding: .3em;
    margin - bottom: .3em;
    font - size: 0.7em;
    overflow: auto;
}
.ui - calculator - numberpad {
    width: 7em;
    float: left;
}
.ui - calculator - functionpad {
    width: 2em;
    float: left;
}
.ui - calculator li {
    float: left;
    margin: 0.2em.2em 0;
}
.ui - calculator - button {
    display: block;
    width: 2em;
    height: 1.2em;
    padding: .3em 0.5em;
    text - align: center;
    border: 0;
}
.ui - calculator - button - wide {
    width: 4.3em;
}
.ui - calculator - icon {
    margin: .2em auto;
}
```

  jquery.ui.calculator.css

6.使用控件

```html
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="utf-8">
    <title>Widget Factory - calculator</title>
    <link rel="stylesheet" href="css/smoothness/jquery-ui-1.8.9.custom.css">
    <link rel="stylesheet" href="css/jquery.ui.claculator.css"></head>
  
  <body>
    <div id="calc"></div>
    <script src="development-bundle/jquery-1.4.4.js"></script>
    <script src="development-bundle/ui/jquery.ui.core.js"></script>
    <script src="development-bundle/ui/jquery.ui.widget.js"></script>
    <script src="js/jquery.ui.calculator.js"></script>
    <script>(function($) {
        $("#calc").calculator({
          autoShow: false,
          show: function(e, ui) {
            alert(e + ", " + $(ui).attr("id");
          }
        });
      })(jQuery);</script>
  </body>

</html>
```



