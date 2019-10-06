# This file includes portions from JuliaMath/Combinatorics.jl in modified form.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module Setpartitions

export ModuleSetPartitions
export SetPartitions

"""

general Definition

* exported functions
"""
const ModuleSetPartitions = ""

struct SetIterator{T<:AbstractVector}
    s::T
end

Base.length(p::SetIterator) = BellNumber(length(p.s))
Base.eltype(p::SetIterator) = Vector{Vector{eltype(p.s)}}

function Base.iterate(p::SetIterator)
    n = length(p.s)
    iterate(p, (zeros(Int, n), ones(Int, n - 1), n, 1))
end

function Base.iterate(p::SetIterator, s)
    s[1][1] > 0 && return
    NextSetPartition(p.s, s...)
end

# Algorithm H from TAOCP 7.2.1.5
function NextSetPartition(s::AbstractVector, a, b, n, m)
    function makeparts(s, a, m)
        temp = [similar(s, 0) for k = 0:m]
        for i = 1:n
            push!(temp[a[i]+1], s[i])
        end
        filter!(!isempty, temp)
    end

    if isempty(s)
        return ([s], (eltype(a)[1], eltype(b)[], n, 1))
    end

    part = makeparts(s, a, m)

    if a[end] != m
        a[end] += 1
    else
        j = 0
        for jj = n - 1:-1:1
            j = jj
            a[jj] == b[jj] || break
        end
        a[j] += 1
        m = Int(b[j]) + (a[j] == b[j])
        for k = j+1:n-1
            a[k] = 0
            b[k] = m
        end
        a[end] = 0
    end

    return (part, (a, b, n, m))
end

"""

Return an iterator over all set partitions of the elements of an array ``s``,
represented as arrays of arrays.
"""
function SetPartitions(s::AbstractVector)
    # The only partition of the empty set is the set that contains the empty set.
    isempty(s) && return ([[]])
    SetIterator(s)
end

"""

Return an iterator over all set partitions of the elements of the array
``[1,2,...,n]``, represented as arrays of arrays.
"""
function SetPartitions(n::Int)
    n < 0 && throw(DomainError(n), "n must be nonnegative")
    n == 0 && return ([[]])
    SetIterator(1:n)
end

#######################################################################

struct KSetIterator{T<:AbstractVector}
    s::T
    m::Int
end

Base.length(p::KSetIterator) = StirlingSetNumber(length(p.s), p.m)
Base.eltype(p::KSetIterator) = Vector{Vector{eltype(p.s)}}

"""

Return all set partitions of the elements of an array ``s`` into exactly ``m``
subsets, represented as arrays of arrays.
"""
function SetPartitions(s::AbstractVector, m::Int)
    # The only partition of the empty set is the set that contains the empty set.
    if length(s) == 0 && m == 0 return [[]] end
    if m == 0 || length(s) < m  return [] end
    if (length(s) >= 1 && m >= 1) return KSetIterator(s, m) end
    throw(DomainError((length(s), m), "length(s) and m must be nonnegative"))
end

# State consists of:
# vector a of length n describing to which partition every element of s belongs
# vector b of length n describing the first index b[i] that belongs to partition i
# integer n
function Base.iterate(p::KSetIterator)
    n = length(p.s)
    m = p.m
    state = m <= n ?
            (vcat(ones(Int, n - m), 1:m), vcat(1:1, n-m+2:n), n) :
            (Int[], Int[], n)

    iterate(p, state)
end

function Base.iterate(p::KSetIterator, s)
    (isempty(s[1]) || s[1][1] > 1) && return
    NextKSetPartition(p.s, p.m, s...)
end

function NextKSetPartition(s::AbstractVector, m, a, b, n)
    function makeparts(s, a)
        local part = [similar(s, 0) for k = 1:m]
        for i = 1:n
            push!(part[a[i]], s[i])
        end
        return part
    end

    part = makeparts(s, a)

    if m == 1
        a[1] = 2
        return (part, (a, b, n))
    end

    if a[end] != m
        a[end] += 1
    else
        j = k = 0
        for jj = n - 1:-1:1
            j = jj
            if a[j] < m && b[a[j]+1] < j
                break
            end
        end
        if j > 1
            a[j] += 1
            for p = j+1:n
                if b[a[p]] != p
                    a[p] = 1
                end
            end
        else
            for kk = m:-1:2
                k = kk
                if b[k-1] < b[k] - 1
                    break
                end
            end
            b[k] -= 1
            b[k+1:m] = n - m + k + 1:n
            a[1:n] .= 1
            a[b] = 1:m
        end
    end

    return (part, (a, b, n))
end

"""

Return all set partitions of the elements of the array ``{1,2,3,...,n}`` into
exactly ``m`` subsets, represented as arrays of arrays.
"""
function SetPartitions(n::Int, m::Int)
    if (n < 0) || (m < 0)
        throw(DomainError(n, m), "n and m must be nonnegative")
    end
    SetPartitions(1:n, m)
end

function StirlingSetNumber(n::Int, m::Int)
    numpart = 0
    for k = 0:m
        numpart += (-1)^(m - k) * binomial(m, k) * (k^n)
    end
    numpart = div(numpart, factorial(m))
    return numpart
end

const CacheSetNum = Dict{Int, Int}()

function BellNumber(n::Int)
    if n < 0
        0
    elseif n < 2
        1
    elseif (wn = get(CacheSetNum, n, 0)) > 0
        wn
    else
        wn = 0
        for k = 0:n-1
            wn += binomial(n - 1, k) * BellNumber(n - 1 - k)
        end
        CacheSetNum[n] = wn
    end
end

#START-TEST-########################################################

using Test, SeqUtils

function test()
    @testset "SetPartitions" begin
        @test collect(SetPartitions([])) == [[]]

        @test collect(SetPartitions([], 0)) == [[]]
        @test collect(SetPartitions([], 1)) == []

        @test collect(SetPartitions([1])) == [[[1]]]
        @test collect(SetPartitions([1], 0)) == []
        @test collect(SetPartitions([1], 1)) == [[[1]]]
        @test collect(SetPartitions([1], 2)) == []

        @test collect(SetPartitions([1,2])) == [[[1,2]],[[1],[2]]]
        @test collect(SetPartitions([1,2], 0)) == []
        @test collect(SetPartitions([1,2], 1)) == [[[1, 2]]]
        @test collect(SetPartitions([1,2], 2)) == [[[1], [2]]]
        @test collect(SetPartitions([1,2], 3)) == []

        @test collect(SetPartitions(0)) == [[]]

        @test collect(SetPartitions(0, 0)) == [[]]
        @test collect(SetPartitions(0, 1)) == []

        @test collect(SetPartitions(1)) == [[[1]]]
        @test collect(SetPartitions(1, 0)) == []
        @test collect(SetPartitions(1, 1)) == [[[1]]]
        @test collect(SetPartitions(1, 2)) == []

        @test collect(SetPartitions(2)) == [[[1,2]],[[1],[2]]]
        @test collect(SetPartitions(2, 0)) == []
        @test collect(SetPartitions(2, 1)) == [[[1, 2]]]
        @test collect(SetPartitions(2, 2)) == [[[1], [2]]]
        @test collect(SetPartitions(2, 3)) == []

        SP = [ [[1,2,3]], [[1,2], [3]], [[1,3], [2]], [[1], [2,3]], [[1], [2], [3]] ]

        CP = collect(SetPartitions([1, 2, 3]))
        @test SP == CP

        RP = reduce(vcat, [collect(SetPartitions([1, 2, 3], k)) for k in 1:3])
        @test SP == RP

        for n in 1:7
            s = collect(0:n-1)
            @test length(collect(SetPartitions(s))) == BellNumber(length(s))
        end

        for n in 1:7, k in 1:n
            sn = StirlingSetNumber(n, k)
            @test length(collect(SetPartitions(1:n, k))) == sn
        end

        @test_throws DomainError SetPartitions([ ], -1)
        @test_throws DomainError SetPartitions([1], -1)
    end
end

function demo()
    println()
    s = SetPartitions([])
    println("The empty set has a partition, namely: ", reduce(vcat, s))
    println()

    for n in 1:4
        println("-- ", n)
        for k in 1:n
            for p in SetPartitions(n, k)
            # same as: for p in SetPartitions(1:n, k)
                Println(p)
            end
        end
        println()
    end

    for n in 1:4
        println("-- ", n)
        for k in 1:n
            for p in SetPartitions(n, k)
                Println(p)
            end
        end
        println()
    end

    println("The Stirling set numbers:")
    for n in 0:6
        println([StirlingSetNumber(n, k) for k in 0:n])
    end
    println()
    println("The Bell numbers:")
    println([BellNumber(n) for n in 0:9])
end

function perf() end

function main()
    test()
    demo()
    perf()
end

main()

end # module
