---
title: 特定平台的安装指南
date: 2018-06-30 16:36:52
---

# 特定平台的安装指南

## Windows

Julia可以在Windows 7及更高版本上运行，支持32位和64位版本。

1. 为您的平台下载Windows的julia.exe安装包。32位Julia可以在x86和x86_64平台上运行。而64位julia只能在64位系统上运行（x86_64）。
2. 运行下载的程序来释放julia
3. 在安装目录下双击julia快捷方式来启动julia

Windows 7/Windows Server 2012 用户需要另外安装：
 - 为了能让包管理器正常工作需要[TLS easy_fix](https://support.microsoft.com/en-us/help/3140245/update-to-enable-tls-1-1-and-tls-1-2-as-a-default-secure-protocols-in) 参见 [这个 Discourse thread](https://discourse.julialang.org/t/errors-for-git-pkg/9351)。
 - [Windows Management Framework 3.0或更高版本](https://docs.microsoft.com/en-us/powershell/wmf/readme)来获得PowerShell 3.0或更高版本。

这个[Windows README](https://github.com/JuliaLang/julia/blob/master/README.windows.md)包含了相关依赖信息。

您可以通过删除安装目录包目录`%HOME%/.julia`来卸载安装。如果你想删除你的配置文件，请删除`%HOME%/.juliarc.jl` and `%HOME%/.julia_history`。

## macOS

在Mac上，我们提供`Julia-<version>.dmg`，它包含了一个Julia.app。它的安装和其它Mac软件的安装一样——将`Julia-<version>.app`拷贝到你的硬盘上即可。Julia支持macOS 10.8以及更新版本。

卸载Julia仅需删除Julia.app并删除在包目录`~/.julia`下的包。多个Julia.app二进制文件可以同时存在而不会影响其它的二进制文件工作。如果你想删除你的配置文件，请移除`~/.juliarc.jl`。

此外你也可以通过`brew`来安装Julia，这将通过[Homebrew包管理器](https://brew.sh/)下载一个 .dmg 文件。在终端里运行如下命令

    brew cask install julia

## Linux and FreeBSD

强烈建议使用官方下载页面提供的通用二进制文件（你也可以在中文社区的下载页面找到）来在Linux或者FreeBSD上安装Julia。

### Generic Binaries

通用的Linux和FreeBSD二进制文件不需要任何安装步骤，但是你需要保证你的系统可以找到`julia`二进制文件。首先请解压从[下载页面](index.html)获得的`.tar.gz`文件到一个文件夹里。你可以通过以下方式运行Julia：

* 在系统路径`PATH`所包含的文件夹中创建一个到`julia`的符号链接（symbolic link）
* 添加Julia的二进制文件（在`bin`文件夹中）到系统路径`PATH`中
* 通过完整路径来调用`julia`的可执行文件，例如`<你的解压目录>/bin/julia`

如果你想在`/usr/local/bin`中创建符号链接，你可以这么做：

    sudo ln -s <你的解压路径>/bin/julia /usr/local/bin/julia

在一些Linux发行版中，你可能会需要不同于`/usr/local/bin`的目录。你可以通过运行`echo $PATH`来查看你的`PATH`环境变量中都有哪些目录。

### 特定发行版的安装包

下列针对不同发行版的安装包是由社区维护的。他们也许并不具有正确版本的Julia依赖或者不具有官方二进制文件所包含的重要补丁。一般来讲，Julia开发团队只接受能够在官方二进制文件上重现的错误报告。

由于越来越多的Linux发行版开始包含Julia，这里会添加相关的指引。如果你的Linux发行版没有在列，你应当通过源码编译julia。你可以查看[Julia README](https://github.com/JuliaLang/julia/blob/master/README.md)来查看详细的编译信息。

### Fedora/RHEL/CentOS/SL/OEL
我们为Fedora, RHEL, CentOS, Scientific Linux and Oracle Enterprise Linux 系统提供了一个[Copr 仓库](https://copr.fedoraproject.org/coprs/nalimilan/julia/)这将使得你可以自动更新到最新的稳定版Julia。

如果你使用RHEL，CentOS，Scientific Linux or Oracle Enterprise Linux (版本 5 或者更高)，首先为你的发行版[启用 EPEL](https://fedoraproject.org/wiki/EPEL#How_can_I_use_these_extra_packages.3F)。然后运行下面的步骤：

如果你在使用Fedora（版本19或者更高），请直接运行：

    sudo dnf copr enable nalimilan/julia
    sudo yum install julia

如果你正在使用CentOS（版本7或者更高），请直接运行：

    sudo yum-config-manager --add-repo https://copr.fedorainfracloud.org/coprs/nalimilan/julia/repo/epel-7/nalimilan-julia-epel-7.repo
    sudo yum install julia

如果`dnf` 和 `yum-config-manager`都不支持你的发行版，那么请从Copr主页下载相关的`.repo`文件，并将它拷贝到`/etc/yum.repos`，然后运行第二条命令。

注意Fedora指引建议升级最新的官方仓库：否则你的发行版将不会提供最新的Julia版本。在报告错误时，请保证你在使用的是最新支持的发行版（release版本）。

### Fedora/RHEL/CentOS/SL/OEL 开发版安装指南

我们为Fedora, RHEL, CentOS, Scientific Linux and Oracle Enterprise Linux 系统提供了一个[Copr 仓库](https://copr.fedoraproject.org/coprs/nalimilan/julia-nightlies/)这将使得你可以自动更新到最新的开发版Julia。

如果你使用RHEL，CentOS，Scientific Linux or Oracle Enterprise Linux (版本 5 或者更高)，首先为你的发行版[启用 EPEL](https://fedoraproject.org/wiki/EPEL#How_can_I_use_these_extra_packages.3F)。然后运行下面的步骤：

如果你在使用Fedora（版本19或者更高），请直接运行：

    sudo dnf copr enable nalimilan/julia-nightlies
    sudo yum install julia

如果`dnf` 和 `yum-config-manager`都不支持你的发行版，那么请从Copr主页下载相关的`.repo`文件，并将它拷贝到`/etc/yum.repos`，然后运行第二条命令。

每个晚上都会编译一个新的版本，如果你已经安装来julia并且你想要升级到最新版，只需：

    sudo yum upgrade julia

### FreeBSD Ports

你可以通过[Ports Collection](https://svnweb.freebsd.org/ports/head/lang/julia/)安装Julia。
首先你需要从FreeBSD二进制包管理器安装Julia，`pkg`，运行

    pkg install julia


在Ports框架内编译并安装Julia，运行：

    cd /usr/ports/lang/julia
    make clean
    make install

## 卸载Julia

卸载视你安装Julia的方式而定。如果你通过类似于`apt-get` 或者 `yum`的包管理器安装Julia，那么请依然使用包管理器卸载Julia，例如`apt-get remove julia` 或 `yum remove julia`。如果你从源码编译，你可以通过删除你的Julia源码文件夹来删除Julia。如果你同时需要删除Julia配置文件，请删除`~/.julia` 和 `~/.juliarc.jl`。
