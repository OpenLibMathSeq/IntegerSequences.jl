# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module GeneralizedBinomial
using Nemo, PrimesIterator, NumberTheory, Products, Triangles

export ModuleGeneralizedBinomial
export Binomial, Pascal, T007318, Multinomial

"""

 P. Luschny, [Generalized Binomial](http://oeis.org/wiki/User:Peter_Luschny/ExtensionsOfTheBinomial), OEIS Wiki.

* Binomial, Pascal, T007318
"""
const ModuleGeneralizedBinomial = ""

"""

The classical binomial coefficients defined for ``n≥0`` and ``0≤k≤n`` (a.k.a. Pascal's triangle).
"""
function Pascal(n::Int, k::Int)

    (k == 0 || k == n) && return 1
    if k > div(n, 2)
        k = n - k
    end

    nk = n - k
    factors = fmpz[]
    rootN = isqrt(n)

    # Make use of Kummer's theorem.
    for prime ∈ Primes(2, n)

        if prime > nk
            push!(factors, prime)
            continue
        end

        prime > div(n, 2) && continue

        if prime > rootN
            (n % prime < k % prime) && push!(factors, prime)
            continue
        end

        r, N, K, p = 0, n, k, 1

        while N > 0
            r = N % prime < (K % prime + r) ? 1 : 0
            if r == 1
                p *= prime
            end
            N = div(N, prime)
            K = div(K, prime)
        end

        p > 1 && push!(factors, p)
    end

    ∏(factors)
end

"""

Pascal's triangle.
"""
function T007318(n::Int)
    T = zeros(QQ, div(n * (n + 1), 2))
    j = 1
    for m ∈ 0:n-1, k ∈ 0:m
        T[j] = binomial(ZZ(m), ZZ(k))
        j += 1
    end
    T
end

# See the discussion on
# [Extensions of the Binomial](http://oeis.org/wiki/User:Peter_Luschny/ExtensionsOfTheBinomial).
"""

Return the extended binomial coefficients defined for all ``n ∈ Z`` and ``k ∈ Z``. Behaves like the binomial function in Maple and Mathematica.

``\\binom{n}{k} = \\lim \\limits_{x \\rightarrow 1}(Γ(n + x) / (Γ(k + x) Γ(n - k + x))).``

"""
function Binomial(n::Int, k::Int)
    0 ≤ k ≤ n && return binomial(ZZ(n), ZZ(k))
    k ≤ n < 0 && return binomial(ZZ(-k - 1), ZZ(n - k)) * (-1)^(n - k)
    n < 0 ≤ k && return binomial(ZZ(-n + k - 1), ZZ(k)) * (-1)^k
    ZZ(0)
end

"""

Return the multinomial coefficient of a list.
"""
function Multinomial(lst::Array{Int})
    s = 0
    result = fmpz(1)
    for c ∈ lst
        s += c
        result *= binomial(ZZ(s), ZZ(c))
    end
    result
end


#START-TEST-########################################################

using Test
function test()

    @testset "Binomial" begin
        for n ∈ 0:10, k ∈ 0:n
            @test Binomial(n, k) == div(factorial(n), (factorial(n - k) * factorial(k)))
            @test Binomial(n, k) == Pascal(n, k)
        end
    end
end

function demo()
    ShowAsΔ(T007318(8))
    println()

    for n ∈ -10:10
        println([Binomial(n, k) for k ∈ -10:10])
    end
end

"""

for n ∈ 0:10000 Binomial(2*n,n) end
    0.504729 seconds (10.00 k allocations: 156.266 KiB)
for n ∈ -100:100, k ∈ -100:100 Binomial(n,k) end
    0.008669 seconds (55.55 k allocations: 867.984 KiB)
for k ∈ -10000:10000 Binomial(-5,k) end
    0.005378 seconds (40.00 k allocations: 624.969 KiB)
"""
function perf()
    @time (for n ∈ 0:10000
        Binomial(2n, n)
    end)
    @time (for n ∈ -100:100, k ∈ -100:100
        Binomial(n, k)
    end)
    @time (for k ∈ -10000:10000
        Binomial(-5, k)
    end)
end

function main()
    test()
    demo()
    perf()
end

main()

end # module
