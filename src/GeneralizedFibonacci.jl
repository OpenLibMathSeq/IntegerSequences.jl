# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module GeneralizedFibonacci
using Nemo, SeqUtils

export ModuleGeneralizedFibonacci
export Multinacci, V309896, V006053, V188021, V231181

"""

* The classical Fibonacci numbers are exported from the module Fibonacci. See I000045, F000045, L000045, V000045, R000045 and is000045.

* Fibonacci(n) is defined as the number of compositions of n with no part equal to 1. They are the special case Fibonacci(n) = Multinacci(2, n).

```
[m\n] 0  1  2   3   4   5    6    7     8     9    10    11
----------------------------------------------------------------
[0]   1, 0, 0,  0,  0,  0,   0,   0,    0,    0,    0,    0, ...
[1]   1, 1, 1,  1,  1,  1,   1,   1,    1,    1,    1,    1, ...
[2]   1, 1, 2,  3,  5,  8,  13,  21,   34,   55,   89,  144, ...
[3]   1, 1, 3,  4,  9, 14,  28,  47,   89,  155,  286,  507, ...
[4]   1, 1, 4,  5, 14, 20,  48,  75,  165,  274,  571,  988, ...
[5]   1, 1, 5,  6, 20, 27,  75, 110,  275,  429, 1001, 1637, ...
[6]   1, 1, 6,  7, 27, 35, 110, 154,  429,  637, 1638, 2548, ...
```

*  Multinacci, V309896, V006053, V188021, V231181
"""
const ModuleGeneralizedFibonacci = ""

"""

Return the ``n``-th term of the ``m``-th Multinacci sequence.
"""
function Multinacci(m::Int, n::Int)::fmpz
    haskey(CacheMultinacci, (m, n)) && return CacheMultinacci[(m, n)]
    n <  0 && return ZZ(0); n == 0 && return ZZ(1); m == 0 && return ZZ(m^n)
    a = sum((-1)^j*binom(m-1-j, j  )*Multinacci(m, n-1-2*j) for j ∈ 0:div(m-1,2))
    b = sum((-1)^j*binom(m-1-j, j+1)*Multinacci(m, n-2-2*j) for j ∈ 0:div(m-2,2))
    r = a + b
    CacheMultinacci[(m, n)] = r
end

"""

Return the ``k``-th term of the ``n``-th Multinacci sequence.
"""
V309896(n, k) = Multinacci(n, k)

const CacheMultinacci = Dict{Tuple{Int, Int}, fmpz}()

"""

Return the ``n``-th term of the third Multinacci sequence.
"""
V006053(n) = Multinacci(3, n)

"""

Return the ``n``-th term of the fourth Multinacci sequence.
"""
V188021(n) = Multinacci(4, n)

"""

Return the ``n``-th term of the fiveth Multinacci sequence.
"""
V231181(n) = Multinacci(5, n)

#START-TEST-########################################################

using Test

function test()
    @testset "Multinacci" begin
        @test Multinacci(0, 0) == 1
        @test [Multinacci(2, n) for n ∈ 0:9] == [1, 1, 2, 3, 5,  8, 13, 21, 34,  55]
        @test [V006053(n) for n ∈ 0:9] == [1, 1, 3, 4, 9, 14, 28, 47, 89, 155]
        @test [V188021(n) for n ∈ 0:9] == [1, 1, 4, 5, 14, 20, 48, 75, 165, 274]
        @test [V231181(n) for n ∈ 0:9] == [1, 1, 5, 6, 20, 27, 75, 110, 275,429]
        @test [Multinacci(6, n) for n ∈ 0:9] == [1, 1, 6, 7, 27, 35, 110, 154,429,637]
        @test [Multinacci(7, n) for n ∈ 0:9] == [1, 1, 7, 8, 35, 44, 154, 208,637,910]
        @test [Multinacci(8, n) for n ∈ 0:9] == [1, 1, 8, 9, 44, 54,208,273,910, 1260]
    end
end

function demo()
    for n ∈ 0:9
        print("$n ")
        [Multinacci(n, k) for k ∈ 0:9] |> Println
    end
end

function perf()
    @time (for n ∈ 0:1000 Multinacci(3, n) end)
end

function main()
    test()
    demo()
    perf()
end

main()

end # module
