# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module SetPartitionsTypeM

using Nemo, IntPartitions, OrderedSetPartitionsTypeM, GeneralizedBinomial
using DataStructures, Products, Polynomials

export ModuleSetPartitionsOfTypeM
export ShapePartitionsOfTypeM, SetPartitionsOfTypeM
# by shape
export          L036040, L257490, L327003, L327004
# by length
export X008284,          L156289, L291451, L291452
# diagonal
export                   L001147, L025035, L025036
# row sum
export                   L005046, L291973, L291975
# alt row sum
export V153881, L000587, L260884, V291974, V291976
# central
export          L007820, L327416, L327417, L327418
# see also A260876.
export L014606, V291973, V291975, V005046, V260884, V000587, L291976, L291974

"""

For example consider the case n = 4. There are five integer partitions of 4:

* P = [[4], [3, 1], [2, 2], [2, 1, 1], [1, 1, 1, 1]]. The shapes are m times the parts of the integer partitions: S(m) = [[4m], [3m, m], [2m, 2m], [2m, m, m], [m, m, m, m]].

* In the case m = 1 we look at set partitions of {1, 2, 3, 4} with sizes ∈  [[4], [3, 1], [2, 2], [2, 1, 1], [1, 1, 1, 1]] which gives rise to [1, 4, 3, 6, 1] with sum 15.

* In the case m = 2 we look at set partitions of {1, 2, .., 8} with sizes ∈ [[8], [6, 2], [4, 4], [4, 2, 2], [2, 2, 2, 2]] which gives rise to [1, 28, 35, 210, 105] with sum 379.

* In the case m = 0 we look at set partitions of {} with sizes ∈ [[0], [0, 0], [0, 0], [0, 0, 0], [0, 0, 0, 0]] which gives rise to [1, 1, 1, 1, 1] with sum 5 (because the only partition of the empty set is the set that contains the empty set, thus from the definition T(0,4) = Sum_{S(0)} card({0}) = A000041(4) = 5).

* If n runs through 0, 1, 2,... then the result is an irregular triangle ∈ which the n-th row lists multinomials for partitions of [m*n] which have only parts which are multiples of m. These are the triangles A080575 (m = 1), A257490 (m = 2), A327003 (m = 3), A327004 (m = 4). In the case m = 0 the triangle is A000012 subdivided into rows of length A000041. See the  references below how this case integrates into the full picture.

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
const ModuleSetPartitionsTypeM = ""

"""
--
"""
function ShapePartitionsOfTypeM(m, n, k)
    shapes = (map(x -> x*m, p) for p ∈ IntegerPartitions(n, k))
    isempty(shapes) && return [ZZ(0)]
    return [CardinalityOfShapePartitions(s) for s ∈ shapes]
end

"""

Return the number of shape-partitions of type ``m`` of an ``mn``-set.
# Examples
```julia-repl
for n in 0:5 ShapePartitionsOfTypeM(2, n) |> Println end
[1]
[0, 1]
[0, 1, 3]
[0, 1, 15, 15]
[0, 1, 28, 35, 210, 105]
[0, 1, 45, 210, 630, 1575, 3150, 945]
```
"""
function ShapePartitionsOfTypeM(m, n)
    reduce(vcat, [ShapePartitionsOfTypeM(m, n, k) for k ∈ 0:n])
end


"""
Return the list of the number of set partitions of a ``m n`` set into k parts which are m-sized.
"""
function SetPartitionsOfTypeM(m, n)
    m == 0 && return [k == 1 ? 1 : 0 for k in 0:n]
    EgfCoeffs(OrderedSetPolynomials(m, n))
end


"""

Return the number of partitions of ``{1, 2, ..., mn}`` into sets of size ``m``.
"""
SetPartitionsOfSizeTypeM(m, len) = [SetPartitionsOfTypeM(m, n)[n+1] for n in 0:len-1]
# //This unnatural `n+1` (instead of the correct n) is due to the terrible birth defect that//
# //Messrs Bezanson, Edelman and Karpinski choosed to put Julia in the cradle.//

# A060540 T(n,k) = (n*k)!/(k!^n*n!), (n>=1, k>=1).
# the number of ways of dividing nk labeled items into n unlabeled boxes with k items in each box.


"""

Return the number of partitions of ``{1, 2, ..., 2n}`` into sets of size ``2``.
# Examples
```julia-repl
julia> L001147(7)
7-element Array{Nemo.fmpz,1}:
[1, 1, 3, 15, 105, 945, 10395]
```
"""
L001147(len) = SetPartitionsOfSizeTypeM(2, len)

"""

Return the number of partitions of ``{1, 2, ..., 3n}`` into sets of size ``3``.
# Examples
```julia-repl
julia> L025035(7)
7-element Array{Nemo.fmpz,1}:
[1, 1, 10, 280, 15400, 1401400, 190590400]
```
"""
L025035(len) = SetPartitionsOfSizeTypeM(3, len)

"""

Return the number of partitions of ``{1, 2, ..., 4n}`` into sets of size ``4``.
# Examples
```julia-repl
julia> L025036(7)
7-element Array{Nemo.fmpz,1}:
[1, 1, 35, 5775, 2627625, 2546168625, 4509264634875]
```
"""
L025036(len) = SetPartitionsOfSizeTypeM(4, len)


"""

Return the number of set partitions of a ``m n`` set into k parts which are m-sized.
"""
SetPartitionsOfTypeM(m, n, k) = SetPartitionsOfTypeM(m, n)[k+1]
# //This unnatural `k+1` (instead of the correct k) is due to the terrible birth defect that//
# //Messrs Bezanson, Edelman and Karpinski choosed to put Julia in the cradle.//


"""

Return the number of set partitions of ``n`` of type 0 ordered by length .
# Examples
```julia-repl
julia> L008284(10)
7-element Array{Nemo.fmpz,1}:
[0, 1, 43690, 7128576, 99379280, 285885600, 190590400]
```
"""
L008284(n) = SetPartitionsOfTypeM(0, n)

"""

Return the number of end rhyme patterns of a poem of an even number of lines.
# Examples
```julia-repl
julia> L156289(6)
7-element Array{Nemo.fmpz,1}:
[ 0, 1, 1023, 21120, 65835, 51975, 10395]
```
"""
L156289(n) = SetPartitionsOfTypeM(2, n)

"""

Return the number of set partitions of type 3.
# Examples
```julia-repl
julia> L291451(10)
7-element Array{Nemo.fmpz,1}:
[0, 1, 43690, 7128576, 99379280, 285885600, 190590400]
```
"""
L291451(n) = SetPartitionsOfTypeM(3, n)

"""

exp(x (cos(z) + cosh(z) - 2)/2)
# Examples
```julia-repl
L291452(6)
7-element Array{Nemo.fmpz,1}:
[0, 1, 2098175, 2941884000, 181262956875, 1932541986375, 4509264634875]
```
"""
L291452(n) = SetPartitionsOfTypeM(4, n)

"""

Return the number of partitions of a ``2n``-set into even blocks.
# Examples
```julia-repl
julia> V005046(30)
5215270659830794008813481789355446576694940667184287549
```
"""
V005046(n) = sum(SetPartitionsOfTypeM(2, n))

"""

Return a list of the number of partitions of even sized sets into even blocks.
# Examples
```julia-repl
julia> L005046(10)
10-element Array{Nemo.fmpz,1}:
[ 1, 1, 4, 31, 379, 6556, 150349, 4373461, 156297964, 6698486371]
```
"""
L005046(len) = [V005046(n) for n ∈ 0:len-1]

"""

(3n)! [z^(3n)] exp(exp(z)/3 + 2exp(-z/2)cos(z sqrt(3)/2)/3 - 1).
# Examples
```julia-repl
julia> V291973(9)
31728742163212641
```
"""
V291973(n) = sum(SetPartitionsOfTypeM(3, n))

"""

Return the n-th complementary Bell number.
# Examples
```julia-repl
julia> V000587(50)
-29113173035759403920216141265491160286912
```
"""
V000587(n) = sum(AltEgfCoeffs(OrderedSetPolynomials(1, n)))

SignedShapePartitions(m, n) = reduce(vcat, [(-1)^k*ShapePartitionsOfTypeM(m, n, k) for k ∈ 0:n])

V153881(n) = sum(SignedShapePartitions(0, n))

"""

Return a list of complementary Bell numbers of length ``len``.
# Examples
```julia-repl
julia> L000587(10)
10-element Array{Nemo.fmpz,1}:
[1, -1, 0, 1, 1, -2, -9, -9, 50, 267]
```
"""
L000587(len) = [V000587(n) for n ∈ 0:len-1]


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
L260884(len) = [V260884(n) for n ∈ 0:len-1]

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
L291974(len) = [V291974(n) for n ∈ 0:len-1]


"""

Return ordered the number of set partitions of type 3.
# Examples
```julia-repl
julia> V291975(9)
926848347928901638652131
```
"""
V291975(n) = sum(SetPartitionsOfTypeM(4, n))

"""

# Examples
```julia-repl
L291975(5)
5-element Array{Nemo.fmpz,1}:
[1, 1, 36, 6271, 3086331]
```
"""
L291975(len) = [V291975(n) for n ∈ 0:len-1]

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
L291976(len) = [V291976(n) for n ∈ 0:len-1]

"""

# Examples
```julia-repl
L014606(7)
7-element Array{Nemo.fmpz,1}:
[1, 1, 20, 1680, 369600, 168168000, 137225088000]
```
"""
L014606(len) = Diagonal(n -> OrderedSetPolynomials(3, n), len)


"""

# Examples
```julia-repl
julia> L291973(6)
6-element Array{Nemo.fmpz,1}:
[1, 1, 11, 365, 25323, 3068521]
```
"""
L291973(len) = [V291973(n) for n ∈ 0:len-1]

"""
Return ???
# Examples
```julia-repl
for n in 0:5 SetPartitionsOfTypeM(0, n) |> Println end
[1]
[0, 1]
[0, 1, 0]
[0, 1, 0, 0]
[0, 1, 0, 0, 0]
[0, 1, 0, 0, 0, 0]
```
"""
Lnix(n) = SetPartitionsOfTypeM(0, n)

"""

Return the number of set partitions of ``n`` with block sizes given by the ``k``-th integer partition of ``n`` when the integer partitions are sorted in Hindenburg order. This is row ``n`` of the triangle of multinomial coefficients.
# Examples
```julia-repl
for n in 0:5 SetPartitionsOfTypeM(1, n) |> Println end
[1]
[0, 1]
[0, 1, 1]
[0, 1, 3, 1]
[0, 1, 7, 6, 1]
[0, 1, 15, 25, 10, 1]
```
"""
L036040(n) = SetPartitionsOfTypeM(1, n)

"""

Return the number of set partitions of ``2n`` with block sizes given by the even parts of integer partition of ``2n`` when the integer partitions are sorted in Hindenburg order.
# Examples
```julia-repl
for n in 0:5 SetPartitionsOfTypeM(2, n) |> Println end
[1]
[0, 1, 3]
[0, 1, 15, 15]
[0, 1, 63, 210, 105]
[0, 1, 255, 2205, 3150, 945]
```
"""
L257490(n) = SetPartitionsOfTypeM(2, n)

"""

Return the number of set partitions of ``3n`` with block sizes given by the parts of integer partition of ``3n`` which are multiples of 3 and when the integer partitions are sorted in Hindenburg order.
# Examples
```julia-repl
for n in 0:5 SetPartitionsOfTypeM(3, n) |> Println end
[1]
[0, 1]
[0, 1, 10]
[0, 1, 84, 280]
[0, 1, 682, 9240, 15400]
[0, 1, 5460, 260260, 1401400, 1401400]
```
"""
L327003(n) = SetPartitionsOfTypeM(3, n)

"""

Return the number of set partitions of ``4n`` with block sizes given by the parts of integer partition of ``4n`` which are multiples of 4 and when the integer partitions are sorted in Hindenburg order.
# Examples
```julia-repl
for n in 0:5 SetPartitionsOfTypeM(4, n) |> Println end
[1]
[0, 1]
[0, 1, 35]
[0, 1, 495, 5775]
[0, 1, 8255, 450450, 2627625]
[0, 1, 130815, 35586525, 727476750, 2546168625]
```
"""
L327004(n) = SetPartitionsOfTypeM(4, n)

L007820(len) = [SetPartitionsOfTypeM(1, 2n)[n+1]  for n in 0:len-1]
L327416(len) = [SetPartitionsOfTypeM(2, 2n)[n+1]  for n in 0:len-1]
L327417(len) = [SetPartitionsOfTypeM(3, 2n)[n+1]  for n in 0:len-1]
L327418(len) = [SetPartitionsOfTypeM(4, 2n)[n+1]  for n in 0:len-1]

#START-TEST-########################################################

using Test, SeqTests, SeqUtils

function test()

    @testset "SetPartMType" begin
        println("SetPartMType")
        L036040(6) |> println
        L257490(6) |> println
        L327003(6) |> println
        L327004(6) |> println
        # X008284, X048993,
        L156289(6) |> println
        @test L156289(5) == [0, 1, 255, 2205, 3150, 945]
        @test L156289(6) == [0, 1, 1023, 21120, 65835, 51975, 10395]
        L291451(6) |> println
        @test L291451(5) == [0, 1, 5460, 260260, 1401400, 1401400]
        L291452(6) |> println
        @test L291452(5) == [0, 1, 130815, 35586525, 727476750, 2546168625]
        V005046(6) |> println
        L005046(6) |> println
        @test V005046(7) == 4373461
        @test L005046(7) == [1, 1, 4, 31, 379, 6556, 150349]
        V291973(6) |> println
        L291973(6) |> println
        @test L291973(7) == [1, 1, 11, 365, 25323, 3068521, 583027547]
        V291975(6) |> println
        L291975(6) |> println

        V000587(6) |> println
        L000587(6) |> println
        V260884(6) |> println
        L260884(6) |> println
        V291974(6) |> println
        V291976(6) |> println

        @test L007820(6) == [1, 1, 7, 90, 1701, 42525]
        @test L327416(6) == [1, 1, 63, 21120, 20585565, 44025570225]
        @test L327417(6) == [1, 1, 682, 7128576, 429120851544, 94066556834970720]
        @test L327418(6) == [1, 1, 8255, 2941884000, 11957867341948125, 294040106448733743008625]

        L014606(6) |> println
        @test L291976(6) == [1, -1, 34, -5281, 2185429, -1854147586]
        @test L260884(7) == [1, -1, 2, -1, -43, 254, 4157]
        @test V000587(7) == -9
        @test L000587(10) == [1, -1, 0, 1, 1, -2, -9, -9, 50, 267]
        @test L291974(7) == [1, -1, 9, -197, 6841, -254801, -3000807]
        @test L291975(6) == [1, 1, 36, 6271, 3086331, 3309362716]

        @test L001147(6) == [1, 1, 3, 15, 105, 945]
        @test L025035(6) == [1, 1, 10, 280, 15400, 1401400]
        @test L025036(6) == [1, 1, 35, 5775, 2627625, 2546168625]

    end

    @testset "SetPartByShape" begin
        @test ShapePartitionsOfTypeM(3, 4) == [0, 1, 220, 462, 9240, 15400]
    end
end

function demo()

    for n ∈ 0:4
        [ShapePartitionsOfTypeM(3, n, k) for k ∈ 0:n] |> println
    end

    for m ∈ 0:4
        println("\nUnordered ShapePartitions m = $m")
        for n ∈ 0:6
            ShapePartitionsOfTypeM(m, n) |> Println
        end
    end

    for m ∈ 0:4
        println("\nUnordered SetPartitions m = $m")
        for n ∈ 0:6
            SetPartitionsOfTypeM(m, n) |> Println
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
 Return the Stirling numbers of 2nd kind.
 Exported from Module StirlingLahNumbers
"""
L048993(n) = CoeffExp(OrderedSetPolynomials(1, n))
=#

#=
"""

Return the number of set partitions of type 1.
# Examples
```julia-repl
julia> LA048993(10)
7-element Array{Nemo.fmpz,1}:
[0, 1, 43690, 7128576, 99379280, 285885600, 190590400]
```
"""
L048993(n) = SetPartitionsOfTypeM(1, n)
=#

#=

('--', 0, '---------------------')

by Shape    A000012
[0] [1]
[1] [1]
[2] [1, 1]
[3] [1, 1, 1]
[4] [1, 1, 1, 1, 1]
[5] [1, 1, 1, 1, 1, 1, 1]
[6] [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

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
