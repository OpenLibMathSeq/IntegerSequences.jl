# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module AltPartitions

export ModuleVisitPartitions
export VisitPartition, V080577, V026791

"""

Two alternative implementations of integer partitions.
The first one implements the 'visit-pattern' in Fortran style.
Compared to the implementation in JuliaMath/Combinatorics:

For n = 50 the benchmark shows:

*  0.141849 seconds (     9   allocations:  1.672 KiB)  [NEXPAR]
*  0.111040 seconds (408.45 k allocations: 40.882 MiB, 21.10% gc time) [JuliaMath]

For n = 100 the benchmark shows:

* 167.598273 seconds (    15   allocations:  4.813 KiB) [NEXPAR]
*  86.960344 seconds (381.14 M allocations: 48.735 GiB, 11.29% gc time) [JuliaMath]

Our function is slower but the Combinatorics function takes vastly more space.

In the second alternative implementation the representation of the partitions
for fixed n is a weakly increasing lists ordered lexicographicaly. It has a
nice algorithm implemented directly (i.e. without iteration).

* Partition, V080577, V026791
"""
const ModuleVisitPartitions = ""

"""

Generates the integer partitions of ``n`` in lexicographic order. Ported from Wilf/Nijenhuis "Combinatorial Algorithms". (cf. A080577).
"""
function NEXPAR(N::Int, Visit::Function)
    PAR = Array{Int}(undef, N)
    R = Dict{Int,Int}()
    M = Dict{Int,Int}()
    NLAST = 0
    D = 0
@label(L10)
    N == NLAST && @goto(L20)
    NLAST = N
@label(L30)
    S = N
    D = 0
@label(L50)
    D = D + 1
    R[D] = S
    M[D] = 1
@label(L40)
    MTC = M[D] ≠ N
    fill!(PAR, 0)
    K = 0
    for I in 1:D, J in 1:M[I]
        K = K + 1
        PAR[K] = R[I]
    end
    Visit(PAR)
    !MTC && return
@goto(L10)
@label(L20)
    !MTC && @goto(L30)
    SUM = 1
    R[D] > 1 && @goto(L60)
    SUM = M[D] + 1
    D = D - 1
@label(L60)
    F = R[D] - 1
    M[D] == 1 && @goto(L70)
    M[D] = M[D] - 1
    D = D + 1
@label(L70)
    R[D] = F
    M[D] = 1 + div(SUM, F)
    S = SUM % F
    S == 0 && @goto(L40)
@goto(L50)
end

"""

Return the integer partitions of ``n`` in graded reverse lexicographic order, the canonical ordering of partitions.
"""
VisitPartition(n, fun) = NEXPAR(n, fun)

"""

Return the integer partitions of ``n`` in graded reverse lexicographic order, the canonical ordering of partitions.
"""
V080577(n) = NEXPAR(n, println)


"""
Jerome Kelleher: "... developed for my PhD thesis ... We can generate integer
partitions much more effectively [.. and much easier ..] if we encode them as
ascending compositions rather than the conventional descending compositions."
http://jeromekelleher.net/category/combinatorics.html
"""
function partitions(n::Int)
    a = zeros(Int, n + 1)
    k = 1
    y = n - 1
    ans = Array{Int,1}[]
    while k != 0
        x = a[k] + 1
        k -= 1
        while 2x ≤ y
            a[k+1] = x
            y -= x
            k += 1
        end
        l = k + 1
        while x ≤ y
            a[k+1] = x
            a[l+1] = y
            push!(ans, a[1:k+2])
            x += 1
            y -= 1
        end
        a[k+1] = x + y
        y += x - 1
        push!(ans, a[1:k+1])
    end
    return ans
end

"""

Return the partitions of ``n`` as a weakly increasing lists of parts in lexicographic order.
"""
V026791(n) = partitions(n)

#START-TEST-########################################################

using Test, SeqUtils #, Combinatorics

function test()
    @testset "AltIntParts" begin
        @test length(V026791(6)) == 11
    end
    V080577(6)
end

function demo()
    # Prints the partitions given in the format used in function NEXPAR.
    PrintPartition(P) =  P |> println

    for n in 1:5
        VisitPartition(n, PrintPartition)
        println()
    end

    for p in partitions(6)
        Println(p)
    end
    println()

    partitions(6) |> println
    println()
end

"""
i=10:    0.000021 seconds (9 allocations:  1.344 KiB)
i=20:    0.000303 seconds (9 allocations:  1.422 KiB)
i=30:    0.002985 seconds (9 allocations:  1.516 KiB)
i=40:    0.024671 seconds (9 allocations:  1.578 KiB)
i=50:    0.141849 seconds (9 allocations:  1.672 KiB)
i=60:    0.700077 seconds (9 allocations:  1.750 KiB)
i=70:    3.109317 seconds (15 allocations: 4.594 KiB)
i=80:   12.719695 seconds (15 allocations: 4.656 KiB)
i=90:   47.378861 seconds (15 allocations: 4.734 KiB)
i=100: 167.598273 seconds (15 allocations: 4.813 KiB)
"""

function perf() end

function main()
    test()
    demo()
    perf()
end

main()

end # module

#=
using Combinatorics:

10 :   0.000011 seconds (    84   allocations:   5.688 KiB)
20 :   0.000133 seconds (  1.25 k allocations:  97.469 KiB)
30 :   0.001324 seconds ( 11.21 k allocations: 973.563 KiB)
40 :   0.036148 seconds ( 74.68 k allocations:   6.930 MiB, 63.24% gc time)
50 :   0.111040 seconds (408.45 k allocations:  40.882 MiB, 21.10% gc time)
60 :   0.372454 seconds (  1.93 M allocations: 206.614 MiB, 12.76% gc time)
70 :   1.631106 seconds (  8.18 M allocations: 926.427 MiB, 12.39% gc time)
80 :   6.668876 seconds ( 31.59 M allocations:   3.685 GiB, 12.25% gc time)
90 :  24.779135 seconds (113.27 M allocations:  13.858 GiB, 11.76% gc time)
100:  86.960344 seconds (381.14 M allocations:  48.735 GiB, 11.29% gc time)
=#
# https://www.math.upenn.edu/~wilf/website/CombinatorialAlgorithms.pdf
