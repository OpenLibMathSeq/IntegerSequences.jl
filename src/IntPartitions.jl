# This file includes portions from JuliaMath/Combinatorics.jl in modified form.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module IntPartitions

using GeneralizedBinomial

export ModuleIntPartitions
export IntegerPartitions, PartitionNumber
export PartOrder, byNumPart, byMaxPart
export PartitionCoefficientsByLength, PartitionCoefficientsByBiggestPart
export V000041, I072233, L072233, L036038, L078760, L005651, L262071, L292222

"""

All integer partitions are listed by two orderings:
   IntegerPartitions(n, byNumPart)
   IntegerPartitions(n, byMaxPart)

Or restricted to partitions of length m:
   IntegerPartitions(n, m)

The partition coefficients, which are the multinomial coefficients applied to partitions, are given in both orderings (L036038, L078760).

The partition numbers and the number of partitions of n into k parts are given as PartitionNumber(n) and PartitionNumber(n, k), (V000041, L072233).

The sum of all partition coefficients of n is efficiently computed with L005651.
"""
const ModuleIntPartitions = ""

"""

Conventional names for orderings of integer partitions of ``n``. ``byMaxPart`` means first order by the biggest part. ``byNumPart`` means first order by the number of parts. The secondary order is in both cases colexicographic.
"""
@enum PartOrder begin
    byNumPart
    byMaxPart
end
"Order the partitions by number of parts."
byNumPart
"Order the partitions by greatest part."
byMaxPart

"""

Return an iterator over all partitions of ``n``. List the parts of the partitions according to the ``PartitionOrder`` given as second parameter. By default the partition order is 'byNumPart'.
"""
function IntegerPartitions(n::Int, o::PartOrder = byNumPart)
    n < 0 && throw(DomainError(n, "n >= 0 required"))

    o == byNumPart && return PartitionsByLength(n)
    PartitionsByBiggestPart(n)
end

struct IntPartIterator
    n::Int
end

Base.length(p::IntPartIterator) = PartitionNumber(p.n)
Base.eltype(p::IntPartIterator) = Vector{Int}

function Base.iterate(p::IntPartIterator, xs = Int[])
    length(xs) == p.n && return
    xs = NextIntPartition(p.n, xs)
    (xs, xs)
end

function NextIntPartition(n, as)
    isempty(as) && return Int[n]
    xs = similar(as, 0)
    sizehint!(xs, length(as) + 1)

    for i = 1:length(as)-1
        if as[i+1] == 1
            x = as[i] - 1
            push!(xs, x)
            n -= x
            while n > x
                push!(xs, x)
                n -= x
            end
            push!(xs, n)
            return xs
        end
        push!(xs, as[i])
        n -= as[i]
    end
    push!(xs, as[end] - 1)
    push!(xs, 1)
    xs
end

"""

Return an iterator over all partitions of ``n``. List the parts of the partitions of ``n`` in graded colexicographic order.
"""
function PartitionsByBiggestPart(n::Int)
    n == 0 && return [Int[]]
    IntPartIterator(n)
end

#######################################################################

struct IntPartIteratorByLength
    n::Int
    m::Int
end

Base.length(f::IntPartIteratorByLength) = PartitionNumber(f.n, f.m)
Base.eltype(f::IntPartIteratorByLength) = Vector{Int}

function Base.iterate(f::IntPartIteratorByLength, s::Vector{Int} = Int[])
    f.m <= f.n || return
    if !isempty(s)
        (f.m == 1 || s[1] - 1 <= s[end]) && return
    end

    xs = NextIntPartition(f.n, f.m, s)
    (xs, xs)
end

function NextIntPartition(n, m, bs)
    as = copy(bs)
    if isempty(as)
        # First iteration
        as = ones(Int, m)
        as[1] = n - m + 1
    elseif as[2] < as[1] - 1
        # Most common iteration
        as[1] -= 1
        as[2] += 1
    else
        # Iterate
        j = 0
        s = as[1] + as[2] - 1
        for jj in 3:m
            j = jj
            as[jj] < as[1] - 1 && break
            s += as[jj]
        end
        x = as[j] += 1
        for k = j - 1:-1:2
            as[k] = x
            s -= x
        end
        as[1] = s
    end
    return as
end

"""

Return an iterator over all weakly descending lists with ``m`` integers that sum to ``n``. List the parts of the partitions of ``n`` in graded colexicographic order.
"""
function IntegerPartitions(n::Int, m::Int)
# Algorithm H from TAOCP 7.2.1.4.
    if m == 0
        n == 0 && return [Int[]]
        return Int[]
    end
    if (n >= 0 && m > n)
        return Int[]
    end

    if (n > 0 && m >= 0 && m <= n)
        return IntPartIteratorByLength(n, m)
    end

    throw(DomainError((n, m), "n >= 0 and 0 <= m <= n required"))
end

"""

Return an iterator over the IntegerPartitions of ``n`` ordered first by length then colexicographicaly. Chains the iterators IntegerPartitions(n, k).
"""
function PartitionsByLength(n::Int)
    n == 0 && return [Int[]]
    Iterators.flatten([IntegerPartitions(n, k) for k = 1:n])
end

const CachePartNum = Dict{Tuple{Int, Int}, Int}()

"""

Return the number of partitions of ``n`` into ``k`` parts. Cf. A072233.
"""
function PartitionNumber(n::Int, k::Int)
    (n == k || k == 1) && return 1
    (n <  k || k == 0) && return 0
    haskey(CachePartNum, (n, k)) && return CachePartNum[(n, k)]
    CachePartNum[(n, k)] =
        PartitionNumber(n - 1, k - 1) + PartitionNumber(n - k, k)
end

"""

Return the number of partitions of ``n``. Cf. A000041.
"""
function PartitionNumber(n::Int)
    haskey(CachePartNum, (n, -1)) && return CachePartNum[(n, -1)]
    CachePartNum[(n, -1)] = sum(PartitionNumber(n, k) for k in 0:n)
end

"""

Return the number of partitions of ``n``.
"""
V000041(n) = PartitionNumber(n)

"""

Return an iterator over the list of partitions of ``n`` into ``k`` parts.
"""
I072233(n) = (PartitionNumber(n, k) for k in 0:n)

"""

Return a list of the number of partitions of ``n`` into ``k`` parts.
"""
L072233(n) = collect(I072233(n))


"""

Return the partition coefficients of ``n``, first ordered by length.
"""
PartitionCoefficientsByLength(n) = [
    Multinomial(p) for p in IntegerPartitions(n, byNumPart)]

"""

Return the partition coefficients of ``n``, first ordered by length.
"""
L036038(n) = PartitionCoefficientsByLength(n)

"""

Return the partition coefficients of ``n``, first ordered by biggest part.
"""
PartitionCoefficientsByBiggestPart(n) = [
    Multinomial(p) for p in IntegerPartitions(n, byMaxPart)]

"""

Return the partition coefficients of ``n``, first ordered by biggest part.
"""
L078760(n) = PartitionCoefficientsByBiggestPart(n)

const CacheSumPartCoeff = Dict{Tuple{Int, Int}, Int}()

function H(n::Int, i::Int)
    (n == 0 || i == 1) && return factorial(n)
    if (ret = get(CacheSumPartCoeff, n, 0)) > 0
        return ret
    end

    ret = H(n, i-1) + binomial(n, i)*H(n-i, min(n-i, i))
    CacheSumPartCoeff[n, i] = ret
end

"""

Sum of all partition coefficients of n.
"""
L005651(len::Int) = [H(n, n) for n in 0:len-1]

"""

Return the number of ordered partitions of an n-set with nondecreasing block sizes and maximal block size equal to k.
"""
function L262071(n::Int)
    n == 0 && return [1]
    A = zeros(Int, n + 1)
    for p in IntegerPartitions(n, byMaxPart)
        A[1+p[1]] += Multinomial(p)
    end
    return A
end

"""

Return the triangle of multinomial coefficients of ``n``. [Defined as in the 'Handbook of Mathematical Functions', p. 831, as ``M1``.]
"""
function L292222(n)
    [sum(Multinomial(p) for p in IntegerPartitions(n, k)) for k in 1:n]
end

#START-TEST-########################################################

using Test, SeqUtils

function test()
    @testset "IntegerPartitions" begin

        @test IntegerPartitions(0) == [[]]

        @test collect(IntegerPartitions(0, 0)) == [[]]
        @test collect(IntegerPartitions(0, 1)) == []

        @test collect(IntegerPartitions(1, 0)) == []
        @test collect(IntegerPartitions(1, 1)) == [[1]]
        @test collect(IntegerPartitions(1, 2)) == []

        @test collect(IntegerPartitions(2, 0)) == []
        @test collect(IntegerPartitions(2, 1)) == [[2]]
        @test collect(IntegerPartitions(2, 2)) == [[1, 1]]
        @test collect(IntegerPartitions(2, 3)) == []

        @test [length(b) for b in IntegerPartitions(0)] == [0]
        @test [length(b) for b in IntegerPartitions(1)] == [1]
        @test length(IntegerPartitions(0)) == 1
        @test length(collect(IntegerPartitions(1))) == 1
        @test_throws DomainError IntegerPartitions(-1)

        @test collect(IntegerPartitions(5)) == reverse(Any[[1, 1, 1, 1, 1],
            [2, 1, 1, 1], [2, 2, 1], [3, 1, 1], [3, 2], [4, 1], [5]])

        for n in 0:7
            pn = PartitionNumber(n)
            @test length(collect(IntegerPartitions(n, byMaxPart))) == pn
            @test length(collect(IntegerPartitions(n, byNumPart))) == pn
        end

        for n in 0:7, k in 0:n
            pn = PartitionNumber(n, k)
            @test length(collect(IntegerPartitions(n, k))) == pn
        end

        @test L005651(10) == [1, 1, 3, 10, 47, 246, 1602, 11481, 95503, 871030]
        @test [V000041(n) for n in 0:8] == [1, 1, 2, 3, 5, 7, 11, 15, 22]
        @test L072233(7) == [0, 1, 3, 4, 3, 2, 1, 1]
        @test L036038(6) == [1, 6, 15, 20, 30, 60, 90, 120, 180, 360, 720]
        @test L078760(6) == [1, 6, 15, 30, 20, 60, 120, 90, 180, 360, 720]
        @test L005651(10) == [1, 1, 3, 10, 47, 246, 1602, 11481, 95503, 871030]
        @test L262071(6) == [0, 720, 630, 200, 45, 6, 1]
        @test L292222(6) == [1, 41, 180, 300, 360, 720]
    end
end

function demo()
    println("\n-- all partitions of 10")
    for p in IntegerPartitions(10)
        Println(p)
    end

    for n in 0:7
        println("\n\n-- $n  --")

        println("\n-- by biggest part")
        for p in IntegerPartitions(n, byMaxPart)
            Println(p)
        end

        println("\n-- by length (all)")
        for p in IntegerPartitions(n, byNumPart)
            Println(p)
        end

        println("\n-- selected lengths")
        for k in 0:2:n
            P = IntegerPartitions(n, k)
            for p in P Println(p) end
        end
    end

    println("\n-- edge cases:")
    println("-- n=0, k=0 -> P(n, k) = [[]]")
    println("-- n>0, k=0 -> P(n, k) = []")
    println("-- n>0, k>n -> P(n, k) = []")

    for n in [0,1,2,6]
        println("\n-- ", n)
        for k in 0:n
            P = collect(IntegerPartitions(n, k))
            print("collect ", (n, k), " -> "); Println(P)
            if isempty(IntegerPartitions(n, k))
                println((n, k), " -> no partition")
            else
                for p in IntegerPartitions(n, k)
                    println((n, k), " -> ", p)
                end
            end
        end

        k = n + 1
        P = collect(IntegerPartitions(n, k))
        print("collect ", (n, k), " -> "); Println(P)

        if isempty(IntegerPartitions(n, k))
            println((n, k), " -> no partition")
        else
            for p in IntegerPartitions(n, k)
                println((n, k), " -> ", p)
            end
        end
    end

    println("\n-- triangle of partition numbers")
    for n in 0:7
        println([PartitionNumber(n, k) for k in 0:n])
    end

    println("\n-- number of partitions")
    println([PartitionNumber(n) for n in 0:12])
    println()

    println("\n-- partition coefficients by biggest part")
    for n in 0:6
        PartitionCoefficientsByBiggestPart(n) |> println
    end
    println()

    println("\n-- partition coefficients by length")
    for n in 0:6
        PartitionCoefficientsByLength(n) |> println
    end
    println()

    println("\n-- Sum of all partition coefficients of n")
    L005651(10) |> println
    println()
end

"""
for n in 1:50, p in IntegerPartitions(n, byNumPart) p end
    0.437520 seconds (3.89 M allocations: 329.296 MiB, 26.45% gc time)
for n in 1:50, p in IntegerPartitions(n, byMaxPart) p end
    0.509802 seconds (2.59 M allocations: 249.845 MiB, 20.57% gc time)
"""
function perf()
    println("\n-- performance test")
    @time for n in 1:50, p in IntegerPartitions(n, byNumPart) p end
    @time for n in 1:50, p in IntegerPartitions(n, byMaxPart) p end
end

function main()
    demo()
    test()
    perf()
end

main()

end # module
