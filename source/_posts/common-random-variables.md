---
title: common-random-variables
date: 2018-07-23 19:35:03
tags:
---

动机
当我们模拟带随机成分的模型时,它通常是有利于分解成如下面这样的结构：
1. 含有需要我们来描述结构关系的参数θ,
2. 含有独立于参数的噪音 ε,
3. 含有能够生成可观察数据或矩阵的函数 f(θ,ε)

这样做可以让我们使用常见的随机变量（也就是常见的随机数），这是一种常见技巧能简单地固定ε，尝试不同的θ。这样做可使函数f成为可微分的，
使f能用基于导数的优化算法（例如，最大似然法或MAP）或基于MCMC方法的衍生方法。并且它还用于减少模拟矩的方差。

在Julia中实现这种技术时，我经常创建一个能保存参数ε的盒子结构，它会分配一个需原地更新的数组空间。由于 `DynamicHMC.jl` 的
再版设计在出现时会以更加规范的方式容纳模拟似然方法，所以我想探索其他选择，其中最重要的是`StaticArrays.jl`。


在这里，我会用一个简单的玩具模型对Julia v0.6.2的替代品进行基准测试。对比TL,DR来说：`StaticArrays.jl` 快150倍，
并且这里不依赖于所用的静态数组的可变性，甚至每次重新分配 时都会产生新的ε 。


设置问题：
简单设置一下：我们准备出$M$个观察对象，然后噪音是：


εi,j∼N(0,1)for i=1,…,M;j=1,…,7.
我们的参数是μ和σ，对于每个i我们来算

这是非线性变换后的样本平均值。然后这个7是偶然选取的，它来自简化我正在处理的实际问题。我们对Ai的样本平均值感兴趣。我刻意避免只是微优化每个版本，这样才能反映出怎么处理现实生活中的问题。
我们将这个通用接口编代码如下：
using BenchmarkTools
using StaticArrays
using Parameters

# common interface

"Dimension of noise ``ϵ`` for each observation."
const EDIM = 7

"""
Common random variables. The user needs to define

1. `observation_moments`, which should use `observation_moment`,
2. `newcrv = update!(crv)`, which returns new common random variables,
potentially (but not necessarily) overwriting `crv`.
"""
abstract type CRVContainer end

observation_moment(ϵ, μ, σ) = mean(@. exp(μ + σ * ϵ))

average_moment(crv::CRVContainer, μ, σ) = mean(observation_moments(crv, μ, σ))

"Calculate statistics, making `N` draws, updating every `L`th time."
function stats(crv, μ, σ, N, L)
    _stat() = (N % L == 0 && (crv = update!(crv)); average_moment(crv, μ, σ))
    [_stat() for _ in 1:N]
end

我写stats函数的方式代表了我如何使用HMC / NUTS：在相同轨迹上的模拟力矩就用相同的ε来计算，ε也会根据每一条轨迹来更新。当然，参数会沿轨迹变化，不过这里它们没有变化，但这并不影响基准。
update! 函数的语义能够直接修改功能和风格。

使用一个预分配矩阵
这是我写代码中用到的主要方法。1 ε在矩阵中的列里，将它们映射为片状更好，然后在用到 observation_moment时会被映射。
update! 函数重写了这些内容。
"""
Common random variables are stored in columns of a matrix.
"""
struct PreallocatedMatrix{T} <: CRVContainer
    ϵ::Matrix{T}
end

PreallocatedMatrix(M::Int) = PreallocatedMatrix(randn(EDIM, M))

update!(p::PreallocatedMatrix) = (randn!(p.ϵ); p)

observation_moments(p::PreallocatedMatrix, μ, σ) =
    vec(mapslices(ϵ -> observation_moment(ϵ, μ, σ), p.ϵ, 1))
利用静态向量
我们在各种静态向量实现间共享了以下内容：
"Common random variables as a vector of vectors, in the `ϵs`."
abstract type CRVVectors <: CRVContainer end

observation_moments(p::CRVVectors, μ, σ) =
    map(ϵ -> observation_moment(ϵ, μ, σ), p.ϵs)
我发现在这里使用映射比使用上面说的映射切片要更加直观。
静态向量，预分配容器
在使用静态向量的第一个版本中， 我们将 SVector 保留在 Vector中，并适时更新。.
struct PreallocatedStaticCRV{K, T} <: CRVVectors
    ϵs::Vector{SVector{K, T}}
end

PreallocatedStaticCRV(M::Int) =
    PreallocatedStaticCRV([@SVector(randn(EDIM)) for _ in 1:M])

function update!(p::PreallocatedStaticCRV)
    @unpack ϵs = p
    @inbounds for i in indices(ϵs, 1)
        ϵs[i] = @SVector(randn(EDIM))
    end
    p
end
可变静态向量与重写
我们修改这个来使用可变向量，这应该没有什么区别。
struct MutableStaticCRV{K, T} <: CRVVectors
    ϵs::Vector{MVector{K, T}}
end

MutableStaticCRV(M::Int) =
    MutableStaticCRV([@MVector(randn(EDIM)) for _ in 1:M])

function update!(p::MutableStaticCRV)
    @unpack ϵs = p
    @inbounds for i in indices(ϵs, 1)
        randn!(ϵs[i])
    end
    p
end
每次分配的静态向量
最后，这就是第三版,
struct GeneratedStaticCRV{K, T} <: CRVVectors
    ϵs::Vector{SVector{K, T}}
end

GeneratedStaticCRV(M::Int) =
    GeneratedStaticCRV([@SVector(randn(EDIM)) for _ in 1:M])

update!(p::GeneratedStaticCRV{K, T}) where {K, T} =
    GeneratedStaticCRV([@SVector(randn(T, K)) for _ in indices(p.ϵs, 1)])
结果
运行如下代码：
@btime mean(stats(PreallocatedMatrix(100), 1.0, 0.1, 100, 10))
@btime mean(stats(PreallocatedStaticCRV(100), 1.0, 0.1, 100, 10))
@btime mean(stats(MutableStaticCRV(100), 1.0, 0.1, 100, 10))
@btime mean(stats(GeneratedStaticCRV(100), 1.0, 0.1, 100, 10))
我们获得：

作为将来改进的预览，我在当前的master 上尝试了 PreallocatedMatrix  (master 将成为Julia v0.7)，这获得了3.5 ms (2.46 MiB)的结果, 这正是我们希望看到的。2
结论是， StaticArrays 简化了逻辑，同时加速了代码的速度.。我特别喜欢上一版本(GeneratedStaticCRV), 因为它不需要事先考虑类型。. 虽然这里的例子很简单，但实际上我会使用自动微分，这使得提前确定缓冲区类型更具挑战性。. 我希望将来我会转换到更“无缓冲”的风格，并相应地为DynamicHMC.jl设计界面。
