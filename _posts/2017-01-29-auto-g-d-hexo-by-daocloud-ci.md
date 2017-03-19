---
title: 通过DaoCloud的持续集成发布Hexo博客
date: 2017-01-29 22:47:04
tags: [ci,DaoCloud,持续集成,Hexo]
categories: 技术文档
catalog:  true
---
[TOC]

# 什么是持续集成

>持续集成是一种软件开发实践，即团队开发成员经常集成它们的工作，通过每个成员每天至少集成一次，也就意味着每天可能会发生多次集成。 每次集成都通过自动化的构建（包括编译，发布，自动化测试）来验证，从而尽早地发现集成错误。

在Hexo博客中，运用持续集成可以让你在每一台设备上都能够更新博客，拜托本地hexo的束缚。

需要用到的：Coding.net; Daocloud; git; hexo; node.js

# 环境搭建

## 安装git

访问 [git](https://git-scm.com/) 下载并且安装适合你的操作系统的版本

## 安装node.js

访问 [node.js](https://nodejs.org/zh-cn/) 下载并且安装适合你的操作系统的版本

## 安装hexo

[hexo](https://hexo.io/zh-cn/)

# 连接Coding.net

在Coding.net上新建一个**私有**项目，以下我们称之为博客源项目，将你在本地安装的hexo推送到该项目的master分支。

>为什么必须使用私有项目，因为稍后我们需要在这个项目内上传私钥。

# 配置DaoCloud

## 创建项目

![屏幕截图(98).png](https://ooo.0o0.ooo/2017/01/29/588e0652bf3ab.png)

新建项目时，在设置代码源处选择Coding.net，并且选择你所创建的博客源项目，开启持续集成，执行环境选择国外，发布应用镜像选择镜像仓库。

## 配置

- 配置持续构建流程
  在hexo博客文件夹的根目录下新建一个名为daocloud.yml的文件，文件名全部小写，写入以下内容：

```yaml
version: "2.0"
test:
    image: daocloud.io/starkchen/blog_ci:latest  #镜像地址

    install:
        # 安装npm依赖
        - npm install

    before_script:
        # 新建存放私钥目录
        - mkdir ~/.ssh
        # 将私钥放入目录
        - mv .daocloud/id_rsa ~/.ssh/id_rsa
        # 将ssh配置文件放入目录
        - mv .daocloud/ssh_config ~/.ssh/config
        # 修改私钥和配置文件为可读权限
        - chmod 600 ~/.ssh/id_rsa
        - chmod 600 ~/.ssh/config
        # 启动ssh-agent
        - eval $(ssh-agent)
        # 添加私钥
        - ssh-add ~/.ssh/id_rsa
        # 删除存放私钥和配置的目录及文件
        - rm -rf .daocloud
        # 配置git全局的用户名和邮件，没有配置不能clone
        - git config --global user.name "StarkChen"
        - git config --global user.email "stark_chen@outlook.com"

    script:
        # 清除之前生成的文件
        - hexo clean
        # 生成要发布的静态博客文件
        - hexo g
        # 根据Hexo配置的发布方式和地址进行发布
        # 项目_config.yml发布为git方式，且使用了ssh连接，因此才有上面的安装私钥的过程
        - hexo d
        # 删除私钥文件夹
        - rm -rf ~/.ssh/ 

# 必须有build环节，虽说感觉意义不是特别大
build:
    image:
        dockerfile_path: Dockerfile
        build_dir: /
        cache: true
```

镜像地址：DaoCloud控制台>镜像仓库>镜像 找到

![屏幕截图(99).png](https://ooo.0o0.ooo/2017/01/29/588e09e39a8a1.png)

- 配置git仓库

在.gitignore文件中插入以下字段

```
.DS_Store
Thumbs.db
*.log
public/
.deploy*/
```

- 配置容器
  在根目录下新建Daokerfile文件，注意此文件名称需要区分大小写。

```
FROM node:slim
MAINTAINER your_name <your_email>
# instal basic tool 
RUN apt-get update && apt-get install -y git ssh-client ca-certificates --no-install-recommends && rm -r /var/lib/apt/lists/*
# set time zone
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
RUN npm install
# install hexo
RUN npm install hexo-cli -g
# install hexo server
RUN npm install hexo-server
# set base dir
#RUN mkdir /hexo
# set home dir
#WORKDIR /hexo

EXPOSE 4000
#CMD ["/bin/bash"]
```

注意自行修改your_name和your_email字符串

- 配置密匙
  在根目录下新建 .daocloud 目录，拷贝你的 id_rsa 进入

新建一个名为 ssh_config 的文件，写入以下内容

```
StrictHostKeyChecking no
UserKnownHostsFile /dev/null
```

将所有更改提交到git仓库

# 完成

接下来的行为将由DaoCloud自动完成。









