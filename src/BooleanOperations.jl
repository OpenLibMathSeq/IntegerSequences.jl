# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module BooleanOperations
using NumberTheory

export Not, And, Dif, Cnimp, Xor, Or, Nor, Eqv, Cimp, Imp, Nand
export Bits, BoolOps, BinDigits
export V035327, V003817, V129760, V142151, V080079, V086799, V163617
export V038712, V006257, V048724, V003188, V038554, V048735, V213370
export V080940, V135521, V051933, V135481, V327987
export is327988, L327988, L280172

"""

The 16 boolean operations

* FALSE, AND, DIF, PRJ1, CNIMP, PRJ2, XOR, OR, NOR, EQV, NEG2, CIMP, NEG1, IMP, NAND, TRUE

evaluated bitwise on the binary expansions of integers.

The main function is

* Bits(op::String, n::Int, k::Int, algo=max)

where op are the above acronyms. If the lengths of the binary expansions of ``n`` and ``k`` are different, the parameter 'algo=min' offers the choice to reduce the range of comparison to the smaller range or to the larger range, 'algo=max', which will first pad the representation of the smaller operand with 0's up to the length of the larger operand.

* Not, And, Dif, Cnimp, Xor, Or, Nor, Eqv, Cimp, Imp, Nand, BinDigits, BoolOps, Bits, V035327, V003817, V129760, V142151, V080079, V086799, V038712, V163617, V006257, V048724, V003188, V038554, V048735, V213370, V080940, V135521,  , V280172.
"""
const ModuleBooleanOperations = ""

"""
Return the binary expansions of nonnegative ``n`` and ``k``. If algo=max then pad the resulting int arrays with 0 to make them equally long. For example
    BinDigits``(12, 17, max) = ([0, 0, 1, 1, 0], [1, 0, 0, 0, 1])``.
If algo=min then the arrays are truncated to the length of the smaller operand.
    BinDigits``(12, 17, min) = ([0, 0, 1, 1], [1, 0, 0, 0])``.
These are the lists which are itemwise compared by the logical operators.
"""
function BinDigits(n::Int, k::Int, algo=max)
    N = n == 0 ? [0] : digits(n, base = 2)
    K = k == 0 ? [0] : digits(k, base = 2)
    lenN = length(N)
    lenK = length(K)

    if algo == max
        maxlen = max(lenN, lenK)
        if maxlen > lenN
            N = vcat(N, [0 for i ∈ 1:maxlen-lenN])
        else
            K = vcat(K, [0 for i ∈ 1:maxlen-lenK])
        end
    else
        minlen = min(lenN, lenK)
        if lenN > minlen
            N = N[1:minlen]
        else
            K = K[1:minlen]
        end
    end
    return (N, K)
end

"""

Return the bitwise negation of ``N``.
"""
Not(N) = [1 - n for n ∈ N]

"""

Return the bitwise conjunction of ``N`` and ``K``.
"""
And(N, K) = [N[i] & k for (i, k) ∈ enumerate(K)]

"""

Return the bitwise difference of ``N`` and ``K``.
"""
Dif(N, K) = [N[i] & (1 - k) for (i, k) ∈ enumerate(K)]

"""

Return the bitwise converse nonimplication of ``N`` and ``K``.
"""
Cnimp(N, K) = [(1 - N[i]) & k for (i, k) ∈ enumerate(K)]

"""

Return the bitwise exclusive disjunction of ``N`` and ``K``.
"""
Xor(N, K) = [xor(N[i], k) for (i, k) ∈ enumerate(K)]

"""

Return the bitwise disjunction of ``N`` and ``K``.
"""
Or(N, K) = [N[i] | k for (i, k) ∈ enumerate(K)]

"""

Return the bitwise joint denial of ``N`` and ``K``.
"""
Nor(N, K) = [1 - (N[i] | k) for (i, k) ∈ enumerate(K)]

"""

Return the bitwise equivalence of ``N`` and ``K``.
"""
Eqv(N, K) = [xor(1 - N[i], k) for (i, k) ∈ enumerate(K)]

"""

Return the bitwise converse implication of ``N`` and ``K``.
"""
Cimp(N, K) = [N[i] | (1 - k) for (i, k) ∈ enumerate(K)]

"""

Return the bitwise implication of ``N`` and ``K``.
"""
Imp(N, K) = [(1 - N[i]) | k for (i, k) ∈ enumerate(K)]

"""

Return the bitwise nonconjunction of ``N`` and ``K``.
"""
Nand(N, K) = [1 - (N[i] & k) for (i, k) ∈ enumerate(K)]

"""

Return the bitwise boolean operation represented by ``op`` applied to the binary expansions of the integers ``n`` and ``k``. ``op`` is an integer ``0 <= op < 16`` encoding the result of the operation in terms of the truth table.
"""
function Bits(op::Int, n::Int, k::Int, algo=max)
    if op < 0 || op > 15 || n < 0 || k < 0
        @error("op must be 0 <= op <= 15 and n,k >= 0. op=$op, n=$n, k=$k.")
        throw(DomainError(-1))
    end

    op == 0  && return 0
    op == 15 && return 1

    N, K = BinDigits(n, k, algo)

    if     op == 1   R = And(N, K)
    elseif op == 2   R = Dif(N, K)
    elseif op == 3   R = N
    elseif op == 4   R = Cnimp(N, K)
    elseif op == 5   R = K
    elseif op == 6   R = Xor(N, K)
    elseif op == 7   R = Or(N, K)
    elseif op == 8   R = Nor(N, K)
    elseif op == 9   R = Eqv(N, K)
    elseif op == 10  R = Not(K)
    elseif op == 11  R = Cimp(N, K)
    elseif op == 12  R = Not(N)
    elseif op == 13  R = Imp(N, K)
    elseif op == 14  R = Nand(N, K)
    end

    sum(r << (i-1)  for (i, r) ∈ enumerate(R))
end

"""

The list of acronyms for the 16 binary boolean operations.
"""
const BoolOps = ["FALSE", "AND", "DIF", "PRJ1", "CNIMP", "PRJ2", "XOR", "OR", "NOR", "EQV", "NEG2", "CIMP", "NEG1", "IMP", "NAND", "TRUE"]

"""

Return the bitwise boolean operation represented by ``op`` applied to the binary expansions of the integers ``n`` and ``k``. ``op`` is an acronym as given in the list 'BoolOps'.
"""
function Bits(op::String, n::Int, k::Int, algo=max)
    opnum = findfirst(isequal(op), BoolOps)
    Bits(opnum - 1, n, k, algo)
end

"""

Return n NAND n.
"""
V035327(n) = Bits("NAND", n, n)
# also : V035327(n) = Bits("NEG1", n, n+1, min)

"""

Return n EQV n.
"""
V003817(n) = Bits("EQV", n, n)
# sets a(0) = 1

"""

Return n AND n+1, using max length.
"""
V129760(n) = Bits("AND", n, n+1)
# with offset 0

"""

Return n CIMP n+1, using max length.
"""
V142151(n) = Bits("CIMP", n, n+1)

#"""
# Return n CNIMP n+1, using max length.
# Offset is 0, shift n left if you want the OEIS offset 1.
# Is exported from Module LandauConstants
#"""
#V006519(n) = Bits("CNIMP", n, n+1)

"""

Return n NEG1 n+1, using max length.
"""
V080079(n) = Bits("NEG1", n, n+1)
# with offset 0

"""

Return n OR n+1, using max length.
"""
V086799(n) = Bits("OR", n, n+1)
# with offset 0

"""

Return n OR 2n, using max length.
"""
V163617(n) = Bits("OR", n, n<<1)

"""

Return n XOR n+1, using max length.
"""
V038712(n) = Bits("XOR", n, n+1)
# with offset 0

"""

Return max(1, 2n) - (n EQV n), using max length.
"""
V006257(n) = max(1, 2n) - Bits("EQV", n, n)

"""

Return n XOR 2n, using max length.
"""
V048724(n) = Bits("XOR", n, n<<1)

"""

Return n XOR n>>1, using max length.
"""
V003188(n) = Bits("XOR", n, n>>1)

"""

Return n XOR n>>1, using min length.
"""
V038554(n) = Bits("XOR", n, n>>1, min)
# with a(1) = 1

"""

Return n AND n>>1, using min length.
"""
V048735(n) = Bits("AND", n, n>>1, min)

"""

Return n AND n<<1, using min length.
"""
V213370(n) = Bits("AND", n, n<<1, min)

"""

Return n CNIMP n+1, using min length.
"""
V080940(n) = Bits("CNIMP", n, n+1, min)
# with a(0) = 1

"""

Return n XOR n+1, using min length.
"""
V135521(n) = Bits("XOR", n, n+1, min)
# prepend a(0) = 1

"""

Return n XOR k, using max length.
"""
V051933(n, k) = Bits("XOR", n, k)

"""

Return (k-1 XOR n-k) + 1, using max length.
"""
L280172(n) = [Bits("XOR", k-1, n-k) + 1 for k in 1:n]

"""

Return n+1 CNIMP n, using max length.
"""
V135481(n) = Bits("CNIMP", n+1, n)

"""

Return Sum``_{d|n} d & (n/d)``, where & is the bitwise AND operator.
"""
V327987(n) = sum([Bits("AND", d, div(n, d)) for d ∈ divisors(n)])

"""

Is V327987(n) = ``∑_{d|n} d & (n/d)`` = 0 ?
"""
is327988(n) = V327987(n) == 0

"""

Return a list of the zeros of V327987 below (inc.)  ``max``.
"""
L327988(max) = [n for n ∈ 0:max if is327988(n)]

#START-TEST-########################################################

using Test

function test()
    @testset "BoolOps" begin
        A = [1, 1, 0, 0]
        B = [1, 0, 1, 0]
        S(R) = sum(r << (i-1)  for (i, r) ∈ enumerate(R))

        for n ∈ 0:15
            @test n == S([Bits(n, A[k], B[k]) for k ∈ 1:4])
        end
        for n ∈ 0:15
            @test n == S([Bits(BoolOps[n+1], A[k], B[k]) for k ∈ 1:4])
        end

        @test BinDigits(12, 17) == ([0, 0, 1, 1, 0], [1, 0, 0, 0, 1])
        @test [V163617(n) for n ∈ 0:8] == [0, 3, 6, 7, 12, 15, 14, 15, 24]
        @test [V035327(n) for n ∈ 0:8] == [1, 0, 1, 0, 3, 2, 1, 0, 7]
        @test [V129760(n) for n ∈ 0:8] == [0, 0, 2, 0, 4, 4, 6, 0, 8]
        @test [V142151(n) for n ∈ 0:8] == [0, 1, 2, 3, 6, 5, 6, 7, 14]
        @test [V003817(n) for n ∈ 0:8] == [1, 1, 3, 3, 7, 7, 7, 7, 15]
        @test [V080079(n) for n ∈ 0:8] == [1, 2, 1, 4, 3, 2, 1, 8, 7]
        @test [V086799(n) for n ∈ 0:8] == [1, 3, 3, 7, 5, 7, 7, 15, 9]
        @test [V038712(n) for n ∈ 0:8] == [1, 3, 1, 7, 1, 3, 1, 15, 1]
        @test [V006257(n) for n ∈ 0:8] == [0, 1, 1, 3, 1, 3, 5, 7, 1]

        @test [V080940(n) for n ∈ 0:8] == [1, 0, 1, 0, 1, 2, 1, 0, 1]
        @test [V135521(n) for n ∈ 0:8] == [1, 1, 1, 3, 1, 3, 1, 7, 1]

        @test [V048724(n) for n ∈ 0:8] == [0, 3, 6, 5, 12, 15, 10, 9, 24]
        @test [V003188(n) for n ∈ 0:8] == [0, 1, 3, 2, 6, 7, 5, 4, 12]
        @test [V038554(n) for n ∈ 0:8] == [0, 1, 1, 0, 2, 3, 1, 0, 4]
        @test [V048735(n) for n ∈ 0:8] == [0, 0, 0, 1, 0, 0, 2, 3, 0]
        @test [V213370(n) for n ∈ 0:8] == [0, 0, 0, 2, 0, 0, 4, 6, 0]

        @test [V135481(n) for n ∈ 0:8] == [0, 1, 0, 3, 0, 1, 0, 7, 0]
        @test [V327987(n) for n ∈ 0:8] == [0, 1, 0, 2, 2, 2, 4, 2, 0]
        @test L327988(99) == [0, 2, 8, 10, 26, 32, 34, 40, 50, 58, 74, 82]

        @test is327988(121) == false
        @test is327988(122) == true
    end
end

function demo()
    println()
    for n ∈ 0:15
        seq = [Bits(n, k, k+1) for k ∈ 0:12]
        println(BoolOps[n+1], " ", seq)
    end

    println()
    for n ∈ 1:8
        L280172(n) |> println
    end
end

function perf()
end

function main()
    test()
    demo()
    perf()
end

main()

end # module

#=
A327489, A327488, A327490, A001511,
A062383, A265705, A261693, A265716
=#
