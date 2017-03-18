---
title: MDL中文文档-现在开始
date: 2017-01-26 18:47:04
tags: [MDL,材料设计,Material Design,Google,翻译,中文文档]
categories: [文档,MDL中文文档]
---
# 现在开始

## 本篇目包含内容

- 包含主要的CSS和JavaScript框架

- 使用零部件

- 通用的规则

- 在动态的网站上使用MDL

- MDL的职责在于什么？

- 接下来呢？

- 许可证

# 在HTML文件中引用主要的CSS和JavaScript框架

想要在你的每一个HTML页面中使用MDL，我们提供文件的hosted在我们对CDN服务器上，你也可以下载并且定制他们，通过npm/bower的方式获取项目的源代码并且安装他们

## 获取方式

### hosted

在你的HTML文档中插入这些代码，他们包含了Material的图标字体，这些代码将会提供一个27kB大小的压缩包

```html
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
```

### 下载

下载一个Javascript的包：https://code.getmdl.io/1.3.0/mdl.zip

在你的HTML文档中插入这些代码，他们包含了Material的图标字体

```html
<link rel="stylesheet" href="./material.min.css">
<script src="./material.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
```

### Build 

在MDL的[Github](https://github.com/google/material-design-lite)上下载源代码并且build它。

在控制台运行这些命令

    # Clone/copy the Material Design lite source code.
    git clone https://github.com/google/material-design-lite.git
    # Go into the newly created folder containing the source code.
    cd material-design-lite
    # Install necessary dependencies.
    npm install && npm install -g gulp
    # Build a production version of the components.
    gulp

你可以在dist文件夹找到MDL的目录，然后把他们复制到你的项目当中

在你的HTML文档中插入这些代码，他们包含了Material的图标字体

### Bower

Bower提供了一个简易的方式去安装MDL，并且使用他们

在控制台运行这些命令

    bower install material-design-lite --save

MDL的文件夹江会被安装在你的项目中的bower_components文件夹中。

你需要在HTML文档中插入这些代码，他们包含了MDL的图标字体

```html
<link rel="stylesheet" href="/bower_components/material-design-lite/material.min.css">
<script src="/bower_components/material-design-lite/material.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
```

### NPM 

另一个简单的安装方式是NPM，你可以在控制台运行这些命令

    npm install material-design-lite --save

MDL的文件将会被安装在你的项目中的node_modules文件夹里

在你的HTML文档中插入这些代码，他们包含了Material的图标字体

```html
<link rel="stylesheet" href="/node_modules/material-design-lite/material.min.css">
<script src="/node_modules/material-design-lite/material.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
```

### 备注：选择颜色方案

颜色方案在MD中极为重要，HOSDED提供的是默认的indigo-pink颜色，同时，我们的CDN主机也提供了一些常见的配色方案。如果你想定义个性的颜色，我们也提供了定制和预览的工具

就这样了！你已经准备好在你的网站上使用Material Design LIte！

# 使用零部件

你会发现下面几个MDL例子按钮元素：一个带涟漪效果的按钮和一个FAB按钮。只需复制和粘贴在相应的HTML页面中<body>标签内，元素将呈现如下图所示。

涟漪按钮：

```html
<!-- Accent-colored raised button with ripple -->
<button class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
Button
</button>
```

FAB:

```html
<!-- Colored FAB button -->
<button class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored">
<i class="material-icons">add</i>
</button>
```

可以通过调节CSS类来调整和配置MDL元素。例如，添加 mdl-js-ripple-effect 使得一个按钮被点击时产生涟漪效果。添加 mdl-button--fab可以使得一个按钮变为FAB风格按钮。

还有诸多其他元素，例如卡片容器，滑块，表格和菜单。将会在组件页面有详细的介绍。

我们还建议你欣赏一下MDL的示例模板，随时查看他们，为你的项目提供参考。

## 原则

一般来说，你需要按照一下基本步骤来在html页面中使用MDL组件

1. 从标准的HTML元素上开始，例如按钮或者div标签，这取决于你想要在哪个元素上使用MDL。这将会在页面上建立元素，以便于你进行MDL的修改。

2. 添加一个或多个特定的MDL-CSS类元素，例如 mdl-button 或 mdl-tabs__panel, again depending on the component *求助*。类将会把MDL的效果应用于元素

请检视你的页面以便于在移动设备上更好地显示

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

* 关于HTML元素和MDL CSS类的注释 *
  *MDL采用命名空间BEM类，它可以适用于绝大多数的HTML元素来构建适合的逐渐。对于一些组件，你可以给他们应用任何的元素。这些范例将会在每个组件的文档中得到体现，如果您必须使用示例中显示的元素以外的其他元素，我们建议您尝试为您的应用程序找到HTML元素和MDL CSS类的最佳组合。*

## 在动态网站上使用MDL

Material Design Lite在页面加载时会自动注册和渲染标记有MDL类的所有元素。但是如果你在动态的网站上创建DOM元素，你需要注册使用新元素upgradeElement的功能。这里是如何可以动态创建相同的凸起按钮与上面部分中所示的涟漪效果：

```html
<div id="container"/>
<script>
    var button = document.createElement('button');
    var textNode = document.createTextNode('Click Me!');
    button.appendChild(textNode);
    button.className = 'mdl-button mdl-js-button mdl-js-ripple-effect';
    componentHandler.upgradeElement(button);
    document.getElementById('container').appendChild(button);
</script>
```

# MDL的职责是什么？

MDL旨在为网站提供基本的，轻量级的采用Material Design的组件和模板。这个项目并不打算提供结构来满足所有可能的UX需求，而只是为你建立一个Material Design风格网站提供一个低门槛的实现。即使在材料设计本身，提供每一个组件的无缝组合方式都是不可行的。当你发现你需要一些组件以外的东西，例如抽屉里的下拉菜单，你可能需要编写自己的逐渐。

# 接下来呢？

下一步将会介绍组件，包括MDL类及其效果

# 许可证

Apache2


[原文](https://getmdl.io/started/index.html)

[Github项目](https://github.com/Stark2Chen/Material-Design-Lite-Docs-zh-CN-)


