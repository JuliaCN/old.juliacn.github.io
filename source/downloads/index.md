---
title: 下载
date: 2018-06-30 16:36:52
---

如果你喜欢Julia语言，请考虑在
[GitHub](https://github.com/JuliaLang/julia)上给我们一个star并向他人传播这个词语。


# Current Release (v0.6.3)

我们提供了几种方式来让你们运行Julia：

* 在命令行中使用Julia命令行界面
* 在浏览器中通过[JuliaBox.com](https://www.juliabox.com)在Jupyter notebook上运行。不需要预先安装，只要点开你的浏览器然后注册并开始计算即可。
* 下载由[Julia Computing](http://juliacomputing.com)提供的[JuliaPro](http://juliacomputing.com/products/juliapro.html)。JuliaPro是一个集成了常用外置库的Julia发行版。它包括了[Juno IDE](http://junolab.org)，[Gallium debugger](https://github.com/Keno/Gallium.jl)，和其它一系列用于画图，优化，机器学习，数据库等外部库。


此外，你可以安装[Plots.jl](https://github.com/JuliaPlots/Plots.jl)，一个集成了大部分Julia绘图后端的绘图前端库。其绘图能力由不同的后端提供，例如
[PyPlot.jl](https://github.com/JuliaPy/PyPlot.jl) 和 [Gadfly.jl](http://gadflyjl.org)。通过查看[绘图指引](plotting.html)来安装绘图包。如果你在
使用JuliaBox，那么所有以上提到的绘图包都是预先安装的。

## Julia (命令行版本)

<table class="downloads"><tbody>
<tr>
    <th rowspan="2"> Windows 自解压文档（.exe） <a href="platform.html#windows">[帮助]</a></th>
    <td colspan="3"> <a href="https://julialang-s3.julialang.org/bin/winnt/x86/0.6/julia-0.6.3-win32.exe">32-bit</a> </td>
    <td colspan="3"> <a href="https://julialang-s3.julialang.org/bin/winnt/x64/0.6/julia-0.6.3-win64.exe">64-bit</a> </td>
</tr>
<tr>
    <td colspan="6">Windows 7/Windows Server 2012 用户同时需要安装 <a href="https://support.microsoft.com/en-us/help/3140245/update-to-enable-tls-1-1-and-tls-1-2-as-a-default-secure-protocols-in">TLS "Easy Fix" update</a>, and <a href="https://docs.microsoft.com/en-us/powershell/wmf/readme">Windows Management Framework 3.0 or later</a></td>
</tr>
<tr>
    <th> macOS 安装包（.dmg） <a href="platform.html#macos">[帮助]</a></th>
    <td colspan="6"> <a href="https://julialang-s3.julialang.org/bin/mac/x64/0.6/julia-0.6.3-mac64.dmg">10.8+ 64-bit</a> </td>
</tr>
<tr>
    <th> 通用Linux二进制文件（x86） <a href="platform.html#generic-binaries">[帮助]</a></th>
    <td colspan="3"> <a href="https://julialang-s3.julialang.org/bin/linux/x86/0.6/julia-0.6.3-linux-i686.tar.gz">32-bit</a>
        (<a href="https://julialang-s3.julialang.org/bin/linux/x86/0.6/julia-0.6.3-linux-i686.tar.gz.asc">GPG</a>)</td>
    <td colspan="3"> <a href="https://julialang-s3.julialang.org/bin/linux/x64/0.6/julia-0.6.3-linux-x86_64.tar.gz">64-bit</a>
        (<a href="https://julialang-s3.julialang.org/bin/linux/x64/0.6/julia-0.6.3-linux-x86_64.tar.gz.asc">GPG</a>)</td>
</tr>
<tr>
    <th> 通用Linux二进制文件（ARM） </th>
    <td colspan="3"> <a href="https://julialang-s3.julialang.org/bin/linux/armv7l/0.6/julia-0.6.3-linux-armv7l.tar.gz">32-bit (armv7-a hard float)</a>
        (<a href="https://julialang-s3.julialang.org/bin/linux/armv7l/0.6/julia-0.6.3-linux-armv7l.tar.gz.asc">GPG</a>)</td>
    <td colspan="3"> <a href="https://julialang-s3.julialang.org/bin/linux/aarch64/0.6/julia-0.6.3-linux-aarch64.tar.gz">64-bit (armv8-a)</a>
        (<a href="https://julialang-s3.julialang.org/bin/linux/aarch64/0.6/julia-0.6.3-linux-aarch64.tar.gz.asc">GPG</a>)</td>
</tr>
<tr>
    <th> 通用FreeBSD二进制文件（x86） <a href="platform.html#generic-binaries">[help]</a></th>
    <td colspan="6"> <a href="https://julialang-s3.julialang.org/bin/freebsd/x64/0.6/julia-0.6.3-freebsd-x86_64.tar.gz">64-bit</a>
        (<a href="https://julialang-s3.julialang.org/bin/freebsd/x64/0.6/julia-0.6.3-freebsd-x86_64.tar.gz.asc">GPG</a>)</td>
</tr>
<tr>
    <th> 源码 </th>
    <td colspan="2"> <a href="https://github.com/JuliaLang/julia/releases/download/v0.6.3/julia-0.6.3.tar.gz">Tarball</a>
        (<a href="https://github.com/JuliaLang/julia/releases/download/v0.6.3/julia-0.6.3.tar.gz.asc">GPG</a>) </td>
    <td colspan="2"> <a href="https://github.com/JuliaLang/julia/releases/download/v0.6.3/julia-0.6.3-full.tar.gz">Tarball with dependencies</a>
        (<a href="https://github.com/JuliaLang/julia/releases/download/v0.6.3/julia-0.6.3-full.tar.gz.asc">GPG</a>) </td>
    <td colspan="2"> <a href="https://github.com/JuliaLang/julia/tree/v0.6.3">GitHub</a> </td>
</tr>
</tbody></table>

如果您安装Julia出现了问题，请查看[特定平台的安装指南](platform.html)。可以通过[MD5](https://julialang-s3.julialang.org/bin/checksums/julia-0.6.3.md5)和[SHA256](https://julialang-s3.julialang.org/bin/checksums/julia-0.6.3.sha256)格式来校验和（checksum）。

如果您无法使用上面提供的安装方式，请[提交一个issue](https://github.com/JuliaLang/julia/issues)。

# 即将到来的测试版本 (v0.7.0-beta)

我们当前正在测试Julia的下一个release版本，v0.7.0。如果您安装Julia出现了问题，请查看[特定平台的安装指南](platform.html)。类似于最新的稳定版，有[MD5](https://julialang-s3.julialang.org/bin/checksums/julia-0.7.0-beta.md5)
和 [SHA256](https://julialang-s3.julialang.org/bin/checksums/julia-0.7.0-beta.sha256)两种格式可以用于校验和（checksum）。请在下面下载测试版本并向
[issue tracker](https://github.com/JuliaLang/julia/issues)报告您遇到的错误。

<table class="downloads">
<tbody>
<tr>
    <th rowspan="2"> Windows Self-Extracting Archive (.exe) <a href="platform.html#windows">[help]</a></th>
    <td colspan="3"> <a href="https://julialang-s3.julialang.org/bin/winnt/x86/0.7/julia-0.7.0-beta-win32.exe">32-bit</a> </td>
    <td colspan="3"> <a href="https://julialang-s3.julialang.org/bin/winnt/x64/0.7/julia-0.7.0-beta-win64.exe">64-bit</a> </td>
</tr>
<tr>
    <td colspan="6">Windows 7/Windows Server 2012 用户同时需要安装 <a href="https://support.microsoft.com/en-us/help/3140245/update-to-enable-tls-1-1-and-tls-1-2-as-a-default-secure-protocols-in">TLS "Easy Fix" update</a>, and <a href="https://docs.microsoft.com/en-us/powershell/wmf/readme">Windows Management Framework 3.0 or later</a></td>
</tr>
<tr>
    <th> macOS 安装包（.dmg） <a href="platform.html#macos">[帮助]</a></th>
    <td colspan="6"> <a href="https://julialang-s3.julialang.org/bin/mac/x64/0.7/julia-0.7.0-beta-mac64.dmg">10.8+ 64-bit</a> </td>
</tr>
<tr>
    <th> 通用Linux二进制文件（x86） <a href="platform.html#generic-binaries">[帮助]</a></th>
    <td colspan="3"> <a href="https://julialang-s3.julialang.org/bin/linux/x86/0.7/julia-0.7.0-beta-linux-i686.tar.gz">32-bit</a>
        (<a href="https://julialang-s3.julialang.org/bin/linux/x86/0.7/julia-0.7.0-beta-linux-i686.tar.gz.asc">GPG</a>)</td>
    <td colspan="3"> <a href="https://julialang-s3.julialang.org/bin/linux/x64/0.7/julia-0.7.0-beta-linux-x86_64.tar.gz">64-bit</a>
        (<a href="https://julialang-s3.julialang.org/bin/linux/x64/0.7/julia-0.7.0-beta-linux-x86_64.tar.gz.asc">GPG</a>)</td>
</tr>
<tr>
    <th> 通用FreeBSD二进制文件（x86） <a href="platform.html#generic-binaries">[help]</a></th>
    <td colspan="6"> <a href="https://julialang-s3.julialang.org/bin/freebsd/x64/0.7/julia-0.7.0-freebsd-x86_64.tar.gz">64-bit</a>
        (<a href="https://julialang-s3.julialang.org/bin/freebsd/x64/0.7/julia-0.7.0-freebsd-x86_64.tar.gz.asc">GPG</a>)</td>
</tr>
<tr>
    <th> 源码 </th>
    <td colspan="2"> <a href="https://github.com/JuliaLang/julia/releases/download/v0.7.0-beta/julia-0.7.0-beta.tar.gz">Tarball</a>
        (<a href="https://github.com/JuliaLang/julia/releases/download/v0.7.0-beta/julia-0.7.0-beta.tar.gz.asc">GPG</a>) </td>
    <td colspan="2"> <a href="https://github.com/JuliaLang/julia/releases/download/v0.7.0-beta/julia-0.7.0-beta-full.tar.gz">Tarball with dependencies</a>
        (<a href="https://github.com/JuliaLang/julia/releases/download/v0.7.0-beta/julia-0.7.0-beta-full.tar.gz.asc">GPG</a>) </td>
    <td colspan="2"> <a href="https://github.com/JuliaLang/julia/tree/v0.7.0-beta">GitHub</a> </td>
</tr>
</tbody>
</table>

# 旧的发行版

中文社区暂时不提供旧的发行版，请访问官网页面[Older releases page](http://julialang.org/downloads/oldreleases.html)。

# 开发版本

开发版本是当前Julia最新的不稳定版本，你可以在[开发版页面](https://julialang.org/downloads/nightlies.html)下载到。开发版主要是为了帮助开发者预览最新的工作，而不是为一般使用而编译的。我们建议大部分用户下载上面的稳定版。

---

# 下载校验

所有的Julia二进制文件都通过系统自带的传统加密方式进行安全校验。macOS和Windows发行版在安装钱会被通过被系统认证的证书进行签名。通用Linux二进制文件通过[GPG秘钥](downloads/juliareleases.asc)进行校验。Ubuntu 和 Fedora/RHEL/CentOS/SL发行版通过它们自己在包管理器中的签名进行校验。
