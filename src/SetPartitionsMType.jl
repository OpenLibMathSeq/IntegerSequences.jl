# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module SetPartitionsMType

using Nemo, Polynomials

export ModuleSetPartitionsMType, OrderedSetPolynomials, OrderedSetPartitions
export L000587, L002115, L005046, L028296, L088218, L094088, L097805
export L131689, L156289, L210029, L211212, L241171, L243664, L243665
export L260884, L278073, L278074, L281478, L281479, L281480, L291451
export L291452, L291973, L291974, L291975, L291976, P097805, P131689
export P241171, P278073, P278074, TL097805, TL131689, TL241171, TL278073
export TL278074, V000587, V005046, V260884, V291973, V291974, V291975, V291976
export L014606

"""


## Ordered set partitions of m-type

| type | m = 0 | m = 1 | m = 2 | m = 3 | m = 4 |
|----|-------|-------|-------|-------|-------|
| by shape | [A178803](https://oeis.org/A178803) | [A133314](https://oeis.org/A133314) | [A327022](https://oeis.org/A327022) | [A327023](https://oeis.org/A327023) | [A327024](https://oeis.org/A327024) |
| by length | [A318144](https://oeis.org/A318144) | [A131689](https://oeis.org/A131689) | [A241171](https://oeis.org/A241171) | [A278073](https://oeis.org/A278073) | [A278074](https://oeis.org/A278074) |
| diagonal | [A000142](https://oeis.org/A000142) | [A000142](https://oeis.org/A000142) | [A000680](https://oeis.org/A000680) | [A014606](https://oeis.org/A014606) | [A014608](https://oeis.org/A014608) |
| row sum | [A101880](https://oeis.org/A101880) | [A000670](https://oeis.org/A000670) | [A094088](https://oeis.org/A094088) | [A243664](https://oeis.org/A243664) | [A243665](https://oeis.org/A243665) |
| alt row sum | [A260845](https://oeis.org/A260845) | [A033999](https://oeis.org/A033999) | [A028296](https://oeis.org/A028296) | [A002115](https://oeis.org/A002115) | [A211212](https://oeis.org/A211212) |
| central | [A053529](https://oeis.org/A053529) | [A210029](https://oeis.org/A210029) | [A281478](https://oeis.org/A281478) | [A281479](https://oeis.org/A281479) | [A281480](https://oeis.org/A281480) |

## Set partitions of m-type

For example consider the case n = 4. There are five integer partitions of 4:

* P = [[4], [3, 1], [2, 2], [2, 1, 1], [1, 1, 1, 1]]. The shapes are m times the parts of the integer partitions: S(m) = [[4m], [3m, m], [2m, 2m], [2m, m, m], [m, m, m, m]].

* In the case m = 1 we look at set partitions of {1, 2, 3, 4} with sizes in  [[4], [3, 1], [2, 2], [2, 1, 1], [1, 1, 1, 1]] which gives rise to [1, 4, 3, 6, 1] with sum 15.

* In the case m = 2 we look at set partitions of {1, 2, .., 8} with sizes in [[8], [6, 2], [4, 4], [4, 2, 2], [2, 2, 2, 2]] which gives rise to [1, 28, 35, 210, 105] with sum 379.

* In the case m = 0 we look at set partitions of {} with sizes in [[0], [0, 0], [0, 0], [0, 0, 0], [0, 0, 0, 0]] which gives rise to [1, 1, 1, 1, 1] with sum 5 (because the only partition of the empty set is the set that contains the empty set, thus from the definition T(0,4) = Sum_{S(0)} card({0}) = A000041(4) = 5).

* If n runs through 0, 1, 2,... then the result is an irregular triangle in which the n-th row lists multinomials for partitions of [m*n] which have only parts which are multiples of m. These are the triangles A080575 (m = 1), A257490 (m = 2), A327003 (m = 3), A327004 (m = 4). In the case m = 0 the triangle is A000012 subdivided into rows of length A000041. See the  references below how this case integrates into the full picture.

| type  | m = 0 | m = 1 | m = 2 | m = 3 | m = 4 |
|-------|-------|-------|-------|-------|-------|
| by shape | [A000012](https://oeis.org/A000012) | [A036040](https://oeis.org/A036040) | [A257490](https://oeis.org/A257490) | [A327003](https://oeis.org/A327003) | [A327004](https://oeis.org/A327004) |
| by length | [A008284](https://oeis.org/A008284) | [A048993](https://oeis.org/A048993) | [A156289](https://oeis.org/A156289) | [A291451](https://oeis.org/A291451) | [A291452](https://oeis.org/A291452) |
| diagonal | [A000012](https://oeis.org/A000012) | [A000012](https://oeis.org/A000012) | [A001147](https://oeis.org/A001147) | [A025035](https://oeis.org/A025035) | [A025036](https://oeis.org/A025036) |
| row sum | [A000041](https://oeis.org/A000041) | [A000110](https://oeis.org/A000110) | [A005046](https://oeis.org/A005046) | [A291973](https://oeis.org/A291973) | [A291975](https://oeis.org/A291975) |
| alt row sum | [A081362](https://oeis.org/A081362) | [A000587](https://oeis.org/A000587) | [A260884](https://oeis.org/A260884) | [A291974](https://oeis.org/A291974) | [A291976](https://oeis.org/A291976) |
| central | [A000041](https://oeis.org/A000041) | [A007820](https://oeis.org/A007820) | [A327416](https://oeis.org/A327416) | [A327417](https://oeis.org/A327417) | [A327418](https://oeis.org/A327418) |

See also [A260876](https://oeis.org/A260876).
"""
const ModuleSetPartitionsMType = ""

"""

Return the polynomial where the coefficients are the number of ordered set partitions of an ``n``-set with shape type ``m``.
"""
function OrderedSetPolynomials(m::Int, n::Int)
    R, x = PolynomialRing(ZZ, "x")
    function recP(m, n)
        n == 0 && return R(1)
        haskey(CacheP, (m, n)) && return CacheP[(m, n)]
        p = sum(binom(m * n, m * k) * recP(m, n - k) * x for k in 1:n)
        CacheP[(m, n)] = p
    end
    recP(m, n)
end
const CacheP = Dict{Tuple{Int,Int},Nemo.fmpz_poly}()

"""

Return the number of ordered set partitions of an ``n``-set with shape type ``m``.
"""
OrderedSetPartitions(m::Int, n::Int) = Coeffs(OrderedSetPolynomials(m, n))

"""

Return the polynomial where the coefficients are the number of the ordered set partitions of an ``n``-set with shape type ``0``.
# Examples
```julia-repl
julia> P097805(3)
Nemo.fmpz_poly
x^3 + 2*x^2 + x
```
"""
P097805(n) = OrderedSetPolynomials(0, n)

"""

Return the number of ordered set partitions of an ``n``-set which are of shape type ``0``.
# Examples
```julia-repl
julia> L097805(3)
4-element Array{Nemo.fmpz,1}:
[0, 1, 2, 1]
```
"""
L097805(n) = Coeffs(OrderedSetPolynomials(0, n))

"""

Return the first ``len`` rows of the triangle of compositions of ``n``.
# Examples
```julia-repl
julia> TL097805(3, 5)
5-element Array{Array{Nemo.fmpz,1},1}:
[1]
[0, 1]
[0, 1, 1]
[0, 1, 2, 1]
[0, 1, 3, 3, 1]
```
"""
TL097805(n, len) = Coeffs(n -> OrderedSetPolynomials(0, n), len)

"""

Return the polynomial where the coefficients are the number of the ordered set partitions of an ``n``-set which are of shape type ``1``.
# Examples
```julia-repl
julia> P131689(3)
6*x^3 + 6*x^2 + x
```
"""
P131689(n) = OrderedSetPolynomials(1, n)

"""

Return the number of ordered set partitions of an ``n``-set which are of shape type ``1``.
# Examples
```julia-repl
julia> L131689(3)
4-element Array{Nemo.fmpz,1}:
[0, 1, 6, 6]
```
"""
L131689(n) = Coeffs(OrderedSetPolynomials(1, n))

"""

Return ``len`` rows of the triangle of ordered set partitions of ``n``.
# Examples
```julia-repl
julia> TL131689(3, 5)
5-element Array{Array{Nemo.fmpz,1},1}:
[1]
[0, 1]
[0, 1, 2]
[0, 1, 6, 6]
[0, 1, 14, 36, 24]
```
"""
TL131689(n, len) = Coeffs(n -> OrderedSetPolynomials(1, n), len)

"""

Return the n-th ordered set polynomials of shape type ``2``.
# Examples
```julia-repl
julia> P131689(3)
90*x^3 + 30*x^2 + x
```
"""
P241171(n) = OrderedSetPolynomials(2, n)

"""

Return the number of ordered set partitions of a ``2n`` set into even sized blocks (as a list).
# Examples
```julia-repl
julia> L241171(3)
4-element Array{Nemo.fmpz,1}:
[0, 1, 30, 90]
```
"""
L241171(n) = Coeffs(OrderedSetPolynomials(2, n))

"""

Return ``len`` rows of the triangle ordered set partitions of a ``2n`` set into even sized blocks.
# Examples
```julia-repl
julia> TL241171(3, 5)
5-element Array{Array{Nemo.fmpz,1},1}:
[1]
[0, 1]
[0, 1, 6]
[0, 1, 30, 90]
[0, 1, 126, 1260, 2520]
```
"""
TL241171(n, len) = Coeffs(n -> OrderedSetPolynomials(2, n), len)

"""

Return the n-th ordered set polynomials of shape type ``3``.
# Examples
```julia-repl
julia> P278073(3)
1680*x^3 + 168*x^2 + x
```
"""
P278073(n) = OrderedSetPolynomials(3, n)

"""

Return the number of ordered set partitions of a ``3n`` set into 3-sized blocks (as a list).
# Examples
```julia-repl
julia> L278073(3)
4-element Array{Nemo.fmpz,1}:
[0, 1, 168, 1680]
```
"""
L278073(n) = Coeffs(OrderedSetPolynomials(3, n))

"""

Return ``len`` rows of the triangle ordered set partitions of a ``3n`` set into 3-sized blocks.
# Examples
```julia-repl
julia> TL278073(3, 5)
5-element Array{Array{Nemo.fmpz,1},1}:
[1]
[0, 1]
[0, 1, 20]
[0, 1, 168, 1680]
[0, 1, 1364, 55440, 369600]
```
"""
TL278073(n, len) = Coeffs(n -> OrderedSetPolynomials(3, n), len)

"""

Return the n-th ordered set polynomials of shape type ``4``.
# Examples
```julia-repl
julia> P278074(3)
34650*x^3 + 990*x^2 + x
```
"""
P278074(n) = OrderedSetPolynomials(4, n)

"""

Return the number of ordered set partitions of a ``4n`` set into 4-sized blocks (as a list).
# Examples
```julia-repl
julia> L278074(3)
4-element Array{Nemo.fmpz,1}:
[0, 1, 990, 34650]
```
"""
L278074(n) = Coeffs(OrderedSetPolynomials(4, n))

"""

Return ``len`` rows of the triangle ordered set partitions of a ``4n`` set into 4-sized blocks.
# Examples
```julia-repl
julia> TL278074(3, 5)
5-element Array{Array{Nemo.fmpz,1},1}:
[1]
[0, 1]
[0, 1, 70]
[0, 1, 990, 34650]
[0, 1, 16510, 2702700, 63063000]
```
"""
TL278074(n, len) = Coeffs(n -> OrderedSetPolynomials(4, n), len)

"""

Return the central column of the triangle of the ordered set partitions of shape type ``0``.
# Examples
```julia-repl
julia> L088218(6)
6-element Array{Nemo.fmpz,1}:
[1, 1, 3, 10, 35, 126]
```
"""
L088218(len) = Central(n -> OrderedSetPolynomials(0, n), len)
"""

Return the central column of the triangle of the ordered set partitions of shape type ``1``.
# Examples
```julia-repl
julia> L210029(6)
6-element Array{Nemo.fmpz,1}:
[1, 1, 14, 540, 40824, 5103000]
```
"""
L210029(len) = Central(n -> OrderedSetPolynomials(1, n), len)
"""

Return the central column of the triangle of the ordered set partitions of shape type ``2``.
# Examples
```julia-repl
julia> L281478(6)
6-element Array{Nemo.fmpz,1}:
[1, 1, 126, 126720, 494053560, 5283068427000]
```
"""
L281478(len) = Central(n -> OrderedSetPolynomials(2, n), len)
"""

Return the central column of the triangle of the ordered set partitions of shape type ``3``.
# Examples
```julia-repl
julia> L281479(6)
6-element Array{Nemo.fmpz,1}:
[1, 1, 1364, 42771456, 10298900437056, 11287986820196486400]
```
"""
L281479(len) = Central(n -> OrderedSetPolynomials(3, n), len)
"""

Return the central column of the triangle of the ordered set partitions of shape type ``4``.
# Examples
```julia-repl
julia> L281480(5)
5-element Array{Nemo.fmpz,1}:
[1, 1, 16510, 17651304000, 286988816206755000]
```
"""
L281480(len) = Central(n -> OrderedSetPolynomials(4, n), len)

"""

Return the number of the ordered set partitions of shape type ``2``.
# Examples
```julia-repl
julia> L094088(5)
5-element Array{Nemo.fmpz,1}:
[1, 1, 7, 121, 3907, 202741]
```
"""
L094088(len) = CoeffSum(n -> OrderedSetPolynomials(2, n), len)

"""

Return the number of the ordered set partitions of shape type ``3``.
# Examples
```julia-repl
julia> L243664(5)
5-element Array{Nemo.fmpz,1}:
[1, 1, 21, 1849, 426405]
```
"""
L243664(len) = CoeffSum(n -> OrderedSetPolynomials(3, n), len)
"""

Return the number of the ordered set partitions of shape type ``4``.
# Examples
```julia-repl
julia> L243665(5)
5-element Array{Nemo.fmpz,1}:
[1, 1, 71, 35641, 65782211]
```
"""
L243665(len) = CoeffSum(n -> OrderedSetPolynomials(4, n), len)

"""

Return the alternating row sums of the ordered set polynomials of shape type ``2``.
# Examples
```julia-repl
julia> L028296(7)
7-element Array{Nemo.fmpz,1}:
[1, -1, 5, -61, 1385, -50521, 2702765]
```
"""
L028296(len) = CoeffAltSum(n -> OrderedSetPolynomials(2, n), len)

"""

Return the alternating row sums of the ordered set polynomials of shape type ``3``.
# Examples
```julia-repl
julia> L002115(7)
7-element Array{Nemo.fmpz,1}:
[1, -1, 19, -1513, 315523, -136085041, 105261234643]
```
"""
L002115(len) = CoeffAltSum(n -> OrderedSetPolynomials(3, n), len)

"""

Return the alternating row sums of the ordered set polynomials of shape type ``4``.
# Examples
```julia-repl
julia> L211212(6)
6-element Array{Nemo.fmpz,1}:
[1, -1, 69, -33661, 60376809, -288294050521]
```
"""
L211212(len) = CoeffAltSum(n -> OrderedSetPolynomials(4, n), len)

# ------------------------------------------------------

#"""
# Return the Stirling numbers of 2nd kind.
# Exported from Module StirlingLahNumbers
#"""
# L048993(n) = CoeffExp(OrderedSetPolynomials(1, n))

"""

Return the n-th complementary Bell number.
# Examples
```julia-repl
julia> V000587(50)
-29113173035759403920216141265491160286912
```
"""
V000587(n) = sum(AltEgfCoeffs(OrderedSetPolynomials(1, n)))

"""

Return a list of complementary Bell numbers of length ``len``.
# Examples
```julia-repl
julia> L000587(10)
10-element Array{Nemo.fmpz,1}:
[1, -1, 0, 1, 1, -2, -9, -9, 50, 267]
```
"""
L000587(len) = [V000587(n) for n in 0:len-1]

"""

Return the number of end rhyme patterns of a poem of an even number of lines.
# Examples
```julia-repl
julia> L156289(6)
7-element Array{Nemo.fmpz,1}:
[ 0, 1, 1023, 21120, 65835, 51975, 10395]
```
"""
L156289(n) = EgfCoeffs(OrderedSetPolynomials(2, n))

"""

Return the number of partitions of a ``2n``-set into even blocks.
# Examples
```julia-repl
julia> V005046(30)
5215270659830794008813481789355446576694940667184287549
```
"""
V005046(n) = sum(EgfCoeffs(OrderedSetPolynomials(2, n)))

"""

Return a list of the number of partitions of even sized sets into even blocks.
# Examples
```julia-repl
julia> L005046(10)
10-element Array{Nemo.fmpz,1}:
[ 1, 1, 4, 31, 379, 6556, 150349, 4373461, 156297964, 6698486371]
```
"""
L005046(len) = [V005046(n) for n in 0:len-1]

"""

Return the number of set partitions of a 2n-set into even blocks which have even length minus the number of partitions into even blocks which have odd length.
# Examples
```julia-repl
julia> V260884(19)
5097857816569586800024019
```
"""
V260884(n) = sum(AltEgfCoeffs(OrderedSetPolynomials(2, n)))

"""

Return a list of the first ``len`` terms V260884(n).
# Examples
```julia-repl
julia> L260884(10)
10-element Array{Nemo.fmpz,1}:
[1, -1, 2, -1, -43, 254, 4157, -70981, -1310398, 40933619]
```
"""
L260884(len) = [V260884(n) for n in 0:len-1]

"""

Return the number of set partitions of type 3.
# Examples
```julia-repl
julia> L291451(10)
7-element Array{Nemo.fmpz,1}:
[0, 1, 43690, 7128576, 99379280, 285885600, 190590400]
```
"""
L291451(n) = EgfCoeffs(OrderedSetPolynomials(3, n))

"""

(3n)! [z^(3n)] exp(exp(z)/3 + 2exp(-z/2)cos(z sqrt(3)/2)/3 - 1).
# Examples
```julia-repl
julia> V291973(9)
31728742163212641
```
"""
V291973(n) = sum(EgfCoeffs(OrderedSetPolynomials(3, n)))

"""

# Examples
```julia-repl
julia> L291973(6)
6-element Array{Nemo.fmpz,1}:
[1, 1, 11, 365, 25323, 3068521]
```
"""
L291973(len) = [V291973(n) for n in 0:len-1]

"""

(3n)! [z^(3n)] exp(-(exp(z)/3 + 2exp(-z/2) cos(z sqrt(3)/2)/3 - 1)).
# Examples
```julia-repl
julia> V291974(9)
-3166484321001
```
"""
V291974(n) = sum(AltEgfCoeffs(OrderedSetPolynomials(3, n)))

"""

# Examples
```julia-repl
julia> L291974(6)
6-element Array{Nemo.fmpz,1}:
[1, -1, 9, -197, 6841, -254801]
```
"""
L291974(len) = [V291974(n) for n in 0:len-1]

"""

exp(x (cos(z) + cosh(z) - 2)/2)
# Examples
```julia-repl
L291452(6)
7-element Array{Nemo.fmpz,1}:
[0, 1, 2098175, 2941884000, 181262956875, 1932541986375, 4509264634875]
```
"""
L291452(n) = EgfCoeffs(OrderedSetPolynomials(4, n))

"""

Return ordered the number of set partitions of type 3.
# Examples
```julia-repl
julia> V291975(9)
926848347928901638652131
```
"""
V291975(n) = sum(EgfCoeffs(OrderedSetPolynomials(4, n)))

"""

# Examples
```julia-repl
L291975(5)
5-element Array{Nemo.fmpz,1}:
[1, 1, 36, 6271, 3086331]
```
"""
L291975(len) = [V291975(n) for n in 0:len-1]

"""

Return ordered the number of set partitions of type 4.
# Examples
```julia-repl
julia> V291976(7)
-6440372006517541
```
"""
V291976(n) = sum(AltEgfCoeffs(OrderedSetPolynomials(4, n)))

"""

# Examples
```julia-repl
L291976(7)
7-element Array{Nemo.fmpz,1}:
[ 1, -1, 34, -5281, 2185429, -1854147586, 2755045819549]
```
"""
L291976(len) = [V291976(n) for n in 0:len-1]

"""

# Examples
```julia-repl
L014606(7)
7-element Array{Nemo.fmpz,1}:
[1, 1, 20, 1680, 369600, 168168000, 137225088000]
```
"""
L014606(len) = Diagonal(n -> OrderedSetPolynomials(3, n), len)



#START-TEST-########################################################

using Test, SeqTests, SeqUtils

function test()

    @testset "OrderedSetPolynomialsitionsMType" begin
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
    end

    @testset "SetPartitionsMType" begin
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
        Coeffs(OrderedSetPolynomials(m, n)) |> Println
    end
    for m in 1:4, n in 0:6
        EgfCoeffs(OrderedSetPolynomials(m, n)) |> Println
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
