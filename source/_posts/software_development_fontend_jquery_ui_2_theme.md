---
title: Software Development FontEnd 【jQuery UI 1.8 The User Interface Library for jQuery】.学习笔记.2.更换主题
date: 2013-08-13 12:01:45
categories:
- Software Development
tags:
- Software Development
- jQuery
- JavaScript
- FontEnd
---



```html
<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8">
  <title>Widget Factory - calculator
  </title>
  <link rel="stylesheet" 
    href="css/smoothness/jquery-ui-1.8.9.custom.css">
  <link rel="stylesheet"   href="css/jquery.ui.claculator.css">
  </head>
  <body>
    <div id="calc">
    </div>
    <script src="development-bundle/jquery-1.4.4.js">
    </script>
    <script src="development-bundle/ui/jquery.ui.core.js">
    </script>
    <script  
      src="development-bundle/ui/jquery.ui.widget.js">
    </script>
    <script src="js/jquery.ui.calculator.js">
    </script>
    <script>
      (function($) {
        $("#calc").calculator({
          autoShow: false,
          show: function(e, ui) {
            alert(e + ", " + $(ui).attr("id");
          }
        });
      })(jQuery);
    </script>
  </body>
</html>
```

