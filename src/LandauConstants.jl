# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module LandauConstants

using Nemo, NumberTheory, GeneralizedBinomial, Products
export V000120, V102376, V011371, V120738, V060818, V124399, V056982
export V001511, V046161, V001316, V163590, V327492, V005187, V001790
export V277233, V327495, V327493, V327491, V007814, V001803, V327494
export V006519, V000265, Bin, BitCount, EvenPart, OddPart

"""

* V277233(n) / 4^V005187(n) are the Landau constants. These constants are defined as G(n)`` = ∑_{j=0..n} g(j)^2`` with the normalized central binomial
```
    g(n) = (2n)! / (2^n n!)^2 = V001790(n) / V046161(n).
```
* V327495(n) / 4^V327492(n) are the rationals considered here. These numbers are defined as H(n)`` = ∑_{j=0..n} h(j)^2`` with the normalized swinging factorial
```
    h(n) = n! / (2^n ⌊n/2⌋!)^2 = V163590(n) / V327493(n).
```
* In particular, this means that we have the pure integer representations
```
    V277233(n) = ∑{k=0..n}(V001790(k) 2^{V005187(n) - V005187(k)})^2;
    V327495(n) = ∑{k=0..n}(V163590(k) 2^{V327492(n) - V327492(k)})^2.
```

* V000120, V102376, V011371, V120738, V060818, V124399, V056982, V001511, V046161, V001316, V163590, V327492, V005187, V001790, V277233, V327495, V327493, V327491, V007814, V001803, V327494, V006519, V000265, Bin, BitCount, EvenPart, OddPart
"""
const ModuleLandauConstants = ""

"""

Return the 2-adic valuation of ``n``.
"""
Bin(n::Int) = n == 0 ? 0 : valuation(n, 2)


"""

Return the even part of ``n``.
"""
EvenPart(n::Int) = 1 << Bin(n)

"""

Return the even part of ``n``.
"""
V006519(n::Int) = EvenPart(n)

"""

Return the odd part of ``n``.
"""
OddPart(n::Int) = n >> Bin(n)

"""

Return the odd part of ``n``.
"""
V000265(n::Int) = OddPart(n)

"""

Return the odd part of the swinging factorial ``n! / ⌊n/2⌋!^2``.
"""
function V163590(n::Int)
    (r = get(CacheV163590, n, 0)) > 0 && return r
    h = V163590(n - 1) << Bin(n)
    CacheV163590[n] = isEven(n) ? div(h, n) : h * n
end

const CacheV163590 = Dict{Int,Int}(0 => 1)

"""

Return the odd part of the swinging factorial of ``2n+1``.
"""
V001803(n) = V163590(2n+1)
#V001803(n) = sum(<<(V001790(k), V005187(n) - V005187(k)) for k ∈ 0:n)

"""

Return the odd part of the swinging factorial of ``2n``.
"""
V001790(n::Int) = V163590(2n)
# V001790(n) = Binomial(2n, n) >> BitCount(2n)

"""

Return valuation ``(n, 2)`` if ``4`` divides ``n`` else ``1 + (n mod 2)``.
"""
V327491(n::Int) = Divides(4, n) ? Bin(n) : mod(n, 2) + 1

"""

Return ``2n - bc(n) + mod(n, 2)`` where bc(n) is BitCount(n).
"""
V327492(n::Int) = 2n - BitCount(n) + mod(n, 2)

"""

Return ``2^{2n - bc(n) + mod(n, 2)}`` where bc(n) is BitCount(n).
"""
V327493(n::Int) = 2^(2n - BitCount(n) + mod(n, 2))
#V327493(n::Int) = 2^V327492(n)

"""

Return the 2-adic valuation of ``n``.
"""
V007814(n::Int) = Bin(n)

"""

Return the 2-adic valuation of ``2n``.
"""
V001511(n::Int) = Bin(2n)

"""

Return the number of ``1``'s in binary expansion of ``n``.
"""
BitCount(n::Int) = count_ones(n)
#sum(digits(n, base = 2))

"""

Return the number of ``1``'s in binary expansion of ``n``.
"""
V000120(n::Int) = BitCount(n)

"""

Return 2^BitCount(n). Should be called Glaisher's sequence since James Glaisher showed that odd binomial coefficients are counted by this sequence.
"""
V001316(n::Int) = 2^BitCount(n)

"""

Return 4^BitCount(n).
"""
V102376(n::Int) = 4^BitCount(n)

"""

Return ``n`` - BitCount(n).
"""
V011371(n::Int) = n - BitCount(n)

"""

Return ``2n`` - BitCount(n).
"""
V005187(n::Int) = 2n - BitCount(n)

"""

Return ``4n`` - BitCount(n).
"""
V120738(n::Int) = 4n - BitCount(n)

"""

Return ``2^{n - bc(n)}`` where bc(n) is BitCount(n).
"""
V060818(n::Int) = 2^(n - BitCount(n))

"""

Return ``2^{2n - bc(n)}`` where bc(n) is BitCount(n).
"""
V046161(n::Int) = 2^(2n - BitCount(n))
# V046161(n) = 2^V005187(n)

"""

Return ``4^{n - bc(n)}`` where bc(n) is BitCount(n).
"""
V124399(n::Int) = 4^(n - BitCount(n))

"""

Return ``4^{2n - bc(n)}`` where bc(n) is BitCount(n).
"""
V056982(n::Int) = 4^(2n - BitCount(n))
# V056982(n) = 4^V005187(n)

"""

Return the numerator of ``∑_{j=0..n} j!/(2^j ⌊j/2⌋!)^2``.
"""
V327494(n) = sum(<<(V163590(k), V327492(n) - V327492(k)) for k ∈ 0:n)

"""

Return the numerators of the Landau constants.
"""
V277233(n) = sum(<<(V001790(k), V005187(n) - V005187(k))^2 for k ∈ 0:n)

"""

Return the numerators of the swinging Landau constants.
"""
V327495(n) = sum(<<(V163590(k), V327492(n) - V327492(k))^2 for k ∈ 0:n)


#START-TEST-########################################################

using Test

function test()
    @testset "Landau" begin
        @test V006519(0) == 1
        @test V000265(0) == 0
        @test V327494(0) == 1
        @test V001803(0) == 1
        @test V007814(0) == 0
        @test V327491(0) == 0
        @test V327493(0) == 1
        @test V000120(0) == 0
        @test V102376(0) == 1
        @test V011371(0) == 0
        @test V120738(0) == 0
        @test V060818(0) == 1
        @test V124399(0) == 1
        @test V056982(0) == 1
        @test V001511(0) == 0
        @test V046161(0) == 1
        @test V001316(0) == 1
        @test V163590(0) == 1
        @test V327492(0) == 0
        @test V005187(0) == 0
        @test V001790(0) == 1
        @test V277233(0) == 1
        @test V327495(0) == 1

        @test V006519(10) == 2
        @test V000265(10) == 5
        @test V327494(10) == 403341
        @test V001803(10) == 969969
        @test V007814(10) == 1
        @test V327491(10) == 1
        @test V327493(10) == 262144
        @test V000120(10) == 2
        @test V102376(10) == 16
        @test V011371(10) == 8
        @test V120738(10) == 38
        @test V060818(10) == 256
        @test V124399(10) == 65536
        @test V056982(10) == 68719476736
        @test V001511(10) == 2
        @test V046161(10) == 262144
        @test V001316(10) == 4
        @test V001511(10) == 2
        @test V163590(10) == 63
        @test V327492(10) == 18
        @test V005187(10) == 18
        @test V001790(10) == 46189
        @test V277233(10) == 125233642041
        @test V327495(10) == 74796032037
    end
end

function demo() end

function perf()
    "V001511" |> println
    @time for n ∈ 0:100 V001511(n) end
    "V163590" |> println
    @time for n ∈ 0:100 V163590(n) end
    "V327492" |> println
    @time for n ∈ 0:100 V327492(n) end
    "V005187" |> println
    @time for n ∈ 0:100 V005187(n) end
    "V001790" |> println
    @time for n ∈ 0:100 V001790(n) end
    "V277233" |> println
    @time for n ∈ 0:100 V277233(n) end
    "V327495" |> println
    @time for n ∈ 0:100 V327495(n) end
end

function main()
    test()
    demo()
    perf()
end

main()

end # module
