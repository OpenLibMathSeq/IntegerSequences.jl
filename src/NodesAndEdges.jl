# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module NodesAndEdges

using Nemo, NumberTheory, IntPartitions
export V000055, V000081, V000106, V209397, V217420, V095350, V002494
export V055542, V055543, V055544, V000088, L087803, L036039


"""
Rooted trees and similar topics.

* V000055, V000081, V000106, V209397, V217420, V095350, V002494, V055542, V055543, V055544, V000088, L087803, L036039
"""
const ModuleNodesAndEdges = ""

"""

Return the number of unlabeled rooted trees with ``n`` nodes.
"""
function V000081(n::Int)
    n <= 1 && return BigInt(n)
    haskey(CacheV000081, n) && return CacheV000081[n]
    S = sum(V209397(j)*V000081(n-j) for j in 1:n-1)
    return CacheV000081[n] = div(S, n-1)
end

const CacheV000081 = Dict{Int, BigInt}()

"""

Return ``∑_{d|n}`` d V000081(d).
"""
function V209397(n::Int)
    haskey(CacheV209397, n) && return CacheV209397[n]
    S = sum(d*V000081(d) for d in divisors(n))
    return CacheV209397[n] = BigInt(S)
end

const CacheV209397 = Dict{Int, BigInt}()


"""

Return the number of linear forests of 2-rooted trees.
"""
V000106(n) = sum(V000081(k) * V000081(n-k) for k in 0:n)

"""

Return the number of rooted unlabeled trees where the root node has degree 2 and both branches are distinct.
"""
function V217420(n)
    n <= 0 && return BigInt(0)
    c = isodd(n) ? V000081(div(n-1, 2)) : 0
    div(V000106(n-1) - c, 2)
end

"""

Return the number of trees with ``n`` unlabeled nodes.
"""
function V000055(n)
    n == 0 && return BigInt(1)
    V000081(n) - V217420(n+1)
end

"""

Return total number of edges in all rooted trees with ``n`` nodes.
"""
V095350(n) = (n-1)*V000081(n)

"""

Total number of nodes in all rooted trees with ``n`` nodes.
"""
V055544(n) = n*V000081(n)

"""

Total number of nodes in all trees with n nodes.
"""
V055543(n) = n*V000055(n)

"""

Return the number of permutations whose cycle structure is the given list.
"""
function PermutationCount(v)
    m, k = 1, 0
    s = BigInt.(0)
    for i ∈ 1:length(v)
        t = v[i]
        k = i > 1 && t == v[i-1] ? k + 1 : 1
        m *= t*k
        s += t
    end
    div(factorial(s), m)
end

"""

Return the multinomial coefficients of the integer partitions of ``n``. Gives the number of permutations whose cycle structure is the given partition.
# Examples
```julia-repl
julia> L036039(5)
[24, 30, 20, 20, 15, 10, 1]
```
"""
L036039(n) = [PermutationCount(p) for p in IntegerPartitions(n)]

#=
[1]
[1, 1]
[2, 3, 1]
[6, 8, 3, 6, 1]
[24, 30, 20, 20, 15, 10, 1]
=#

# Missing in the OEIS
function Edges(v)
    (len = length(v)) == 1 && return div(v[1], 2)
    (sum(gcd(v[i], v[j]) for i in 2:len for j in 1:i-1 ) +
        sum(div(v[i], 2) for i in 1:len))
end

#for n in 1:6
#    [Edges(p) for p in IntegerPartitions(n)] |> println
#end

"""

Return the number of graphs on ``n`` unlabeled nodes.
"""
function V000088(n)
    n == 0 && return BigInt(1)
    s = sum(PermutationCount(p)*2^Edges(p) for p in IntegerPartitions(n))
    div(s, factorial(n))
end

"""

Return the total number of nodes in all simple graphs of ``n`` nodes.
"""
V055542(n) = n*V000088(n)

"""

Return the number of ``n``-node graphs without isolated nodes.
"""
V002494(n) = n == 0 ? BigInt(1) : V000088(n) - V000088(n-1)

"""

Number of unlabeled rooted trees with at most n nodes.
"""
L087803(len) = cumsum([V000081(k) for k in 0:len])

# See also:: V000595, V001349, V275331,
# V275330, V008406, V000273, V003024, V057500, V240955


#START-TEST-########################################################

using Test

function test()
    @testset "Nodes" begin
        @test V000055(10) == 106
        @test V000081(10) == 719
        @test V000106(10) == 1235
        @test V095350(10) == 6471
        @test V209397(10) == 7238
        @test V217420(10) == 239
        @test V055544(10) == 7190
        @test V055543(10) == 1060
        @test V055542(10) == 120051680
        @test V000088(10) == 12005168
        @test V002494(10) == 11730500
        @test L087803(5)  == BigInt[0, 1, 2, 4, 8, 17]
        @test L036039(5)  == BigInt[24, 30, 20, 20, 15, 10, 1]
    end
end

function demo()
    println("V000106")
    [V000106(n) for n ∈ 0:12] |> println

    println("V209397")
    [V209397(n) for n ∈ 1:12] |> println

    println("V000081")
    [V000081(n) for n ∈ 0:12] |> println

    println("V000055")
    [V000055(n) for n ∈ 0:12] |> println

    println("V000088")
    [V000088(n) for n ∈ 0:12] |> println

    println("V095350")
    [V095350(n) for n ∈ 0:12] |> println

    println("V217420")
    [V217420(n) for n ∈ 0:12] |> println

    println("V055542")
    [V055542(n) for n ∈ 0:12] |> println

    println("V055543")
    [V055543(n) for n ∈ 0:12] |> println

    println("V055544")
    [V055544(n) for n ∈ 0:12] |> println

    println("V002494")
    [V002494(n) for n ∈ 0:12] |> println

    println("L087803")
    L087803(5) |> println

    println("L036039")
    L036039(5) |> println

end

#  0.101582 seconds (285.83 k allocations: 13.003 MiB)
function perf()
    @time [V000055(n) for n in 0:99]
end

function main()
    test()
    demo()
    perf()
end

main()

end # module
