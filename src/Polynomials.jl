# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module Polynomials

using Nemo
# import AbstractAlgebra.lead

export ModulePolynomials
export Poly, AltPoly, EgfPoly, AltEgfPoly
export Coeffs, CoeffSum, CoeffAltSum, CoeffConst, CoeffLeading, AltCoeffs
export Diagonal, Central, EgfCoeffs, AltEgfCoeffs, ReflectPoly

"""

Mostly convenient functions to deal with polynomials as often used in connection with ordinary and exponential generating functions. The naming scheme used is roughly described by:

```
   Poly       <-> Coeffs
   AltPoly    <-> Poly(AltCoeffs)
   EgfPoly    <-> Poly(EgfCoeffs)
   OgfPoly    <-> Poly(OgfCoeffs)
   AltEgfPoly <-> Poly(AltEgfCoeffs)
```

Here 'Alt' stands for alternating, 'Egf' for exponential generating function, 'Ogf' for ordinary generating function.

* Coeffs, CoeffSum, CoeffAltSum, CoeffConst, CoeffLeading, AltCoeffs, Diagonal, Central, EgfCoeffs, AltEgfCoeffs, Poly, AltPoly, EgfPoly, AltEgfPoly, ReflectPoly.
"""
const ModulePolynomials = ""

"""

Return the coefficients of the polynomial ``p``.
"""
Coeffs(p::fmpz_poly) = [coeff(p, k) for k ∈ 0:degree(p)]

"""

Return the coefficients of the polynomial ``p`` with alternating signs.
"""
AltCoeffs(p::fmpz_poly) = [(-1)^k * coeff(p, k) for k ∈ 0:degree(p)]

"""

Return the coefficients of the polynomial ``p`` multiplied by ``k!``.
"""
OgfCoeffs(p::fmpz_poly) = [factorial(k)*coeff(p, k) for k ∈ 0:degree(p)]

"""

Return the coefficients of the polynomial ``p`` divided by ``k!``. Note that integer division is used.
"""
EgfCoeffs(p::fmpz_poly) = [div(coeff(p, k), factorial(k)) for k ∈ 0:degree(p)]

"""

Return the coefficients of the polynomial ``p`` divided by ``(-1)^k k!``.
"""
AltEgfCoeffs(p::fmpz_poly) = [(-1)^k * div(coeff(p, k), factorial(k)) for k ∈ 0:degree(p)]

"""

Return the polynomial ``p`` with the coefficients C.
"""
function Poly(C)
    T, x = PolynomialRing(ZZ, "x")
    sum(c * x^k for (k, c) ∈ enumerate(C))
end

"""

Return the polynomial ``p`` with the coefficients C and alternating signs (i.e. with ``(-1)^k c[k] x^k)``.
"""
function AltPoly(C)
    T, x = PolynomialRing(ZZ, "x")
    sum((-1)^k * c * x^k for (k, c) ∈ enumerate(C))
end

"""

Return the polynomial ``p`` with the coefficients C used in the form ``c[k] x^k/k!``. Note that integer division is used.
"""
function EgfPoly(C)
    T, x = PolynomialRing(ZZ, "x")
    sum(div(c, factorial(k)) * x^k for (k, c) ∈ enumerate(C))
end

"""

Return the polynomial ``p`` with the coefficients C used in the form ``c[k] k! x^k``.
"""
function OgfPoly(C)
    T, x = PolynomialRing(ZZ, "x")
    sum(c * factorial(k) * x^k for (k, c) ∈ enumerate(C))
end

"""

Return the polynomial ``p`` with alternating signs attached to the coefficients .
"""
AltPoly(p::fmpz_poly) = Poly(AltCoeffs(p))
#    T, x = PolynomialRing(ZZ, "x")
#    sum((-1)^k*coeff(p, k)*x^k for k ∈ 0:degree(p))

"""

Return the polynomial ``p`` with coefficients in exponential form (i.e. with ``c[k] x^k/k!``).
"""
EgfPoly(p::fmpz_poly) = Poly(EgfCoeffs(p))
#    T, x = PolynomialRing(ZZ, "x")
#    sum(div(coeff(p, k), factorial(k))*x^k for k ∈ 0:degree(p))

"""

Return the polynomial ``p`` with coefficients in exponential form and alternating signs (i.e. with ``(-1)^k c[k] x^k/k!``).
"""
AltEgfPoly(p::fmpz_poly) = Poly(AltEgfCoeffs(p))
#    T, x = PolynomialRing(ZZ, "x")
#    sum((-1)^k*div(coeff(p, k), factorial(k))*x^k for k ∈ 0:degree(p))

"""

Return the list of the coefficients of the first ``len`` polynomials of the sequence of polynomials ``P`` as a triangle.
"""
Coeffs(P, len) = [[coeff(P(n), k) for k ∈ 0:degree(P(n))] for n ∈ 0:len-1]

"""

Return the sum of the coefficients of the polynomial ``p``.
"""
CoeffSum(p) = evaluate(p, 1)

"""

Return the sequence of the sum of coefficients of the sequence of polynomials ``P``.
"""
CoeffSum(P, len) = [CoeffSum(P(n)) for n ∈ 0:len-1]

"""

Return the alternating sum of the coefficients of the polynomial ``p``.
"""
CoeffAltSum(p) = evaluate(p, -1)

"""

Return the sequence of the alternating sums of the coefficients of the sequence of polynomials ``P``.
"""
CoeffAltSum(P, len) = [CoeffAltSum(P(n)) for n ∈ 0:len-1]

"""

Return the leading coefficient of the polynomial ``p``.
"""
CoeffLeading(p) = coeff(p, degree(p)) # lead(p)

"""

Return the sequence of the leading coefficient of the sequence of polynomials ``P``.
"""
Diagonal(P, len) = [CoeffLeading(P(n)) for n ∈ 0:len-1]

"""

Return the constant coefficient of the polynomial ``p``.
"""
CoeffConst(p) = coeff(p, 0)

"""

Return the sequence of the constant coefficients of the sequence of polynomials ``P``.
"""
CoeffConst(P, len) = [CoeffConst(P(n)) for n ∈ 0:len-1]

"""

Return the central column of the coefficients of the sequence of polynomials ``P``.
"""
Central(P, len) = [Coeffs(P(2n))[n+1] for n ∈ 0:len-1]

"""

Return the reflected polynomial of ``p``.
"""
function ReflectPoly(p::fmpz_poly)
    T, x = PolynomialRing(ZZ, "x")
    p(0) != 1 && throw(ValueError("Constant coefficient must be 1."))
    d = degree(p)
    x^d + sum(coeff(p, k) * x^(d - k) for k ∈ 1:d)
end


#START-TEST-########################################################

using Test, SeqUtils

function test()

    @testset "Polynomials" begin
        T, x = PolynomialRing(ZZ, "x")
        p = 63063000 * x^4 + 2702700 * x^3 + 16510 * x^2 + x
        @test Coeffs(p) == [0, 1, 16510, 2702700, 63063000]
        @test CoeffSum(p) == 65782211
        @test CoeffAltSum(p) == 60376809
        @test CoeffConst(p) == T(0)
        @test CoeffLeading(p) == 63063000

        q = x^2 - x - 1
        p = 1 - x - x^2
        r = ReflectPoly(p)
        @test r == q
    end

end

function demo()

    function P(m, n)
        R, x = PolynomialRing(ZZ, "x")
        function recP(m, n)
            n == 0 && return R(1)
            sum(binomial(m * n, m * k) * recP(m, n - k) * x for k ∈ 1:n)
        end
        recP(m, n)
    end

    # ... given a polynomial p:
    for m ∈ 0:4, n ∈ 0:5
        println("---> m: $m, n: $n")
        q = P(m, n)

        typeof(q) |> println
        q |> println
        AltPoly(q) |> println
        EgfPoly(q) |> println
        AltEgfPoly(q) |> println

        Coeffs(q) |> Println
        EgfCoeffs(q) |> Println
        AltEgfCoeffs(q) |> Println

        CoeffSum(q) |> println
        CoeffAltSum(q) |> println
        CoeffConst(q) |> println
        CoeffLeading(q) |> println
    end

    # ... given a sequence of polynomials P:
    for m ∈ 0:4
        println("---> m ", m)
        println("\nPolynomial:")
        Q(n) = P(m, n)
        println(Q(4))
        println("\nTriangle of coefficients:")
        Coeffs(Q, 7) |> Println
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

function perf() end

function main()
    test()
    demo()
    perf()
end

main()

end # module
