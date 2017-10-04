---
title: robots.txt 配置教程
date: 2017-01-27 18:47:04
tags: 
    - Hexo
    - robots
    - 爬虫
    - Google
img: https://i.loli.net/2017/08/20/59990dcbbb017.png
copyright: true
---
# robots.txt

robots.txt（统一小写）是一种存放于网站根目录下的 ASCII 编码的文本文件，它通常告诉网络搜索引擎的漫游器（又称网络蜘蛛），此网站中的哪些内容是不应被搜索引擎的漫游器获取的，哪些是可以被漫游器获取的。因为一些系统中的 URL 是大小写敏感的，所以 robots.txt 的文件名应统一为小写。robots.txt 应放置于网站的根目录下。如果想单独定义搜索引擎的漫游器访问子目录时的行为，那么可以将自定的设置合并到根目录下的 robots.txt，或者使用 robots 元数据（Metadata，又称元数据）。
robots.txt 协议并不是一个规范，而只是约定俗成的，所以并不能保证网站的隐私。注意 robots.txt 是用字符串比较来确定是否获取 URL，所以目录末尾有与没有斜杠“/”表示的是不同的 URL。robots.txt 允许使用类似"Disallow: *.gif"这样的通配符。

# 添加 robots.txt

在站点目录的 source 目录中，新建一个名为 robots.txt 的文件，

## 找到你想要索引或是拒绝的搜索引擎的 User-agent：

例如：

    Google：Googlebot
    Google 新闻：Googlebot-News
    Google 图片：Googlebot-Image
    Google 视频：Googlebot-video
[Google 抓取工具页面](https://support.google.com/webmasters/answer/1061943?hl=zh-Hans)

    百度搜索：Baiduspider
    百度图片搜索：Baiduspider-image
    百度视频搜索：Baiduspider-video

## 配置搜索引擎索引的内容

### robots.txt 基本格式

    User-agent: spider_name
    Allow: /path

    Disallow: /path

其中，spider_name 填写*代表所有搜索引擎。

例如：
    # hexo robots.txt
    User-agent: *
    Allow: /
    Allow: /archives/
    Allow: /tags/
    Allow: /categories/

    Disallow: /bloglog/
    Disallow: /js/
    Disallow: /css/
    Disallow: /fonts/
    Disallow: /gallery/

    User-agent: Baiduspider
    Disallow: /

    Sitemap: https://siocx.space/sitemap.xml

### 禁止访问某种特定文件类型

    User-agent: *
    Disallow: /*.php$
    Disallow: /*.js$
    Disallow: /*.inc$
    Disallow: /*.css$

## 设置 sitemap

想要在 hexo 博客创建 sitemap，你需要通过 npm 安装插件

    npm install hexo-generator-sitemap --save

编辑站点配置文件_config.yml，添加如下代码

    # sitemap setting
    sitemap:
    path: sitemap.xml

随后在 robots.txt 文件中添加：

    Sitemap: https://siocx.space/sitemap.xml

执行 hexo g，重新生成网页

执行 hexo d，将博客同步到托管平台

完成！