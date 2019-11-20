# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module OrderedSetPartitionsTypeM

using Nemo, Polynomials, GeneralizedBinomial, DataStructures, Products
using Setpartitions, IntPartitions

export ModuleOrderedSetPartitionsTypeM, OrderedSetPolynomials, OrderedSetPartitions
export ShapePartitions, OrderedShapePartitions, CardinalityOfShapePartitions
export P097805, P131689, P241171, P278073, P278074
export L278073, L278074, L241171, L088218, T131689

# by shape
export A178803, A133314, A327022, A327023, A327024
# by length
export A318144, L131689, T241171, T278073, T278074
# diagonal
export A000142, A000142, A000680, L014606, A014608
# row sum
export A101880, A000670, L094088, L243664, L243665
# alt row sum
export A260845, A033999, L028296, L002115, L211212
# central
export A053529, L210029, L281478, L281479, L281480

## Ordered set partitions of m-type
"""

| type | m = 0 | m = 1 | m = 2 | m = 3 | m = 4 |
|------|-------|-------|-------|-------|-------|
| by shape | [A178803](https://oeis.org/A178803) | [A133314](https://oeis.org/A133314) | [A327022](https://oeis.org/A327022) | [A327023](https://oeis.org/A327023) | [A327024](https://oeis.org/A327024) |
| by length | [A318144](https://oeis.org/A318144) | [A131689](https://oeis.org/A131689) | [A241171](https://oeis.org/A241171) | [A278073](https://oeis.org/A278073) | [A278074](https://oeis.org/A278074) |
| diagonal | [A000142](https://oeis.org/A000142) | [A000142](https://oeis.org/A000142) | [A000680](https://oeis.org/A000680) | [A014606](https://oeis.org/A014606) | [A014608](https://oeis.org/A014608) |
| row sum | [A101880](https://oeis.org/A101880) | [A000670](https://oeis.org/A000670) | [A094088](https://oeis.org/A094088) | [A243664](https://oeis.org/A243664) | [A243665](https://oeis.org/A243665) |
| alt row sum | [A260845](https://oeis.org/A260845) | [A033999](https://oeis.org/A033999) | [A028296](https://oeis.org/A028296) | [A002115](https://oeis.org/A002115) | [A211212](https://oeis.org/A211212) |
| central | [A053529](https://oeis.org/A053529) | [A210029](https://oeis.org/A210029) | [A281478](https://oeis.org/A281478) | [A281479](https://oeis.org/A281479) | [A281480](https://oeis.org/A281480) |
"""
const ModuleOrderedSetPartitionsTypeM = ""

#const CacheP = Dict{Tuple{Int,Int}, Nemo.fmpz_poly}()
"""

Return the polynomial where the coefficients are the number of ordered set partitions of an ``n``-set with shape type ``m``.
"""
function OrderedSetPolynomials(m::Int, n::Int)
    CacheP = Dict{Tuple{Int,Int}, Nemo.fmpz_poly}()
    R, x = PolynomialRing(ZZ, "x")
    function recP(m, n)
        n == 0 && return R(1)
        haskey(CacheP, (m, n)) && return CacheP[(m, n)]
        p = sum(binom(m * n, m * k) * recP(m, n - k) * x for k ∈ 1:n)
        CacheP[(m, n)] = p
        sum(binom(m * n, m * k) * recP(m, n - k) * x for k ∈ 1:n)
    end
    recP(m, n)
end

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
julia> T131689(3, 5)
5-element Array{Array{Nemo.fmpz,1},1}:
[1]
[0, 1]
[0, 1, 2]
[0, 1, 6, 6]
[0, 1, 14, 36, 24]
```
"""
T131689(n, len) = Coeffs(n -> OrderedSetPolynomials(1, n), len)

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
julia> T241171(3, 5)
5-element Array{Array{Nemo.fmpz,1},1}:
[1]
[0, 1]
[0, 1, 6]
[0, 1, 30, 90]
[0, 1, 126, 1260, 2520]
```
"""
T241171(n, len) = Coeffs(n -> OrderedSetPolynomials(2, n), len)

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
julia> T278073(3, 5)
5-element Array{Array{Nemo.fmpz,1},1}:
[1]
[0, 1]
[0, 1, 20]
[0, 1, 168, 1680]
[0, 1, 1364, 55440, 369600]
```
"""
T278073(n, len) = Coeffs(n -> OrderedSetPolynomials(3, n), len)

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
julia> T278074(3, 5)
5-element Array{Array{Nemo.fmpz,1},1}:
[1]
[0, 1]
[0, 1, 70]
[0, 1, 990, 34650]
[0, 1, 16510, 2702700, 63063000]
```
"""
T278074(n, len) = Coeffs(n -> OrderedSetPolynomials(4, n), len)

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

# ------------------ shapes ----------------------------------

"""

Return the number of set partitions with a given shape.
# Examples
```julia-repl
julia> CardinalityOfShapePartitions([3, 3, 3, 2, 2])
600600
```
"""
function CardinalityOfShapePartitions(Shape)
    Shape == [] && return ZZ(1)
    M = Multinomial(Shape)
    R = values(counter(Shape))
    P =  ∏([fac(s) for s ∈ R])
    div(M, P)
end

"""

--
"""
function ShapePartitions(m, n, k)
    shapes = (map(x -> x*m, p) for p ∈ IntegerPartitions(n, k))
    isempty(shapes) && return [fmpz(0)]
    return [CardinalityOfShapePartitions(s) for s ∈ shapes]
end

"""

--
"""
function ShapePartitions(m, n)
    reduce(vcat, [ShapePartitions(m, n, k) for k ∈ 0:n])
end

"""

--
"""
function CardinalityOfOrderedShapePartitions(Shape)
    Shape == [] && return ZZ(1)
    M = Multinomial(Shape)*F!(length(Shape))
    R = values(counter(Shape))
    P = ∏([F!(s) for s ∈ R])
    div(M, P)
end

"""

--
"""
function OrderedShapePartitions(m, n, k)
    shapes = (map(x -> x*m, p) for p ∈ IntegerPartitions(n, k))
    isempty(shapes) && return [fmpz(0)]
    return [CardinalityOfOrderedShapePartitions(s) for s ∈ shapes]
end

"""

--
"""
function OrderedShapePartitions(m, n)
    reduce(vcat, [OrderedShapePartitions(m, n, k) for k ∈ 0:n])
end

#"""
# Examples
#```julia-repl
#for n in 0:5 OrderedShapePartitions(0, n) |> Println end
#[1]
#[0, 1]
#[0, 1, 1]
#[0, 1, 1, 1]
#[0, 1, 1, 1, 1, 1]
#[0, 1, 1, 1, 1, 1, 1, 1]
#```
#"""
# ERROR A123110(n) = OrderedShapePartitions(0, n)


"""

Return the number of set partitions of ``n`` with block sizes given by the ``k``-th integer partition of ``n`` when the integer partitions are sorted in Hindenburg order. This is row ``n`` of the triangle of multinomial coefficients.
# Examples
```julia-repl
for n in 0:5 OrderedShapePartitions(1, n) |> Println end
[1]
[0, 1]
[0, 1, 2]
[0, 1, 6, 6]
[0, 1, 8, 6, 36, 24]
[0, 1, 10, 20, 60, 90, 240, 120]
```
"""
L049019(n) = OrderedShapePartitions(1, n)

"""

Return the number of set partitions of ``2n`` with block sizes given by the even parts of integer partition of ``2n`` when the integer partitions are sorted in Hindenburg order.
# Examples
```julia-repl
for n in 0:5 OrderedShapePartitions(2, n) |> Println end
[1]
[0, 1]
[0, 1, 6]
[0, 1, 30, 90]
[0, 1, 56, 70, 1260, 2520]
[0, 1, 90, 420, 3780, 9450, 75600, 113400]
```
"""
L327022(n) = OrderedShapePartitions(2, n)

"""

Return the number of set partitions of ``3n`` with block sizes given by the parts of integer partition of ``3n`` which are multiples of 3 and when the integer partitions are sorted in Hindenburg order.
# Examples
```julia-repl
for n in 0:5 OrderedShapePartitions(3, n) |> Println end
[1]
[0, 1]
[0, 1, 20]
[0, 1, 168, 1680]
[0, 1, 440, 924, 55440, 369600]
[0, 1, 910, 10010, 300300, 1261260, 33633600, 168168000]
```
"""
L327023(n) = OrderedShapePartitions(3, n)

"""

Return the number of set partitions of ``4n`` with block sizes given by the parts of integer partition of ``4n`` which are multiples of 4 and when the integer partitions are sorted in Hindenburg order.
# Examples
```julia-repl
for n in 0:5 OrderedShapePartitions(4, n) |> Println end
8-element Array{Nemo.fmpz,1}:
[1]
[0, 1]
[0, 1, 70]
[0, 1, 990, 34650]
[0, 1, 3640, 12870, 2702700, 63063000]
[0, 1, 9690, 251940, 26453700, 187065450, 17459442000, 305540235000]
```
"""
L327024(n) = OrderedShapePartitions(4, n)


#START-TEST-########################################################

using Test, SeqTests, SeqUtils

function test()

    @testset "OrdSetPolyMType" begin
        @test string(P097805(3)) == "x^3+2*x^2+x"

        @test string(P131689(4)) == "24*x^4+36*x^3+14*x^2+x"
        @test L131689(4) == [0, 1, 14, 36, 24]
        @test T131689(4, 5) == [[1], [0, 1], [0, 1, 2], [0, 1, 6, 6], [0, 1, 14, 36, 24]]

        @test string(P241171(4)) == "2520*x^4+1260*x^3+126*x^2+x"
        @test L241171(4) == [0, 1, 126, 1260, 2520]
        @test T241171(4, 4) == [[1], [0, 1], [0, 1, 6], [0, 1, 30, 90]]

        @test string(P278073(5)) == "168168000*x^5+33633600*x^4+1561560*x^3+10920*x^2+x"
        @test L278073(5) == [0, 1, 10920, 1561560, 33633600, 168168000]
        @test T278073(5, 4) == [[1], [0, 1], [0, 1, 20], [0, 1, 168, 1680]]

        @test string(P278074(4)) == "63063000*x^4+2702700*x^3+16510*x^2+x"
        @test L278074(4) == [0, 1, 16510, 2702700, 63063000]
        @test T278074(4, 4) == [[1], [0, 1], [0, 1, 70], [0, 1, 990, 34650]]

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

    @testset "SetPartMType" begin

    end

    @testset "SetPartByShape" begin
        @test ShapePartitions(3, 4) == [0, 1, 220, 462, 9240, 15400]
    end
end

function demo()
    for m ∈ 1:4, n ∈ 0:6
        Coeffs(OrderedSetPolynomials(m, n)) |> Println
    end
    for m ∈ 1:4, n ∈ 0:6
        EgfCoeffs(OrderedSetPolynomials(m, n)) |> Println
    end

    CardinalityOfShapePartitions([3, 3, 3, 2, 2]) |> println
    for n ∈ 0:4
        [ShapePartitions(3, n, k) for k ∈ 0:n] |> println
    end

    for m ∈ 0:4
        println("\nOrderedSetPartitions m = $m")
        for n ∈ 0:6
            OrderedSetPartitions(m, n) |> Println
        end
    end

    for m ∈ 0:4
        println("\nOrderedShapePartitions m = $m")
        for n ∈ 0:6
            OrderedShapePartitions(m, n) |> Println
        end
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

#=
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
julia> T097805(3, 5)
5-element Array{Array{Nemo.fmpz,1},1}:
[1]
[0, 1]
[0, 1, 1]
[0, 1, 2, 1]
[0, 1, 3, 3, 1]
```
"""
T097805(n, len) = Coeffs(n -> OrderedSetPolynomials(0, n), len)

=#

#=

('--', 0, '---------------------')

by Shape    Amissing

[0] [1]
[1] [0, 1]
[2] [0, 1, 1]
[3] [0, 1, 1, 1]
[4] [0, 1, 1, 1, 1, 1]
[5] [0, 1, 1, 1, 1, 1, 1, 1]
[6] [0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

[1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1]

by Length   A008284
[0] [1]
[1] [0, 1]
[2] [0, 1, 1]
[3] [0, 1, 1, 1]
[4] [0, 1, 2, 1, 1]
[5] [0, 1, 2, 2, 1, 1]
[6] [0, 1, 3, 3, 2, 1, 1]

[1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 2, 1, 1, 0, 1, 2, 2, 1, 1]

RowSum      A000041 [1, 1, 2, 3, 5, 7, 11]
AlterRowSum A081362 [1, -1, 0, -1, 1, -1, 1]
Diagonal    A000012 [1, 1, 1, 1, 1, 1, 1]
Central     A000041 [1, 1, 2, 3, 5, 7]


('--', 1, '---------------------')

by Shape    A036040
[0] [1]
[1] [1]
[2] [1, 1]
[3] [1, 3, 1]
[4] [1, 4, 3, 6, 1]
[5] [1, 5, 10, 10, 15, 10, 1]
[6] [1, 6, 15, 10, 15, 60, 15, 20, 45, 15, 1]

[1, 1, 1, 1, 1, 3, 1, 1, 4, 3, 6, 1]

by Length   A048993
[0] [1]
[1] [0, 1]
[2] [0, 1, 1]
[3] [0, 1, 3, 1]
[4] [0, 1, 7, 6, 1]
[5] [0, 1, 15, 25, 10, 1]
[6] [0, 1, 31, 90, 65, 15, 1]

by Recur/k!
[0] [1]
[1] [0, 1]
[2] [0, 1, 1]
[3] [0, 1, 3, 1]
[4] [0, 1, 7, 6, 1]
[5] [0, 1, 15, 25, 10, 1]
[6] [0, 1, 31, 90, 65, 15, 1]

by Recurrence
[0] [1]
[1] [0, 1]
[2] [0, 1, 2]
[3] [0, 1, 6, 6]
[4] [0, 1, 14, 36, 24]
[5] [0, 1, 30, 150, 240, 120]
[6] [0, 1, 62, 540, 1560, 1800, 720]

[1, 0, 1, 0, 1, 1, 0, 1, 3, 1, 0, 1, 7, 6, 1, 0, 1, 15, 25, 10, 1]

RowSum      A000110 [1, 1, 2, 5, 15, 52, 203]
AlterRowSum A000587 [1, -1, 0, 1, 1, -2, -9]
Diagonal    A000012 [1, 1, 1, 1, 1, 1, 1]
Central     A007820 [1, 1, 7, 90, 1701, 42525]


('--', 2, '---------------------')

by Shape    A257490
[0] [1]
[1] [1]
[2] [1, 3]
[3] [1, 15, 15]
[4] [1, 28, 35, 210, 105]
[5] [1, 45, 210, 630, 1575, 3150, 945]
[6] [1, 66, 495, 462, 1485, 13860, 5775, 13860, 51975, 51975, 10395]

[1, 1, 1, 3, 1, 15, 15, 1, 28, 35, 210, 105]

by Length   A156289
[0] [1]
[1] [0, 1]
[2] [0, 1, 3]
[3] [0, 1, 15, 15]
[4] [0, 1, 63, 210, 105]
[5] [0, 1, 255, 2205, 3150, 945]
[6] [0, 1, 1023, 21120, 65835, 51975, 10395]

by Recur/k!
[0] [1]
[1] [0, 1]
[2] [0, 1, 3]
[3] [0, 1, 15, 15]
[4] [0, 1, 63, 210, 105]
[5] [0, 1, 255, 2205, 3150, 945]
[6] [0, 1, 1023, 21120, 65835, 51975, 10395]

by Recurrence
[0] [1]
[1] [0, 1]
[2] [0, 1, 6]
[3] [0, 1, 30, 90]
[4] [0, 1, 126, 1260, 2520]
[5] [0, 1, 510, 13230, 75600, 113400]
[6] [0, 1, 2046, 126720, 1580040, 6237000, 7484400]

[1, 0, 1, 0, 1, 3, 0, 1, 15, 15, 0, 1, 63, 210, 105, 0, 1, 255, 2205, 3150, 945]

RowSum      A005046 [1, 1, 4, 31, 379, 6556, 150349]
AlterRowSum A260884 [1, -1, 2, -1, -43, 254, 4157]
Diagonal    A001147 [1, 1, 3, 15, 105, 945, 10395]
Central     A327416 [1, 1, 63, 21120, 20585565, 44025570225]


('--', 3, '---------------------')

by Shape    A327003
[0] [1]
[1] [1]
[2] [1, 10]
[3] [1, 84, 280]
[4] [1, 220, 462, 9240, 15400]
[5] [1, 455, 5005, 50050, 210210, 1401400, 1401400]
[6] [1, 816, 18564, 24310, 185640, 4084080, 2858856, 13613600, 85765680, 285885600, 190590400]

[1, 1, 1, 10, 1, 84, 280, 1, 220, 462, 9240, 15400]

by Length   A291451
[0] [1]
[1] [0, 1]
[2] [0, 1, 10]
[3] [0, 1, 84, 280]
[4] [0, 1, 682, 9240, 15400]
[5] [0, 1, 5460, 260260, 1401400, 1401400]
[6] [0, 1, 43690, 7128576, 99379280, 285885600, 190590400]

by Recur/k!
[0] [1]
[1] [0, 1]
[2] [0, 1, 10]
[3] [0, 1, 84, 280]
[4] [0, 1, 682, 9240, 15400]
[5] [0, 1, 5460, 260260, 1401400, 1401400]
[6] [0, 1, 43690, 7128576, 99379280, 285885600, 190590400]

by Recurrence
[0] [1]
[1] [0, 1]
[2] [0, 1, 20]
[3] [0, 1, 168, 1680]
[4] [0, 1, 1364, 55440, 369600]
[5] [0, 1, 10920, 1561560, 33633600, 168168000]
[6] [0, 1, 87380, 42771456, 2385102720, 34306272000, 137225088000]

[1, 0, 1, 0, 1, 10, 0, 1, 84, 280, 0, 1, 682, 9240, 15400, 0, 1, 5460, 260260, 1401400, 1401400]

RowSum      A291973 [1, 1, 11, 365, 25323, 3068521, 583027547]
AlterRowSum A291974 [1, -1, 9, -197, 6841, -254801, -3000807]
Diagonal    A025035 [1, 1, 10, 280, 15400, 1401400, 190590400]
Central     A327417 [1, 1, 682, 7128576, 429120851544, 94066556834970720]


('--', 4, '---------------------')

by Shape    A327004
[0] [1]
[1] [1]
[2] [1, 35]
[3] [1, 495, 5775]
[4] [1, 1820, 6435, 450450, 2627625]
[5] [1, 4845, 125970, 4408950, 31177575, 727476750, 2546168625]
[6] [1, 10626, 735471, 1352078, 25741485, 1338557220, 1577585295, 15616500900, 165646455975, 1932541986375, 4509264634875]

[1, 1, 1, 35, 1, 495, 5775, 1, 1820, 6435, 450450, 2627625]

by Length   A291452
[0] [1]
[1] [0, 1]
[2] [0, 1, 35]
[3] [0, 1, 495, 5775]
[4] [0, 1, 8255, 450450, 2627625]
[5] [0, 1, 130815, 35586525, 727476750, 2546168625]
[6] [0, 1, 2098175, 2941884000, 181262956875, 1932541986375, 4509264634875]

by Recur/k!
[0] [1]
[1] [0, 1]
[2] [0, 1, 35]
[3] [0, 1, 495, 5775]
[4] [0, 1, 8255, 450450, 2627625]
[5] [0, 1, 130815, 35586525, 727476750, 2546168625]
[6] [0, 1, 2098175, 2941884000, 181262956875, 1932541986375, 4509264634875]

by Recurrence
[0] [1]
[1] [0, 1]
[2] [0, 1, 70]
[3] [0, 1, 990, 34650]
[4] [0, 1, 16510, 2702700, 63063000]
[5] [0, 1, 261630, 213519150, 17459442000, 305540235000]
[6] [0, 1, 4196350, 17651304000, 4350310965000, 231905038365000, 3246670537110000]

[1, 0, 1, 0, 1, 35, 0, 1, 495, 5775, 0, 1, 8255, 450450, 2627625, 0, 1, 130815, 35586525, 727476750, 2546168625]

RowSum      A291975 [1, 1, 36, 6271, 3086331, 3309362716, 6626013560301]
AlterRowSum A291976 [1, -1, 34, -5281, 2185429, -1854147586, 2755045819549]
Diagonal    A025036 [1, 1, 35, 5775, 2627625, 2546168625, 4509264634875]
Central     A327418 [1, 1, 8255, 2941884000, 11957867341948125, 294040106448733743008625]

=#
