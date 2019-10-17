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
export TL241171, P278073, L278073, TL278073, P278074, L278074, TL278074, TL088218
export TL210029, TL281478, TL281479, TL281480, TL094088, TL243664, TL243665
export TL028296, TL002115, TL211212

const CachePoly = Dict{Tuple{Int,Int}, Nemo.fmpz_poly}()

function OrdSetPart(m, n)
    R, x = PolynomialRing(ZZ, "x")
    function recP(m, n)
        n == 0 && return R(1)
        haskey(CachePoly, (m, n)) && return CachePoly[(m, n)]
        p = sum(binomial(m*n, m*k)*recP(m, n-k)*x for k in 1:n)
        CachePoly[(m, n)] = p
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
L097805(n) = CoeffPoly(OrdSetPart(0, n))

"""

Return the first ``len`` rows of the triangle of compositions of ``n``.
"""
TL097805(n, len) = CoeffPoly(n -> OrdSetPart(0, n), len)

"""

Return the number of ordered set partitions of ``n`` (as a polynomial).
"""
P131689(n) = OrdSetPart(1, n)

"""

Return the number of ordered set partitions of ``n`` (as a list).
"""
L131689(n) = CoeffPoly(OrdSetPart(1, n))

"""

Return ``len`` rows of the triangle of ordered set partitions of ``n``.
"""
TL131689(n, len) = CoeffPoly(n -> OrdSetPart(1, n), len)

"""

Return the number number of ordered set partitions of ``2n`` into even sized blocks (as a polynomial).
"""
P241171(n) = OrdSetPart(2, n)

"""

Return the number number of ordered set partitions of ``2n`` into even sized blocks (as a list).
"""
L241171(n) = CoeffPoly(OrdSetPart(2, n))

"""

Return ``len`` rows of the triangle ordered set partitions of ``2n`` into even sized blocks.
"""
TL241171(n, len) = CoeffPoly(n -> OrdSetPart(2, n), len)

P278073(n) = OrdSetPart(3, n)
L278073(n) = CoeffPoly(OrdSetPart(3, n))
TL278073(n, len) = CoeffPoly(n -> OrdSetPart(3, n), len)

P278074(n) = OrdSetPart(4, n)
L278074(n) = CoeffPoly(OrdSetPart(4, n))
TL278074(n, len) = CoeffPoly(n -> OrdSetPart(4, n), len)

TL088218(len) = Central(n -> OrdSetPart(0, n), len)
TL210029(len) = Central(n -> OrdSetPart(1, n), len)
TL281478(len) = Central(n -> OrdSetPart(2, n), len)
TL281479(len) = Central(n -> OrdSetPart(3, n), len)
TL281480(len) = Central(n -> OrdSetPart(4, n), len)

TL094088(len) = CoeffSum(n -> OrdSetPart(2, n), len)
TL243664(len) = CoeffSum(n -> OrdSetPart(3, n), len)
TL243665(len) = CoeffSum(n -> OrdSetPart(4, n), len)

TL028296(len) = CoeffAltSum(n -> OrdSetPart(2, n), len)
TL002115(len) = CoeffAltSum(n -> OrdSetPart(3, n), len)
TL211212(len) = CoeffAltSum(n -> OrdSetPart(4, n), len)

# ------------------------------------------------------

#for m in 1:4, n in 0:6
#    SetPart(m, n) |> println
#    CoeffPolyScaled(OrdSetPart(m, n)) |> println
#end


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

        @test TL088218(7) == [1, 1, 3, 10, 35, 126, 462]
        @test TL210029(7) == [1, 1, 14, 540, 40824, 5103000, 953029440]
        @test TL281478(6) == [1, 1, 126, 126720, 494053560, 5283068427000]
        @test TL281479(5) == [1, 1, 1364, 42771456, 10298900437056]
        @test TL281480(5) == [1, 1, 16510, 17651304000, 286988816206755000]

        @test TL094088(7) == [1, 1, 7, 121, 3907, 202741, 15430207]
        @test TL243664(7) == [1, 1, 21, 1849, 426405, 203374081, 173959321557]
        @test TL243665(6) == [1, 1, 71, 35641, 65782211, 323213457781]

        @test TL028296(7) == [1, -1, 5, -61, 1385, -50521, 2702765]
        @test TL002115(7) == [1, -1, 19, -1513, 315523, -136085041, 105261234643]
        @test TL211212(6) == [1, -1, 69, -33661, 60376809, -288294050521]
    end
end

function demo()
    for m in 1:4, n in 0:6
        CoeffPoly(OrdSetPart(m, n)) |> println
    end
    for m in 1:4, n in 0:6
        CoeffPolyScaled(OrdSetPart(m, n)) |> println
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
