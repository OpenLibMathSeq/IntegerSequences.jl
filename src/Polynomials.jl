# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module Polynomials

using Nemo
# import AbstractAlgebra.lead

export ModulePolynomials
export CoeffPoly, CoeffSum, CoeffAltSum, CoeffConst, CoeffLeading, Diagonal
export Central, CoeffScaled, CoeffSignedScaled

"""

Some utility functions for computing with polynomials. Exemplary applied to some triangles about ordered set partitions.

* CoeffPoly, CoeffSum, CoeffAltSum, CoeffConst, CoeffLeading, Diagonal, Central, CoeffScaled, CoeffSignedScaled.

"""
const ModulePolynomials = ""

"""

Return the coefficients of the polynomial ``p``.
"""
CoeffPoly(p) = [coeff(p, k) for k in 0:degree(p)]

"""

Return the coefficients of the polynomial ``p`` scaled by ``k!``.
"""
CoeffScaled(p) = [div(coeff(p, k), fac(k)) for k in 0:degree(p)]

"""

Return the coefficients of the polynomial ``p`` scaled by ``(-1)^k*k!``.
"""
CoeffSignedScaled(p) = [div(coeff(p, k), (-1)^k*fac(k)) for k in 0:degree(p)]

"""

Return the list of the coefficients of the first ``len`` polynomials of the sequence of polynomials ``P`` as a regular triangle.
"""
CoeffPoly(P, len) = [[coeff(P(n), k) for k in 0:degree(P(n))] for n in 0:len-1]

"""

Return the sum of the coefficients of the polynomial ``p``.
"""
CoeffSum(p) = evaluate(p, 1)

"""

Return the sequence of the sum of coefficients of the sequence of polynomials ``P``.
"""
CoeffSum(P, len) = [CoeffSum(P(n)) for n in 0:len-1]

"""

Return the alternating sum of the coefficients of the polynomial ``p``.
"""
CoeffAltSum(p) = evaluate(p, -1)

"""

Return the sequence of the alternating sums of the coefficients of the sequence of polynomials ``P``.
"""
CoeffAltSum(P, len) = [CoeffAltSum(P(n)) for n in 0:len-1]

"""

Return the leading coefficient of the polynomial ``p``.
"""
CoeffLeading(p) = coeff(p, degree(p)) # lead(p)

"""

Return the sequence of the leading coefficient of the sequence of polynomials ``P``.
"""
Diagonal(P, len) = [CoeffLeading(P(n)) for n in 0:len-1]

"""

Return the constant coefficient of the polynomial ``p``.
"""
CoeffConst(p) = coeff(p, 0)

"""

Return the sequence of the constant coefficients of the sequence of polynomials ``P``.
"""
CoeffConst(P, len) = [CoeffConst(P(n)) for n in 0:len-1]

"""

Return the central column of the coefficients of the sequence of polynomials ``P``.
"""
Central(P, len) = [CoeffPoly(P(2n))[n+1] for n in 0:len-1]


#START-TEST-########################################################

using Test, SeqUtils

function test()

    @testset "Polynomials" begin
        T, x = PolynomialRing(ZZ, "x")
        p = 63063000*x^4 + 2702700*x^3 + 16510*x^2 + x
        @test CoeffPoly(p) == [0, 1, 16510, 2702700, 63063000]
        @test CoeffSum(p) == 65782211
        @test CoeffAltSum(p) == 60376809
        @test CoeffConst(p) == T(0)
        @test CoeffLeading(p) == 63063000
    end

end

function demo()

    function P(m, n)
        R, x = PolynomialRing(ZZ, "x")
        function recP(m, n)
            n == 0 && return R(1)
            sum(binomial(m*n, m*k)*recP(m, n-k)*x for k in 1:n)
        end
        recP(m, n)
    end

    # ... given a polynomial p:
    for m in 0:4, n in 0:5
        println("---> m: $m, n: $n")
        q = P(m, n)
        CoeffPoly(q) |> println
        CoeffSum(q) |> println
        CoeffAltSum(q) |> println
        CoeffConst(q) |> println
        CoeffLeading(q) |> println
    end

    # ... given a sequence of polynomials P:
    for m in 0:4
        println("---> m ", m)
        println("\nPolynomial:")
        Q(n) = P(m, n)
        println(Q(4))
        println("\nTriangle of coefficients:")
        CoeffPoly(Q, 7) |> Println
        println("\nSum of coefficients:")
        CoeffSum(Q, 7) |> Println
        println("\nAlternating sum of coefficients:")
        CoeffAltSum(Q, 7) |> Println
        println("\nLeading coefficients:")
        Diagonal(Q, 7) |> Println
        println("\nCentral column of coefficient triangle:")
        Central(Q, 7) |> Println
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
