
##   🔶  [Abundant](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/Abundant.jl)


``n`` is an abundant number if ``σ(n) > 2n``. An abundant number is a number for which the sum of its proper divisors is greater than the number itself.

* isAbundant, is005101, I005101, F005101, L005101, V005101.

##   🔶  [AltPartitions](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/AltPartitions.jl)


Two alternative implementations of integer partitions. The first one implements the 'visit-pattern' in Fortran style. Compared to the implementation in JuliaMath/Combinatorics:

For n = 50 the benchmark shows:

*  0.141849 seconds (     9   allocations:  1.672 KiB)  [NEXPAR]
*  0.111040 seconds (408.45 k allocations: 40.882 MiB, 21.10% gc time) [JuliaMath]

For n = 100 the benchmark shows:

* 167.598273 seconds (    15   allocations:  4.813 KiB) [NEXPAR]
*  86.960344 seconds (381.14 M allocations: 48.735 GiB, 11.29% gc time) [JuliaMath]

Our function is slower but the Combinatorics function takes vastly more space.

In the second alternative implementation the representation of the partitions for fixed n is a weakly increasing lists ordered lexicographicaly. It has a nice algorithm implemented directly (i.e. without iteration).

* Partition, V080577, V026791

##   🔶  [AndreNumbers](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/AndreNumbers.jl)


Generalized André numbers count the ``m``-alternating permutations of length ``n``, cf. A181937.

```
[  SEQ  ] n|k [0][1][2][3][4] [5] [6]  [7]   [8]   [9]  [10]
[V000012] [1]  1, 1, 1, 1, 1,  1,  1,   1,    1,    1,     1
[V000111] [2]  1, 1, 1, 2, 5, 16, 61, 272, 1385, 7936, 50521
[V178963] [3]  1, 1, 1, 1, 3,  9, 19,  99,  477, 1513, 11259
[V178964] [4]  1, 1, 1, 1, 1,  4, 14,  34,   69,  496,  2896
[V181936] [5]  1, 1, 1, 1, 1,  1,  5,  20,   55,  125,   251
[V250283] [6]  1, 1, 1, 1, 1,  1,  1,   6,   27,   83,   209
```

* André, C000111, V000111, V178963, V178964, V181936, V250283.

##   🔶  [BellNumbers](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/BellNumbers.jl)


The Bell transform transforms an integer sequence into an integer triangle; also known as incomplete Bell polynomials.

Let ``X`` be an integer sequence, then ``B_{n, k}(X) = \sum_{m=1}^{n-k+1} \binom{n-1}{m-1} X[m] B_{n-m,k-1}(X)`` where ``B_{0,0} = 1, B_{n,0} = 0`` for ``n≥1, B_{0,k} = 0`` for ``k≥1``.

The Bell transform is (0,0)-based and the associated triangle always has as first column 1,0,0,0,... This column is often missing in the OEIS. Other Stirling number related sequences are implemented in the module StirlingLahNumbers.

* BellTrans, BellTriangle, BellNumberList, BellNumber
* V000110, L000110, T137452, T264428, T137513, T104556, T001497, T132062, T039683, T203412, T004747, T051141, T265606, T119274, T000369, T051142

##   🔶  [BernoulliNumbers](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/BernoulliNumbers.jl)

We are primarily concerned with the integer Bernoulli numbers.

Cf. ``A000182 (m=2), A293951 (m=3), A273352 (m=4), A318258 (m=5).``

```
[1] [0, 1,    0,       0,             0,                  0]
[2] [0, 1,   -2,      16,          -272,               7936]
[3] [0, 1,   -9,     477,        -74601,           25740261]
[4] [0, 1,  -34,   11056,     -14873104,        56814228736]
[5] [0, 1, -125,  249250,   -2886735625,    122209131374375]
[6] [0, 1, -461, 5699149, -574688719793, 272692888959243481]
```

The rational Bernoulli numbers are defined here with ``B(1) = 1/2``. Why this is preferred over ``B(1) = -1/2`` is explained in the [Bernoulli Manifesto](http://luschny.de/math/zeta/The-Bernoulli-Manifesto.html).

* BernoulliInt, BernoulliIntList, Bernoulli, BernoulliList
* V195441, V065619, V281586, V281588, V027641, L065619

##   🔶  [BinaryInteger](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/BinaryInteger.jl)


For positive n, BinaryIntegerLength is ``⌊ log[2](n) ⌋ + 1``, BinaryIntegerLength(0) = 0.

* BinaryIntegerLength, Bil, V001855, V003314, V033156, V054248, V061168, V083652, V097383, V123753, V295513

##   🔶  [BinaryQF](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/BinaryQF.jl)


A binary quadratic form over Z is a quadratic homogeneous polynomial in two variables with integer coefficients, ``q(x, y) = ax^2 + bxy + cy^2``.

A quadratic form ``q(x, y)`` represents an integer ``n`` if there exist integers ``x`` and ``y`` with ``q(x, y) = n``. We say that ``q`` primitively represents ``n`` if there exist relatively prime integers ``x`` and ``y`` such that ``q(x, y) = n``.

Ported from [BinaryQuadraticForms](http://oeis.org/wiki/User:Peter_Luschny/BinaryQuadraticForms) where you can find much more information on this subject.

* L002476, L008784, L031363, L034017, L035251, L038872, L038873, L042965, L057126, L057127, L068228, L084916, L089270, L141158, L242660, L243655, L244779, L244780, L244819, L243168, L244291, L007522

##   🔶  [BooleanOperations](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/BooleanOperations.jl)


The 16 boolean operations

* FALSE, AND, DIF, PRJ1, CNIMP, PRJ2, XOR, OR, NOR, EQV, NEG2, CIMP, NEG1, IMP, NAND, TRUE

evaluated bitwise on the binary expansions of integers.

The main function is

* Bits(op::String, n::Int, k::Int, algo=max)

where op are the above acronyms. If the lengths of the binary expansions of ``n`` and ``k`` are different, the parameter 'algo=min' offers the choice to reduce the range of comparison to the smaller range or to the larger range, 'algo=max', which will first pad the representation of the smaller operand with 0's up to the length of the larger operand.

* Not, And, Dif, Cnimp, Xor, Or, Nor, Eqv, Cimp, Imp, Nand, BinDigits, BoolOps, Bits, V035327, V003817, V129760, V142151, V080079, V086799, V038712, V163617, V006257, V048724, V003188, V038554, V048735, V213370, V080940, V135521,  , V280172.

##   🔶  [CantorMachines](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/CantorMachines.jl)


[Cantor's enumeration of N X N revisited](https://luschny.wordpress.com/2018/09/24/cantors-enumeration-of-n2-revisited/).

* Cantor-Machine, Cantor-Enumeration, Cantor-Pairing, Cantor-BoustrophedonicMachine, Cantor-BoustrophedonicEnumeration, Cantor-BoustrophedonicPairing, RosenbergStrong-BoustrophedonicMachine, RosenbergStrong-BoustrophedonicEnumeration, RosenbergStrong-BoustrophedonicPairing

##   🔶  [CarmichaelNumbers](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/CarmichaelNumbers.jl)


* isCarmichael, I002997, F002997, L002997
* isweakCarmichael, I225498, F225498, L225498

##   🔶  [ClausenNumbers](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/ClausenNumbers.jl)


* ClausenNumber, ClausenNumberList, V002445, L002445, V027642

##   🔶  [CombinationsIterator](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/CombinationsIterator.jl)


* Combinations

##   🔶  [Compositions](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/Compositions.jl)


* T097805, L097805, V097805, M097805

##   🔶  [Counts](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/Counts.jl)


* PreviousPrime, NextPrime, PrimePiList, takeFirst, Nth, Count, List, HilbertHotel
* L000961, L002808, L005117, L013928, L025528, L065515, L065855, L069637, L246547, L246655, L000720, V007917, V151800, V257993

##   🔶  [CyclotomicBinaryForms](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/CyclotomicBinaryForms.jl)


E. Fouvry, C. Levesque, M. Waldschmidt,
[Representation of integers by cyclotomic binary forms](https://arxiv.org/pdf/1712.09019.pdf), arXiv:1712.09019 [math.NT], 2017.

* is206864, F206864, I206864, L206864, is206942, F206942, I206942, L206942, is293654, F293654, I293654, L293654, is296095, F296095, I296095, L296095, V299214, L299214, is299498, F299498, I299498, L299498, is299733, L299733, is299928, F299928, I299928, L299928, is299929, F299929, I299929, L299929, is299930, F299930, I299930, L299930, is325143, F325143, I325143, L325143, is325145, F325145, I325145, L325145

##   🔶  [DedekindEta](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/DedekindEta.jl)


* DedekindEtaPowers, RamanujanTau, RamanujanTauList, PartitionNumberList

##   🔶  [DelehamDelta](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/DelehamDelta.jl)


Philippe Deléham’s Δ-operation maps, similar to the Riordan product, two integer sequences on a lower triangular matrix.
It effectively computes a continued fraction depending on the two input sequences!

Applying Deléham's Δ-operation often gives an additional first column or an additional main diagonal in the resulting triangle compared to what is listed in the OEIS.

[Introduction to the Riordan Square](http://luschny.de/math/seq/RiordanSquare.html)

* DeléhamΔ, T084938, T060693, T106566, T094665, T090238, T225478, T055883, T184962, T088969, T090981, T011117

##   🔶  [EulerTransforms](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/EulerTransforms.jl)


* V006171, L006171, V107895, L107895, V061256, L061256, V190905, L190905, V275585, L275585, V290351, L290351

##   🔶  [Fibonacci](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/Fibonacci.jl)


* I000045, F000045, L000045, V000045, R000045, is000045

##   🔶  [FigurativeNumbers](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/FigurativeNumbers.jl)


* PolygonalNumber, PyramidalNumber, V014107, V095794, V067998, V080956, V001477, V000217, V000290, V000326, V000384, V000566, V000567, V001106, V001107, V005564, V058373, V254749, V000292, V000330, V002411, V002412, V002413, V002414, V007584, V007585

##   🔶  [GaussFactorials](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/GaussFactorials.jl)


The Gauß factorial is ``∏_{1 ≤ j ≤ N, j ⊥ n} j``, the product of the positive integers which are ``≤ N`` and are prime to ``n``.

* GaussFactorial, I193338, F193338, L193338, V193338, I193339, F193339, L193339, V193339, V216919, V001783, V055634, V232980, V232981, V232982, V124441, V124442, V066570

##   🔶  [GeneralizedBinomial](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/GeneralizedBinomial.jl)


P. Luschny, [Generalized Binomial](http://oeis.org/wiki/User:Peter_Luschny/ExtensionsOfTheBinomial), OEIS Wiki.

* Binomial, Pascal, T007318

##   🔶  [GeneralizedFibonacci](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/GeneralizedFibonacci.jl)


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

##   🔶  [HighlyAbundant](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/HighlyAbundant.jl)


* I002093, F002093, L002093, V002093, I034885, F034885, L034885, V034885

##   🔶  [Hyper1F1](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/Hyper1F1.jl)


GammaHyp: ``(a, b, c, d)`` ↦ ``Γ(a) `` Hypergeometric``1F1(b, c, d).``

* GammaHyp, V000255, V000262, V001339, V007060, V033815, V099022, V251568

##   🔶  [IntPartitions](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/IntPartitions.jl)


All integer partitions are listed by two orderings:
IntegerPartitions(n, byNumPart)
IntegerPartitions(n, byMaxPart)

Or restricted to partitions of length m:
IntegerPartitions(n, m)

The partition coefficients, which are the multinomial coefficients applied to partitions, are given in both orderings (L036038, L078760).

The partition numbers and the number of partitions of n into k parts are given as PartitionNumber(n) and PartitionNumber(n, k), (V000041, L072233).

The sum of all partition coefficients of n is efficiently computed with L005651.

* V000041, V088887, I072233, L072233, L036038, L078760, L005651, L262071, L292222, L115621, L328917

##   🔶  [JacobiTheta](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/JacobiTheta.jl)


The ``q``-expansion of the Jacobi theta functions 3 and 4 raised to the power ``r`` is computed for various values of ``r``.

* JacobiTheta3Powers, JacobiTheta4Powers, L000122, L002448, L004018, L104794, L005875, L213384, L000118, L035016, L008452, L096727, L000132, L000141, L008451, L000143, L000144, L008453, L000145, L276285, L276286, L276287, L004402, L004406, L004407, L015128, L004403, L001934, L004404, L004405, L004408, L004409, L004410, L004411, L004412, L004413, L004414, L004420, L004421, L004415, L004416, L004417, L004418, L004419, L004422, L004423, L004424, L004425

##   🔶  [Kolakoski](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/Kolakoski.jl)


* KolakoskiList, C000002, I000002, L000002

##   🔶  [LandauConstants](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/LandauConstants.jl)


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

##   🔶  [NarayanaCows](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/NarayanaCows.jl)


* NarayanasCows, L214551

For background information see
* J.-P. Allouche, T. Johnson, [Narayana's Cows and Delayed Morphisms](http://recherche.ircam.fr/equipes/repmus/jim96/actes/Allouche.ps).
* C.M. Wilmott, [From Fibonacci to the mathematics of cows and quantum circuitry](https://iopscience.iop.org/article/10.1088/1742-6596/574/1/012097/pdf).

##   🔶  [NodesAndEdges](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/NodesAndEdges.jl)

Rooted trees and similar topics.

* V000055, V000081, V000106, V209397, V217420, V095350, V002494, V055542, V055543, V055544, V000088, L087803, L036039

##   🔶  [NumberTheory](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/NumberTheory.jl)


* τ, σ, σ2, ϕ, ω, Ω, ⊥, ⍊
* Divisors, PrimeDivisors, Factors, Radical, mods, Divides, isPrime, isCyclic, isStrongCyclic, isOdd, PrimeList, isPrimeTo, isStrongPrimeTo, isNonnegative, isPositive, isEven, isSquare, isComposite, isSquareFree, isPrimePower, isPowerOfPrimes, isPerfectPower
* V000005, V000010, V000203, V001222, V001221, V008683, V181830, V034444, I003277, L003277, V061142, V034386, V002110, I050384, L050384, V001157

##   🔶  [OEISUtils](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/OEISUtils.jl)


A collection of utilities for handling OEIS related tasks.

##   🔶  [OrderedSetPartitionsTypeM](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/OrderedSetPartitionsTypeM.jl)


| type | m = 0 | m = 1 | m = 2 | m = 3 | m = 4 |
|------|-------|-------|-------|-------|-------|
| by shape | [A178803](https://oeis.org/A178803) | [A133314](https://oeis.org/A133314) | [A327022](https://oeis.org/A327022) | [A327023](https://oeis.org/A327023) | [A327024](https://oeis.org/A327024) |
| by length | [A318144](https://oeis.org/A318144) | [A131689](https://oeis.org/A131689) | [A241171](https://oeis.org/A241171) | [A278073](https://oeis.org/A278073) | [A278074](https://oeis.org/A278074) |
| diagonal | [A000142](https://oeis.org/A000142) | [A000142](https://oeis.org/A000142) | [A000680](https://oeis.org/A000680) | [A014606](https://oeis.org/A014606) | [A014608](https://oeis.org/A014608) |
| row sum | [A101880](https://oeis.org/A101880) | [A000670](https://oeis.org/A000670) | [A094088](https://oeis.org/A094088) | [A243664](https://oeis.org/A243664) | [A243665](https://oeis.org/A243665) |
| alt row sum | [A260845](https://oeis.org/A260845) | [A033999](https://oeis.org/A033999) | [A028296](https://oeis.org/A028296) | [A002115](https://oeis.org/A002115) | [A211212](https://oeis.org/A211212) |
| central | [A053529](https://oeis.org/A053529) | [A210029](https://oeis.org/A210029) | [A281478](https://oeis.org/A281478) | [A281479](https://oeis.org/A281479) | [A281480](https://oeis.org/A281480) |

##   🔶  [OrthoPolynomials](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/OrthoPolynomials.jl)


* OrthoPoly, InvOrthoPoly, T053121, T216916, T217537, T064189, T202327, T111062, T099174, T066325, T049310, T137338, T104562, T037027, T049218, T159834, T137286, T053120, T053117, T111593, T059419, L217924, L005773, L108624, L005425, L000085, L001464, L003723, L006229

##   🔶  [Polynomials](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/Polynomials.jl)


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

##   🔶  [PrimesIterator](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/PrimesIterator.jl)


* Primes, PrimePi, PrimeSieve

##   🔶  [PrimeSwingFactorial](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/PrimeSwingFactorial.jl)


Cf. P. Luschny, [Swing, divide and conquer the factorial](https://oeis.org/A000142/a000142.pdf), excerpt.

* PSfactorial, Swing

##   🔶  [Products](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/Products.jl)


* ∏, Product, F!, RisingFactorial, ↑, FallingFactorial, ↓, MultiFactorial
* V000407, V124320, V265609, V000142, V081125, V001147, V000165, V032031, V007559, V008544, V007696, V001813, V008545, V047053

##   🔶  [QueensProblems](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/QueensProblems.jl)


For some background see: [Backtracking with profiles](https://wp.me/paipV7-E).

* Queens, L319284

##   🔶  [RationalTrees](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/RationalTrees.jl)


Rational trees as understood here are binary trees enumerating the positive or
nonnegative rational numbers. Examples are the Euclid tree, the Kepler tree and the
Stern-Brocot tree (a.k.a. Farey tree). They are closely related to binary partitions
and to Stern's diatomic sequence or Dijkstra's fusc function.

Malter, Schleicher, Zagier, [New looks at old number theory](https://pdfs.semanticscholar.org/6d28/dcef911dd91f47e6ca4bd2c564c1f3099a05.pdf), Amer. Math. Monthly, 120(3), 2013, pp. 243-264.

* EuclidTree, CalkinWilfTree, SchinzelSierpinskiEncoding

##   🔶  [RecordSearch](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/RecordSearch.jl)


The type object to construct an iterated search for records in sequences.

* Records

##   🔶  [RiordanSquares](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/RiordanSquares.jl)


The Riordan product is a map a, b ↦ [a, b] associating two formal power series a, b with a lower triangular matrix [a, b]. The Riordan square is the case a = b of the Riordan product. Formally we can describe the Riordan square as a transform RS: Z[[x]] ↦ Mat[Z] which maps power series over the integers to (lower triangular) integer matrices.

* RiordanProduct, RiordanSquare
* T039599, T116392, T172094, T321620, T321621, T321623, T321624, T322942

[Introduction to the Riordan Square](http://luschny.de/math/seq/RiordanSquare.html)

##   🔶  [SelfConvolutive](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/SelfConvolutive.jl)


Some exactly solvable self-convolutive recurrences.

* SelfConvRec, L000698, L001710, L003319, L005411, L005412, L006012, L006318, L047891, L062980, L082298, L082301, L082302, L105523, L107716, L111529, L111530, L111531, L111532, L111533, L146559, L167872

##   🔶  [SeqTests](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/SeqTests.jl)


Alias for is_oeis_installed.

##   🔶  [SeqUtils](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/SeqUtils.jl)


Nemo is a library designed, developed and maintained by William Hart with the help of others. Many functions in our project are based on Nemo.

##   🔶  [SeriesExpansion](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/SeriesExpansion.jl)


The generating functions of various combinatorial and number-theoretic functions.

* Coefficients, G000045, G000257, L000257, G000032, L000032, G000073, L000073, G000108, L000108, G000957, L000957, G001003, L001003, G001006, L001006, G001045, L001045, G002426, L002426, G005043, L005043, G006318, G068875, L068875

##   🔶  [SetPartitions](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/SetPartitions.jl)


* SetPartitions(s::AbstractVector)
Return an iterator over all set partitions of the elements of the array ``s``, represented as arrays of arrays.

* SetPartitions(n::Int)
Return an iterator over all set partitions of the elements of the array ``[1,2,...,n]``, represented as arrays of arrays.

* SetPartitions(s::AbstractVector, m::Int)
Return all set partitions of the elements of the array ``s`` into exactly ``m`` subsets, represented as arrays of arrays.

* SetPartitions(n::Int, m::Int)
Return all set partitions of the elements of the array ``{1,2,3,...,n}`` into exactly ``m`` subsets, represented as arrays of arrays.

* SetNumber(n::Int)
Return the numbers of partitions of an ``n``-set into nonempty subsets.

* SetNumber(n::Int, m::Int)
Return the numbers of partitions of an ``n``-set into ``m`` nonempty subsets.

##   🔶  [SetPartitionsTypeM](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/SetPartitionsTypeM.jl)


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

##   🔶  [SpigotPi](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/SpigotPi.jl)

Computes the first n decimal digits of Pi, uses a variant of the spigot algorithm valid as long as the number of digits <= 54900. Based on ideas of A. Sale (1968). Algorithm due to D. Saada (1988) and S. Rabinowitz (1991). Proof due to [Rabinowitz and S. Wagon](https://www.maa.org/sites/default/files/pdf/pubs/amm_supplements/Monthly_Reference_12.pdf) (1995).

* Pi, V000796

##   🔶  [StirlingLahNumbers](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/StirlingLahNumbers.jl)


* T132393, L132393, V132393, M132393, T048993, L048993, V048993, M048993, T271703, L271703, V271703, M271703, T094587, L094587, V094587, M094587, T008279, L008279, V008279, M008279

##   🔶  [SwingFactorial](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/SwingFactorial.jl)


Basic implementation of the swing algorithm using no primes. Claims to be the most efficient simple algorithm to compute the factorial. An advanced version based on prime-factorization is available as the prime-swing factorial factorialPS.

* Sfactorial

##   🔶  [Triangles](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/Triangles.jl)


* Triangle, ZTriangle, QTriangle, RecTriangle, TriangularNumber, isTriangular, assertTriangular, ShowAsΔ, ShowAsMatrix, Row, RowSums, fromΔ, toΔ, TriangleToList

##   🔶  [UlamNumbers](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/UlamNumbers.jl)


An Ulam number u(n) is the least number > u(n-1) which is a unique sum of two distinct earlier terms; u(1) = 1 and u(2) = 2.

* UlamList, isUlam, L002858

##   🔶  [ZumkellerNumbers](https://github.com/OpenLibMathSeq/IntegerSequences.jl/blob/master/src/ZumkellerNumbers.jl)


A Zumkeller number ``n`` is an integer whose divisors can be partitioned into two disjoint sets whose sums are both ``σ(n)/2``.

* isZumkeller, is083207, I083207, F083207, L083207, V083207
