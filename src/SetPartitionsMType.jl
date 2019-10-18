# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module SetPartitionsMType

using Nemo, Polynomials

"""

general Definition

* exported functions
"""
const ModuleSetPartitionsMType = ""

export ModuleSetPartitionsMType
export P097805, L097805, TL097805, P131689, L131689, TL131689, P241171, L241171
export TL241171, P278073, L278073, TL278073, P278074, L278074, TL278074, L088218
export L210029, L281478, L281479, L281480, L094088, L243664, L243665
export L028296, L002115, L211212, L156289, L291451, L291452
export L000587, L005046, L260884, L291973, L291974, L291975, L291976
export V000587, V005046

const CacheP = Dict{Tuple{Int,Int}, Nemo.fmpz_poly}()

function OrdSetPart(m, n)
    R, x = PolynomialRing(ZZ, "x")
    function recP(m, n)
        n == 0 && return R(1)
        haskey(CacheP, (m, n)) && return CacheP[(m, n)]
        p = sum(binomial(m*n, m*k)*recP(m, n-k)*x for k in 1:n)
        CacheP[(m, n)] = p
    end
    recP(m, n)
end

"""

Return the number of compositions of ``n`` (as a polynomial).
"""
P097805(n) = OrdSetPart(0, n)

"""

Return the number of compositions of ``n`` (as a list).
"""
L097805(n) = Coeffs(OrdSetPart(0, n))

"""

Return the first ``len`` rows of the triangle of compositions of ``n``.
"""
TL097805(n, len) = Coeffs(n -> OrdSetPart(0, n), len)

"""

Return the number of ordered set partitions of ``n`` (as a polynomial).
"""
P131689(n) = OrdSetPart(1, n)

"""

Return the number of ordered set partitions of ``n`` (as a list).
"""
L131689(n) = Coeffs(OrdSetPart(1, n))

"""

Return ``len`` rows of the triangle of ordered set partitions of ``n``.
"""
TL131689(n, len) = Coeffs(n -> OrdSetPart(1, n), len)

"""

Return the number number of ordered set partitions of ``2n`` into even sized blocks (as a polynomial).
"""
P241171(n) = OrdSetPart(2, n)

"""

Return the number number of ordered set partitions of ``2n`` into even sized blocks (as a list).
"""
L241171(n) = Coeffs(OrdSetPart(2, n))

"""

Return ``len`` rows of the triangle ordered set partitions of ``2n`` into even sized blocks.
"""
TL241171(n, len) = Coeffs(n -> OrdSetPart(2, n), len)

P278073(n) = OrdSetPart(3, n)
L278073(n) = Coeffs(OrdSetPart(3, n))
TL278073(n, len) = Coeffs(n -> OrdSetPart(3, n), len)

P278074(n) = OrdSetPart(4, n)
L278074(n) = Coeffs(OrdSetPart(4, n))
TL278074(n, len) = Coeffs(n -> OrdSetPart(4, n), len)

L088218(len) = Central(n -> OrdSetPart(0, n), len)
L210029(len) = Central(n -> OrdSetPart(1, n), len)
L281478(len) = Central(n -> OrdSetPart(2, n), len)
L281479(len) = Central(n -> OrdSetPart(3, n), len)
L281480(len) = Central(n -> OrdSetPart(4, n), len)

L094088(len) = CoeffSum(n -> OrdSetPart(2, n), len)
L243664(len) = CoeffSum(n -> OrdSetPart(3, n), len)
L243665(len) = CoeffSum(n -> OrdSetPart(4, n), len)

L028296(len) = CoeffAltSum(n -> OrdSetPart(2, n), len)
L002115(len) = CoeffAltSum(n -> OrdSetPart(3, n), len)
L211212(len) = CoeffAltSum(n -> OrdSetPart(4, n), len)

# ------------------------------------------------------

#"""
# Return the Stirling numbers of 2nd kind.
#"""
# L048993(n) = CoeffExp(OrdSetPart(1, n))
# Exported from Module StirlingLahNumbers

# A000587 Rao Uppuluri-Carpenter numbers (or complementary Bell numbers): e.g.f. = exp(1 - exp(x)).
V000587(n) = sum(AltExpCoeffs(OrdSetPart(1, n)))
L000587(len) = [V000587(n) for n in 0:len-1]

# A156289 Triangle read by rows: T(n,k) is the number of end rhyme patterns of a poem of an even number of lines (2n) with 1<=k<=n evenly rhymed sounds.
L156289(n) = ExpCoeffs(OrdSetPart(2, n))
# A005046 Number of partitions of a 2n-set into even blocks.
V005046(n) = sum(ExpCoeffs(OrdSetPart(2, n)))
L005046(len) = [V005046(n) for n in 0:len-1]
#A260884 Number of set partitions of a 2n-set into even blocks which have even length minus the number of partitions into even blocks which have odd length.
V260884(n) = sum(AltExpCoeffs(OrdSetPart(2, n)))
L260884(len) = [V260884(n) for n in 0:len-1]

# A291451 Triangle read by rows, expansion of e.g.f. exp(x*(exp(z)/3 + 2*exp(-z/2)* cos(z*sqrt(3)/2)/3 - 1)), nonzero coefficients of z.
L291451(n) = ExpCoeffs(OrdSetPart(3, n))
# A291973 a(n) = (3*n)! * [z^(3*n)] exp(exp(z)/3 + 2*exp(-z/2)*cos(z*sqrt(3)/2)/3 - 1).
V291973(n) = sum(ExpCoeffs(OrdSetPart(3, n)))
L291973(len) = [V291973(n) for n in 0:len-1]
# A291974 a(n) = (3*n)! * [z^(3*n)] exp(-(exp(z)/3 + 2*exp(-z/2)*cos(z*sqrt(3)/2)/3 - 1)).
V291974(n) = sum(AltExpCoeffs(OrdSetPart(3, n)))
L291974(len) = [V291974(n) for n in 0:len-1]

#L025035(len) = Diagonal(n -> OrdSetPart(3, n), len)
#X025035(len) = Diagonal(n -> CoeffExp(OrdSetPart(3, n)), len)

# A291452 Triangle read by rows, expansion of e.g.f. exp(x*(cos(z) + cosh(z) - 2)/2), nonzero coefficients of z.
L291452(n) = ExpCoeffs(OrdSetPart(4, n))
# A291975 a(n) = (4*n)! * [z^(4*n)] exp((cos(z) + cosh(z))/2 - 1).
V291975(n) = sum(ExpCoeffs(OrdSetPart(4, n)))
L291975(len) = [V291975(n) for n in 0:len-1]
# A291976	a(n) = (4*n)! * [z^(4*n)] exp(1 - (cos(z) + cosh(z))/2).
V291976(n) = sum(AltExpCoeffs(OrdSetPart(4, n)))
L291976(len) = [V291976(n) for n in 0:len-1]


#START-TEST-########################################################

using Test, SeqTests, SeqUtils

function test()

    @testset "OrdSetPartitionsMType" begin
        @test string(P097805(3)) == "x^3+2*x^2+x"
        @test L097805(3) == [0, 1, 2, 1]
        @test TL097805(3, 5) == [[1], [0, 1], [0, 1, 1], [0, 1, 2, 1], [0, 1, 3, 3, 1]]

        @test string(P131689(4)) == "24*x^4+36*x^3+14*x^2+x"
        @test L131689(4) == [0, 1, 14, 36, 24]
        @test TL131689(4, 5) == [[1], [0, 1], [0, 1, 2], [0, 1, 6, 6], [0, 1, 14, 36, 24]]

        @test string(P241171(4)) == "2520*x^4+1260*x^3+126*x^2+x"
        @test L241171(4) == [0, 1, 126, 1260, 2520]
        @test TL241171(4, 4) == [[1], [0, 1], [0, 1, 6], [0, 1, 30, 90]]

        @test string(P278073(5)) == "168168000*x^5+33633600*x^4+1561560*x^3+10920*x^2+x"
        @test L278073(5) == [0, 1, 10920, 1561560, 33633600, 168168000]
        @test TL278073(5, 4) == [[1], [0, 1], [0, 1, 20], [0, 1, 168, 1680]]

        @test string(P278074(4)) == "63063000*x^4+2702700*x^3+16510*x^2+x"
        @test L278074(4) == [0, 1, 16510, 2702700, 63063000]
        @test TL278074(4, 4) == [[1], [0, 1], [0, 1, 70], [0, 1, 990, 34650]]

        @test L088218(7) == [1, 1, 3, 10, 35, 126, 462]
        @test L210029(7) == [1, 1, 14, 540, 40824, 5103000, 953029440]
        @test L281478(6) == [1, 1, 126, 126720, 494053560, 5283068427000]
        @test L281479(5) == [1, 1, 1364, 42771456, 10298900437056]
        @test L281480(5) == [1, 1, 16510, 17651304000, 286988816206755000]

        @test L094088(7) == [1, 1, 7, 121, 3907, 202741, 15430207]
        @test L243664(7) == [1, 1, 21, 1849, 426405, 203374081, 173959321557]
        @test L243665(6) == [1, 1, 71, 35641, 65782211, 323213457781]

        @test L028296(7) == [1, -1, 5, -61, 1385, -50521, 2702765]
        @test L002115(7) == [1, -1, 19, -1513, 315523, -136085041, 105261234643]
        @test L211212(6) == [1, -1, 69, -33661, 60376809, -288294050521]

        # -------------------------------------------------------------------

        @test L156289(5) == [0, 1, 255, 2205, 3150, 945]
        @test L156289(6) == [0, 1, 1023, 21120, 65835, 51975, 10395]
        @test L291451(5) == [0, 1, 5460, 260260, 1401400, 1401400]
        @test L291452(5) == [0, 1, 130815, 35586525, 727476750, 2546168625]

        @test V000587(7) == -9
        @test L000587(10) == [1, -1, 0, 1, 1, -2, -9, -9, 50, 267]
        @test V005046(7) == 4373461
        @test L005046(7) == [1, 1, 4, 31, 379, 6556, 150349]
        @test L260884(7) == [1, -1, 2, -1, -43, 254, 4157]
        @test L291973(7) == [1, 1, 11, 365, 25323, 3068521, 583027547]
        @test L291974(7) == [1, -1, 9, -197, 6841, -254801, -3000807]
        @test L291975(6) == [1, 1, 36, 6271, 3086331, 3309362716]
        @test L291976(6) == [1, -1, 34, -5281, 2185429, -1854147586]
    end
end

function demo()
    for m in 1:4, n in 0:6
        Coeffs(OrdSetPart(m, n)) |> Println
    end
    for m in 1:4, n in 0:6
        ExpCoeffs(OrdSetPart(m, n)) |> Println
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
