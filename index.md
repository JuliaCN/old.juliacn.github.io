---
layout: index
title: Julia中文社区
subtitle: Chinese Julia Community
---


Julia是一款为技术计算（technical computing）而设计的编程语言。它的语法和其它科学计算语言的语法也有很多相似之处，简单易学。Julia提供了一个复杂精巧的编译器，分布式的并行计算环境，精确的数值计算，以及一个可扩展的数学函数库。 Julia的基本库在线性代数，随机数产生器，信号处理和字符串处理方面引入了很多在单项表现极佳，成熟的开源C/Fortran库之外，大部分是使用Julia语言本身完成的。特别地，Julia的开发者社区正在快速地通过Julia内建的包管理器添加着各种外部扩展包。

Julia的程序代码主要通过围绕多重派发的编程范式，通过对不同的类型组合（类型是用户可以自由定义的）定义和重载函数来进行组织。对于在不同系统上使用Julia的好处的讨论可以在下面的部分或者是[在线指南]()的[介绍]()中找到。

<hr>

# Julia语言的特性
- 多重派发：提供为多种类型定义函数的能力
- 动态的类型系统
- 高性能，接近静态编译语言，如 C 语言
- 内置的包管理器
- 像Lisp一样真正的宏以及其它元编程特性
- 可以自由地通过<a href="https://github.com/stevengj/PyCall.jl">PyCall</a>调用Python程序
- 像 Shell 一样强大的管理其他进程的能力
- 为分布式和并行计算所设计
- 轻量级“绿色”线程（<a href="http://zh.wikipedia.org/zh-cn/%E5%8D%8F%E7%A8%8B">协程</a>）
<!-- 鉴于国内不易访问，这里是否应该换一个百科，或者做国内用户的重定向处理？ -->
- 用户定义的类型和内建类型一样快
- Automatic generation of efficient, specialized code for different argument types
- 美观可扩展的类型转换与提升
- 高效支持 <a href="http://zh.wikipedia.org/zh-cn/Unicode">Unicode</a>, 包括且不只 <a href="http://zh.wikipedia.org/zh-cn/UTF-8">UTF-8</a>
- 免费开源（<a href="https://github.com/JuliaLang/julia/blob/master/LICENSE.md">MIT 协议</a>）
<hr>

# 高性能的JIT编译器
通过使用类型推断和 即时(JIT)编译 ，以及 LLVM ， Julia 具有可选的类型声明，重载，高性能等特性。为了能让您对Julia的性能和其它语言在数值计算和科学计算中有一个更好的比较，我们为多种不同语言写了一些简单的标准测试程序：

<div class="figure">
<table class="responsive">
  <colgroup>
  <col class="name" />
  <col class="relative" span="11" />
  </colgroup>
  <thead>
  <tr><td></td><th class="system">Fortran</th><th class="system">Julia</th><th class="system">Python</th><th class="system">R</th><th class="system">Matlab</th><th class="system">Octave</th><th class="system">Mathe-matica</th><th class="system">JavaScript</th><th class="system">Go</th><th class="system">LuaJIT</th><th class="system">Java</th></tr>
  <tr><td></td><td class="version">gcc 5.1.1
  </td><td class="version">0.4.0
  </td><td class="version">3.4.3
  </td><td class="version">3.2.2
  </td><td class="version">R2015b
  </td><td class="version">4.0.0
  </td><td class="version">10.2.0
  </td><td class="version">V8 3.28.71.19
  </td><td class="version">go1.5
  </td><td class="version">gsl-shell 2.3.1
  </td><td class="version">1.8.0_45
  </td></tr>
  </thead>
  <tbody>
  <tr><th>fib</th><td class="data">0.70</td><td class="data">2.11</td><td class="data">77.76</td><td class="data">533.52</td><td class="data">26.89</td><td class="data">9324.35</td><td class="data">118.53</td><td class="data">3.36</td><td class="data">1.86</td><td class="data">1.71</td><td class="data">1.21</td></tr>
  <tr><th>parse_int</th><td class="data">5.05</td><td class="data">1.45</td><td class="data">17.02</td><td class="data">45.73</td><td class="data">802.52</td><td class="data">9581.44</td><td class="data">15.02</td><td class="data">6.06</td><td class="data">1.20</td><td class="data">5.77</td><td class="data">3.35</td></tr>
  <tr><th>quicksort</th><td class="data">1.31</td><td class="data">1.15</td><td class="data">32.89</td><td class="data">264.54</td><td class="data">4.92</td><td class="data">1866.01</td><td class="data">43.23</td><td class="data">2.70</td><td class="data">1.29</td><td class="data">2.03</td><td class="data">2.60</td></tr>
  <tr><th>mandel</th><td class="data">0.81</td><td class="data">0.79</td><td class="data">15.32</td><td class="data">53.16</td><td class="data">7.58</td><td class="data">451.81</td><td class="data">5.13</td><td class="data">0.66</td><td class="data">1.11</td><td class="data">0.67</td><td class="data">1.35</td></tr>
  <tr><th>pi_sum</th><td class="data">1.00</td><td class="data">1.00</td><td class="data">21.99</td><td class="data">9.56</td><td class="data">1.00</td><td class="data">299.31</td><td class="data">1.69</td><td class="data">1.01</td><td class="data">1.00</td><td class="data">1.00</td><td class="data">1.00</td></tr>
  <tr><th>rand_mat_stat</th><td class="data">1.45</td><td class="data">1.66</td><td class="data">17.93</td><td class="data">14.56</td><td class="data">14.52</td><td class="data">30.93</td><td class="data">5.95</td><td class="data">2.30</td><td class="data">2.96</td><td class="data">3.27</td><td class="data">3.92</td></tr>
  <tr><th>rand_mat_mul</th><td class="data">3.48</td><td class="data">1.02</td><td class="data">1.14</td><td class="data">1.57</td><td class="data">1.12</td><td class="data">1.12</td><td class="data">1.30</td><td class="data">15.07</td><td class="data">1.42</td><td class="data">1.16</td><td class="data">2.36</td></tr>
  </tbody>
</table>

<p class="caption"><b>Figure:</b>
基准测试时间是相对于C 语言的(时间越短越好, C 的用时为单位1).
</p>

<p class="note">
C 和 Fortran 语言使用了 gcc 5.11 编译， 使用最佳的优化 （从-O0到 -O3）。 C，Fortran，Go和Julia都使用了<a href="https://github.com/xianyi/OpenBLAS">OpenBLAS</a> v0.2.14.Python 3 通过 <a href="https://www.continuum.io/downloads">Anaconda distribution</a> 安装。rand_mat_stat 和 rand_mat_mul 算法在Python中通过numpy(v1.9.2)中的函数实现，其它部分均为纯Python语言实现。
</p>

{% highlight julia %}
function mandel(z)
    c = z
    maxiter = 80
    for n = 1:maxiter
        if abs(z) > 2
            return n-1
        end
        z = z^2 + c
    end
    return maxiter
end

function randmatstat(t)
    n = 5
    v = zeros(t)
    w = zeros(t)
    for i = 1:t
        a = randn(n,n)
        b = randn(n,n)
        c = randn(n,n)
        d = randn(n,n)
        P = [a b c d]
        Q = [a b; c d]
        v[i] = trace((P.'*P)^4)
        w[i] = trace((Q.'*Q)^4)
    end
    std(v)/mean(v), std(w)/mean(w)
end
{% endhighlight %}

</div>

上面的代码是很简洁，并且对于任何一个使用过其它编程语言的人来说都很熟悉。Julia对`randmatstat`的实现也是相较于同样的[C语言实现](https://github.com/JuliaLang/julia/blob/master/test/perf/micro/perf.c#L126)极其简单的, 并且没有很多性能上的牺牲。计划中的编译器优化将会在未来弥补这一点点在性能上的不足（相较于C语言）。通过语言本身的设计，Julia将使得你能够仅以牺牲少量的性能就可以编写底层的循环，到高级的编程风格应用，用简单的方式实现复杂的算法。
This continuous spectrum of programming levels is a hallmark of the Julia approach to programming and is very much an intentional feature of the language.

# 为分布式与云计算设计

Julia does not impose any particular style of parallelism on the user.
Instead, it provides a number of [key building blocks for distributed computation](/manual/parallel-computing), making it flexible enough to support a number of styles of parallelism, and allowing users to add more.
The following simple example demonstrates how to count the number of heads in a large number of coin tosses in parallel.

{% highlight julia %}
nheads = @parallel (+) for i=1:100000000
  int(randbool())
end
{% endhighlight %}

This computation is automatically distributed across all available compute nodes, and the result, reduced by summation (`+`), is returned at the calling node.

Here is a screenshot of a web-based interactive [IJulia Notebook](https://github.com/JuliaLang/IJulia.jl) session, using [Gadfly](https://github.com/dcjones/Gadfly.jl). [JuliaBox](http://www.juliabox.org) provides a way to run IJulia notebooks in your browser on Docker sandboxed containers provisioned on demand.

<a href="/images/ijulia.png" target="_blank"><img class="u-center" src="http://julialang.org/images/ijulia.png" width="90%" /></a>

This paves the way for fully cloud-based operation, including data management, code editing and sharing, execution, debugging, collaboration, analysis, data exploration, and visualization.
The eventual goal is to let people stop worrying about administering machines and managing data and get straight to the real problem.

[Gadfly](https://github.com/dcjones/Gadfly.jl) can produce various plots with various rendering backends in the browser (SVG, PDF, PNG and various other backends are also supported). Interactivity can be added to graphs and plots with the [Interact.jl](https://github.com/JuliaLang/Interact.jl) package. A small sampling of the capabilities of Gadfly is presented below.

<a href="/images/gadfly-demo.png" target="_blank"><img src="http://julialang.org/images/gadfly-demo.png" width="100%" /></a>

# Free, Open Source and Library-Friendly

The core of the Julia implementation is licensed under the [MIT license](http://en.wikipedia.org/wiki/MIT_License).
Various libraries used by the Julia environment include their own licenses such as the [GPL](http://en.wikipedia.org/wiki/GNU_General_Public_License), [LGPL](http://en.wikipedia.org/wiki/GNU_Lesser_General_Public_License), and [BSD](http://en.wikipedia.org/wiki/BSD_licenses)
(therefore the environment, which consists of the language, user interfaces, and libraries, is under the GPL).
The language can be built as a shared library, so users can combine Julia with their own C/Fortran code or proprietary third-party libraries.
Furthermore, Julia makes it [simple to call external functions](http://docs.julialang.org/en/stable/manual/calling-c-and-fortran-code/) in C and Fortran shared libraries, without writing any wrapper code or even recompiling existing code.
You can try calling external library functions directly from Julia's interactive prompt, getting immediate feedback.
See [LICENSE](https://github.com/JuliaLang/julia/blob/master/LICENSE.md) for the full terms of Julia's licensing.
