---
title: 您与服务器的连接现已加密
date: 2017-01-23 11:42:19
tags: https
thumbnail: https://ooo.0o0.ooo/2017/01/23/5885c8946d7a1.jpg
---
# 您与服务器的连接现已加密

![https.jpg](https://ooo.0o0.ooo/2017/01/23/5885c8946d7a1.jpg)

前一段时间，Github Pages的访问慢得出奇，有时甚至要刷新好几遍才能显示出所有的图标。这本身并不奇怪，出口带宽就是那么大嘛 U_U

但是总是能有解决的办法的，比如把博客迁移到一个访问快一些的网站。于是乎，我选择了Coding.net

Coding.net和Github很相似，同样可以使用git进行代码托管和版本管理，也可以开启静态博客的Pages服务。Coding.net的私有仓库竟然还是免费的！！

---

Hexo博客本身就支持使用Git进行部署，所以只需要在_config.yml文件当中写入如下代码就行了

    deploy:
    type: git
    repo: 
            github: repo link
            coding: repo link
    branch: master

这一段本身就有，通常在_config.yml文件的最后，只要稍加改动就可以了

部署完成之后，在Coding.net仓库当中的Pages服务标签页可以绑定域名，然后我惊奇的发现，下方有一个“强制HTTPS访问”，即使自定义域名之后也可以开启。

打开这个开关，Coding.net便会自动地帮你申请SSL证书，如果验证通过，输入https://你的域名 试试吧！

以上 感谢。

