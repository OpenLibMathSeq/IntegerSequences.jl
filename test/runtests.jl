# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.
# This file includes parts from Combinatorics.jl in modified form.

# Version of: UTC 2019-10-12 22:18:34
# 775967d0-ed2d-11e9-0a84-953b35269838

# Do not edit this file, it is generated from the modules and will be overwritten!
# Edit the modules in the src directory and build this file with BuildSequences.jl!

tstdir = realpath(joinpath(dirname(@__FILE__)))
srcdir = joinpath(dirname(tstdir), "src")
tstdir ∉ LOAD_PATH && push!(LOAD_PATH, tstdir)
srcdir ∉ LOAD_PATH && push!(LOAD_PATH, srcdir)
module runtests
using Test, SeqTests, IntegerSequences, Nemo, IterTools, Combinatorics
# *** Abundant.jl *********
@testset "Abundant" begin
@test isAbundant(100800) == true
@test isAbundant(2402400) == true
@test isAbundant(49008960) == true
if is_oeis_installed()
SeqTest([L005101], 'L')
end
end
# *** AltPartitions.jl *********
@testset "AltIntParts" begin
@test length(V026791(6)) == 11
end
V080577(6)
# *** AndreNumbers.jl *********
@testset "André" begin
@test isa(André(2, 10), Nemo.fmpz)
@test André(2, 10) == ZZ(-50521)
@test André(2, 50) == ZZ(-6053285248188621896314383785111649088103498225146815121)
@test V178963(30) == ZZ(2716778010767155313771539)
@test V178964(40) == ZZ(11289082167259099068433198467575829)
if is_oeis_installed()
V = [V000111, V178963, V178964, V181936, V250283]
for v in V
SeqTest(v, 'V')
end
end
V = [1, 1, 1, 2, 5, 16, 61, 272, 1385, 7936, 50521]
generator = C000111()
for n in 1:10
v = take!(generator)
@test V[n] == v
end
v = take!(generator)
close(generator)
@test isa(v, fmpz)
end
# *** BellNumbers.jl *********
@testset "Bell" begin
seq = fmpz[1, 1, 2, 5, 15, 52]
a = [BellTrans(6, k, seq) for k in 0:5]
b = [0, 52, 205, 210, 85, 15]
@test all(a .== b)
seq = [1, 1, 1, 1, 1, 1]
a = BellTriangle(6, seq)
b = fmpz[1, 0, 1, 0, 1, 1, 0, 1, 3, 1, 0, 1, 7, 6, 1, 0, 1, 15, 25]
@test all(a[1:5] .== b[1:5])
a = fmpz[1, 1, 2, 5, 15, 52, 203]
b = [BellNumber(n) for n in 0:6]
@test all(a .== b)
if is_oeis_installed()
SeqTest(V000110, 'V')
SeqTest([L000110], 'L')
T = [T264428, T137452, T132062, T265606]
SeqTest(T, 'T')
P = [T104556, T001497, T039683, T203412, T004747,
T051141, T119274, T000369, T051142, T137513]
SeqTest(P, 'P')
end
end
# *** BernoulliNumbers.jl *********
@testset "BernoulliNum" begin
@test BernoulliInt(2, 10) == ZZ(79360)
@test BernoulliInt(3, 30) == ZZ(-7708110416280010548302670)
@test BernoulliInt(4, 40) == ZZ(-44494882577309421077208834962882560)
@test isa(BernoulliInt(3, 30), Nemo.fmpz)
@test isa(BernoulliIntList(2, 20)[end], Nemo.fmpz)
@test isa(Bernoulli(0), Nemo.fmpq)
@test isa(V027641(10), Nemo.fmpz)
@test isa(V195441(10), Nemo.fmpz)
for m in 1:20
@test BernoulliInt(m, 200) == BernoulliIntList(m, 200 + 1)[end]
end
for n in 0:20
@test denominator(Rational(Bernoulli(2 * n))) == ClausenNumber(n)
end
t = ZZ(8622529719094842064796322984685715031642180319435676189471082876882585178647210)
@test V195441(10000) == t
l = fmpz[0, 1, 2, 3, 8, 25, 96, 427, 2176]
@test all(L065619(9) .== l)
if is_oeis_installed()
V = [V195441, V281586, V281588, V027641]
for v in V SeqTest(v, 'V') end
end
end
# *** BinaryInteger.jl *********
@testset "BinaryInteger" begin
@test V295513(0) == -1
@test V295513(1) == -1
@test V295513(2) == 0
@test V295513(3) == 2
if is_oeis_installed()
V = [V001855, V003314, V033156, V054248, V061168, V097383]
for v in V
SeqTest(v, 'V', 1)
end
V = [V083652, V123753]
for v in V
SeqTest(v, 'V', 0)
end
end
end
# *** BinaryQF.jl *********
Data = Dict{Int,Array{fmpz}}(
002476 => [7, 13, 19, 31, 37, 43, 61, 67, 73, 79, 97, 103],
008784 => [1, 2, 5, 10, 13, 17, 25, 26, 29, 34, 37, 41],
031363 => [1, 4, 5, 9, 11, 16, 19, 20, 25, 29, 31, 36],
034017 => [1, 3, 7, 13, 19, 21, 31, 37, 39, 43, 49, 57],
035251 => [1, 2, 4, 7, 8, 9, 14, 16, 17, 18, 23, 25],
038872 => [5, 11, 19, 29, 31, 41, 59, 61, 71, 79, 89, 101],
038873 => [2, 7, 17, 23, 31, 41, 47, 71, 73, 79, 89, 97],
042965 => [1, 3, 4, 5, 7, 8, 9, 11, 12, 13, 15, 16],
057126 => [1, 2, 7, 14, 17, 23, 31, 34, 41, 46, 47, 49],
057127 => [1, 2, 3, 6, 9, 11, 17, 18, 19, 22, 27, 33],
068228 => [13, 37, 61, 73, 97, 109, 157, 181, 193, 229, 241, 277],
084916 => [1, 4, 6, 9, 13, 16, 22, 24, 25, 33, 36, 37],
089270 => [1, 5, 11, 19, 29, 31, 41, 55, 59, 61, 71, 79],
141158 => [5, 11, 19, 29, 31, 41, 59, 61, 71, 79, 89, 101],
242660 => [1, 4, 7, 9, 10, 13, 16, 18, 19, 22, 25, 27],
243655 => [1, 6, 13, 22, 33, 37, 46, 61, 69, 73, 78, 94],
244779 => [1, 2, 4, 7, 8, 11, 14, 16, 22, 23, 28, 29],
244780 => [1, 3, 5, 9, 11, 15, 23, 25, 27, 31, 33, 37],
244819 => [1, 3, 4, 7, 12, 13, 19, 21, 28, 31, 37, 39],
243168 => [1, 4, 9, 13, 16, 24, 25, 33, 36, 37, 49, 52],
244291 => [1, 4, 13, 24, 33, 37, 52, 61, 69, 73, 88, 97],
007522 => [7, 23, 31, 47, 71, 79, 103, 127, 151, 167, 191, 199]
)
L = [
L002476,
L008784,
L031363,
L034017,
L035251,
L038872,
L038873,
L042965,
L057126,
L057127,
L068228,
L084916,
L089270,
L141158,
L242660,
L243655,
L244779,
L244780,
L244819,
L243168,
L244291,
L007522
]
SeqNum(seq) = parse(Int, string(seq)[end-5:end])
@testset "BinaryQF" begin
for seq in L
S = seq(300)
anum = SeqNum(seq)
data = Data[anum]
@test all(S[1:11] .== data[1:11])
end
end
# *** BooleanOperations.jl *********
@testset "BoolOps" begin
A = [1, 1, 0, 0]
B = [1, 0, 1, 0]
S(R) = sum(r << (i-1)  for (i, r) in enumerate(R))
for n in 0:15
@test n == S([Bits(n, A[k], B[k]) for k in 1:4])
end
for n in 0:15
@test n == S([Bits(BoolOps[n+1], A[k], B[k]) for k in 1:4])
end
@test BinDigits(12, 17) == ([0, 0, 1, 1, 0], [1, 0, 0, 0, 1])
@test [V163617(n) for n in 0:8] == [0, 3, 6, 7, 12, 15, 14, 15, 24]
@test [V035327(n) for n in 0:8] == [1, 0, 1, 0, 3, 2, 1, 0, 7]
@test [V129760(n) for n in 0:8] == [0, 0, 2, 0, 4, 4, 6, 0, 8]
@test [V142151(n) for n in 0:8] == [0, 1, 2, 3, 6, 5, 6, 7, 14]
@test [V003817(n) for n in 0:8] == [1, 1, 3, 3, 7, 7, 7, 7, 15]
@test [V080079(n) for n in 0:8] == [1, 2, 1, 4, 3, 2, 1, 8, 7]
@test [V086799(n) for n in 0:8] == [1, 3, 3, 7, 5, 7, 7, 15, 9]
@test [V038712(n) for n in 0:8] == [1, 3, 1, 7, 1, 3, 1, 15, 1]
@test [V006257(n) for n in 0:8] == [0, 1, 1, 3, 1, 3, 5, 7, 1]
@test [V080940(n) for n in 0:8] == [1, 0, 1, 0, 1, 2, 1, 0, 1]
@test [V135521(n) for n in 0:8] == [1, 1, 1, 3, 1, 3, 1, 7, 1]
@test [V048724(n) for n in 0:8] == [0, 3, 6, 5, 12, 15, 10, 9, 24]
@test [V003188(n) for n in 0:8] == [0, 1, 3, 2, 6, 7, 5, 4, 12]
@test [V038554(n) for n in 0:8] == [0, 1, 1, 0, 2, 3, 1, 0, 4]
@test [V048735(n) for n in 0:8] == [0, 0, 0, 1, 0, 0, 2, 3, 0]
@test [V213370(n) for n in 0:8] == [0, 0, 0, 2, 0, 0, 4, 6, 0]
@test [V135481(n) for n in 0:8] == [0, 1, 0, 3, 0, 1, 0, 7, 0]
@test [V327987(n) for n in 0:8] == [0, 1, 0, 2, 2, 2, 4, 2, 0]
@test L327988(99) == [0, 2, 8, 10, 26, 32, 34, 40, 50, 58, 74, 82]
@test isV327988(121) == false
@test isV327988(122) == true
end
# *** CantorMachines.jl *********
@testset "CantorMachines" begin
len = 64
println()
println("CantorMachine")
x, y, state = 0, 0, false
for n in 0:len
p = CantorPairing(x, y)
@test n == p
x, y, state = CantorMachine(x, y, state)
end
println()
println("CantorBoustrophedonicMachine")
x, y = 0, 0
for n in 0:len
p = CantorBoustrophedonicPairing(x, y)
println("$n -> ($x, $y) -> $p")
@test n == p
x, y = CantorBoustrophedonicMachine(x, y)
end
println()
println("RosenbergStrongBoustrophedonicMachine")
x, y, state = 0, 0, 0
for n in 0:len
p = RosenbergStrongBoustrophedonicPairing(x, y)
@test n == p
x, y, state = RosenbergStrongBoustrophedonicMachine(x, y, state)
end
println()
end
# *** CarmichaelNumbers.jl *********
@testset "Carmichael" begin
@test !isCarmichael(560)
@test isCarmichael(561)
@test !isCarmichael(563)
@test isweakCarmichael(561)
@test !isweakCarmichael(563)
@test isweakCarmichael(625)
if is_oeis_installed()
L = [L002997, L225498]
SeqTest(L, 'L')
end
end
# *** ClausenNumbers.jl *********
@testset "Clausen" begin
C = ClausenNumberList(800)
@test C[125] == 30
@test C[781] == 32695402455500348373810
@test C[794] == 6
@test isa(C[781], Nemo.fmpz)
@test isa(ClausenNumber(10), Nemo.fmpz)
end
if is_oeis_installed()
SeqTest([L002445], 'L')
SeqTest(V002445, 'V', 0)
SeqTest(V027642, 'V', 0)
end
# *** CombinationsIterator.jl *********
C = collect(Combinations([2, 3, 5]))
@testset "Combinations" begin
@test C == [[2], [3], [5], [2, 3], [2, 5], [3, 5], [2, 3, 5]]
end
# *** Compositions.jl *********
# *** Counts.jl *********
indicators = [isPositive, isEven, isSquare, isPrime]
indicatorNames = ["isPositive", "isEven", "isSquare", "isPrime"]
len = 14
@testset "Counts" begin
@test Nth(96, isPrime) == 503
@test Nth(97, isPrime) == 509
@test Nth(98, isPrime) == 521
@test Count(96, isPrime) == 24
@test Count(97, isPrime) == 25
@test Count(98, isPrime) == 25
@test List(24, isPrime)[end] == 89
@test List(25, isPrime)[end] == 97
for (i, isA) in enumerate(indicators)
for n in 1:len
@test isA(n) == (Nth(Count(n, isA), isA) == n)
@test n == Count(Nth(n, isA), isA)
end
end
a = [V257993(n) for n in 1:10]
b = [1, 2, 1, 2, 1, 3, 1, 2, 1, 2]
@test all(a .== b)
if is_oeis_installed()
L = [L000961, L002808, L005117, L013928, L246547, L246655]
SeqTest(L, 'L')
end
end
# *** CyclotomicBinaryForms.jl *********
@testset "CyclotomicForms" begin
if is_oeis_installed()
L = [
L206942,
L206864,
L299498,
L299928,
L299929,
L299930,
L299214,
L296095,
L293654
]
SeqTest(L, 'L')
end
end
# *** DedekindEta.jl *********
@testset "DedekindEta" begin
@test DedekindEtaPowers(0, 1) == fmpz[]
@test isa(DedekindEtaPowers(30, 1)[10], fmpz)
@test isa(DedekindEtaPowers(30, -1)[10], fmpz)
@test RamanujanTau(20) == -7109760
P0 = [1, 1, 2, 3, 5, 7, 11, 15, 22, 30, 42, 56, 77, 101]
P1 = PartitionNumberList(14)
@test all(P0 .== P1)
if is_oeis_installed()
L = [
L010815,
L002107,
L010816,
L000727,
L000728,
L000729,
L000730,
L000731,
L010817,
L010819,
L000735,
L010820,
L010821,
L010822,
L000739,
L010823,
L010824,
L010825,
L010826,
L010827,
L010828,
L010829,
L000594,
L010830,
L010831,
L010832,
L010833,
L010834,
L010835,
L010836,
L010837,
L010840,
L010838,
L010839,
L010841,
L000041,
L000712,
L000716,
L023003,
L023004,
L023005,
L023006,
L023007,
L023008,
L023009,
L023010,
L005758,
L023011,
L023012,
L023013,
L023014,
L023015,
L023016,
L023017,
L023018,
L023019,
L023020,
L023021,
L006922,
L082556,
L082557,
L082558,
L082559
]
SeqTest(L, 'L')
end
end
# *** DelehamDelta.jl *********
Data = Dict{Int,Array{fmpz}}(
084938 => [1, 0, 1, 0, 1, 1, 0, 2, 2, 1],
060693 => [1, 1, 1, 2, 3, 1, 5, 10, 6, 1],
106566 => [1, 0, 1, 0, 1, 1, 0, 2, 2, 1],
094665 => [1, 0, 1, 0, 1, 3, 0, 4, 15, 15],
090238 => [1, 0, 1, 0, 2, 1, 0, 6, 4, 1],
225478 => [1, 3, 4, 21, 40, 16, 231, 524, 336, 64],
055883 => [1, 1, 1, 2, 4, 2, 5, 15, 15, 5],
184962 => [1, 0, 1, 0, 1, 1, 0, 3, 3, 1],
088969 => [1, 0, 1, 0, 1, 3, 0, 5, 20, 21],
090981 => [1, 1, 0, 1, 1, 0, 1, 4, 1, 0],
011117 => [1, 1, 0, 1, 1, 0, 1, 2, 3, 0]
)
@testset "Deléham" begin
n = 7
B = [bell(n) * binomial(n, j) for j in 0:n]
R = Row(T055883(n + 1), n)
@test all(B .== R)
a = fmpz[0, 5040, 2208, 828, 272, 70, 12, 1]
b = Row(T090238(8), 7)
@test all(a .== b)
SeqNum(seq) = parse(Int, string(seq)[end-5:end])
Seq = [
T084938,
T060693,
T106566,
T094665,
T090238,
T225478,
T055883,
T184962,
T088969
]
for seq in Seq
S = seq(20)
anum = SeqNum(seq)
data = Data[anum]
@test all(S[1:9] .== data[1:9])
end
end
# *** EulerTransforms.jl *********
@testset "EulerTransform" begin
if is_oeis_installed()
L = [L107895, L190905, L061256, L275585, L006171, L290351, L052847]
SeqTest(L, 'L')
V = [V107895, V190905, V061256, V275585, V006171]
for v in V
SeqTest(v, 'V', 0)
end
end
end
# *** Fibonacci.jl *********
@testset "Fibonacci" begin
@test isa(V000045(30), Nemo.fmpz)
end
# *** FigurativeNumbers.jl *********
@testset "Figurative" begin
@test V002411(1000) == 500500000
if is_oeis_installed()
V = [
V014107,
V067998,
V001477,
V000217,
V000290,
V000326,
V000384,
V000566,
V000567,
V001106,
V001107,
V000292,
V000330,
V002411,
V002412,
V002413,
V007584,
V007585
]
for v in V
SeqTest(v, 'V')
end
end
end
# *** GaussFactorials.jl *********
@testset "GaussFactorial" begin
if is_oeis_installed()
V = [V001783, V124441, V124442, V066570]
for v in V
SeqTest(v, 'V', 1)
end
W = [V055634, V232980, V232981, V232982]
for w in W
SeqTest(w, 'V', 0)
end
end
end
# *** GeneralizedBinomial.jl *********
@testset "Binomial" begin
for n in 0:10, k in 0:n
@test Binomial(n, k) == div(fac(n), (fac(n - k) * fac(k)))
@test Binomial(n, k) == Pascal(n, k)
end
end
# *** GeneralizedFibonacci.jl *********
@testset "Multinacci" begin
@test Multinacci(0, 0) == 1
@test [Multinacci(2, n) for n in 0:9] == [1, 1, 2, 3, 5,  8, 13, 21, 34,  55]
@test [V006053(n) for n in 0:9] == [1, 1, 3, 4, 9, 14, 28, 47, 89, 155]
@test [V188021(n) for n in 0:9] == [1, 1, 4, 5, 14, 20, 48, 75, 165, 274]
@test [V231181(n) for n in 0:9] == [1, 1, 5, 6, 20, 27, 75, 110, 275,429]
@test [Multinacci(6, n) for n in 0:9] == [1, 1, 6, 7, 27, 35, 110, 154,429,637]
@test [Multinacci(7, n) for n in 0:9] == [1, 1, 7, 8, 35, 44, 154, 208,637,910]
@test [Multinacci(8, n) for n in 0:9] == [1, 1, 8, 9, 44, 54,208,273,910, 1260]
end
# *** HighlyAbundant.jl *********
# *** Hyper1F1.jl *********
@testset "Hyper1F1" begin
@test V000255(10) == ZZ(16019531)
@test V000262(10) == ZZ(58941091)
@test V001339(10) == ZZ(98641011)
@test V007060(10) == ZZ(871804170613555200)
@test V033815(10) == ZZ(1465957162768492800)
@test V099022(10) == ZZ(3984884716852972800)
@test V251568(10) == ZZ(123320412181)
if is_oeis_installed()
V = [V000255, V000262, V001339, V007060, V033815, V099022, V251568]
for v in V
SeqTest(v, 'V')
end
end
end
# *** IntPartitions.jl *********
@testset "IntegerPartitions" begin
@test IntegerPartitions(0) == [[]]
@test collect(IntegerPartitions(0, 0)) == [[]]
@test collect(IntegerPartitions(0, 1)) == []
@test collect(IntegerPartitions(1, 0)) == []
@test collect(IntegerPartitions(1, 1)) == [[1]]
@test collect(IntegerPartitions(1, 2)) == []
@test collect(IntegerPartitions(2, 0)) == []
@test collect(IntegerPartitions(2, 1)) == [[2]]
@test collect(IntegerPartitions(2, 2)) == [[1, 1]]
@test collect(IntegerPartitions(2, 3)) == []
@test [length(b) for b in IntegerPartitions(0)] == [0]
@test [length(b) for b in IntegerPartitions(1)] == [1]
@test length(IntegerPartitions(0)) == 1
@test length(collect(IntegerPartitions(1))) == 1
@test_throws DomainError IntegerPartitions(-1)
@test collect(IntegerPartitions(5)) == reverse(Any[[1, 1, 1, 1, 1],
[2, 1, 1, 1], [2, 2, 1], [3, 1, 1], [3, 2], [4, 1], [5]])
for n in 0:7
pn = PartitionNumber(n)
@test length(collect(IntegerPartitions(n, byMaxPart))) == pn
@test length(collect(IntegerPartitions(n, byNumPart))) == pn
end
for n in 0:7, k in 0:n
pn = PartitionNumber(n, k)
@test length(collect(IntegerPartitions(n, k))) == pn
end
@test L005651(10) == [1, 1, 3, 10, 47, 246, 1602, 11481, 95503, 871030]
@test [V000041(n) for n in 0:8] == [1, 1, 2, 3, 5, 7, 11, 15, 22]
@test L072233(7) == [0, 1, 3, 4, 3, 2, 1, 1]
@test L036038(6) == [1, 6, 15, 20, 30, 60, 90, 120, 180, 360, 720]
@test L078760(6) == [1, 6, 15, 30, 20, 60, 120, 90, 180, 360, 720]
@test L005651(10) == [1, 1, 3, 10, 47, 246, 1602, 11481, 95503, 871030]
@test L262071(6) == [0, 720, 630, 200, 45, 6, 1]
@test L292222(6) == [1, 41, 180, 300, 360, 720]
end
# *** JacobiTheta.jl *********
@testset "JacobiTheta" begin
@test JacobiTheta3Powers(0, 1) == fmpz[]
@test isa(JacobiTheta3Powers(30, 1)[end], fmpz)
@test isa(JacobiTheta4Powers(30, 1)[end], fmpz)
@test L035016(999 + 1)[end] == ZZ(-16565884160)
@test L035016(1000 + 1)[end] == ZZ(18365675328)
if is_oeis_installed()
L = [
L000122,
L002448,
L004018,
L104794,
L005875,
L213384,
L000118,
L035016,
L008452,
L096727,
L000132,
L000141,
L008451,
L000143,
L000144,
L008453,
L000145,
L276285,
L276286,
L276287,
L004402,
L004406,
L004407,
L015128,
L004403,
L001934,
L004404,
L004405,
L004408,
L004409,
L004410,
L004411,
L004412,
L004413,
L004414,
L004420,
L004421,
L004415,
L004416,
L004417,
L004418,
L004419,
L004422,
L004423,
L004424,
L004425
]
SeqTest(L, 'L')
end
end
# *** Kolakoski.jl *********
@testset "Kolakoski" begin
K = KolakoskiList(100)
@test K[1] == 1
@test K[33] == 2
@test K[72] == 2
generator = C000002()
for n in [1, 33, 72]
k = take!(generator)
@test K[n] == k
end
close(generator)
end
# *** LandauConstants.jl *********
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
# *** NarayanaCows.jl *********
@testset "Narayana" begin
@test IterTools.nth(NarayanasCows(12), 12) == 5
end
# *** NumberTheory.jl *********
Data = Dict{Int,Array{fmpz}}(
034386 => [1, 1, 2, 6, 6, 30, 30, 210, 210, 210],
061142 => [1, 1, 2, 2, 4, 2, 4, 2, 8, 4],
002110 => [1, 2, 6, 30, 210, 2310, 30030, 510510, 9699690, 223092870],
000005 => [0, 1, 2, 2, 3, 2, 4, 2, 4, 3],
000010 => [0, 1, 1, 2, 2, 4, 2, 6, 4, 6],
000203 => [0, 1, 3, 4, 7, 6, 12, 8, 15, 13],
001222 => [0, 0, 1, 1, 2, 1, 2, 1, 3, 2],
001221 => [0, 0, 1, 1, 1, 1, 2, 1, 1, 1],
008683 => [0, 1, -1, -1, 0, -1, 1, -1, 0, 0],
181830 => [0, 1, 0, 0, 0, 1, 0, 2, 2, 2],
034444 => [1, 1, 2, 2, 2, 2, 4, 2, 2, 2]
)
@testset "NumTheory" begin
@test τ(7560) == 64
@test τ(46080) == 66
@test τ(25920) == 70
@test σ(7560) == 28800
@test σ(46080) == 159666
@test σ(25919) == 25920
@test σ(25920) == 92202
@test ω(7560) == 4
@test ω(46080) == 3
@test ω(25919) == 1
@test ω(25920) == 3
@test Ω(7560) == 8
@test Ω(46080) == 13
@test Ω(25919) == 1
@test Ω(25920) == 11
@test Radical(58564) == 22
@test Radical(58565) == 58565
FB(n::Int) = (r = 1; for k in 1:n
⊥(n, k) && (r = mods(r * k, n))
end; r)
FA(n::Int) = mods(∏([j for j in 1:n if ⊥(j, n)]), n)
for n in 1:20
@test FA(n) == FB(n)
end
if is_oeis_installed()
V = [V061142, V000005, V000010, V000203, V001222, V001221, V008683]
W = [V034386, V002110, V181830, V034444]
for v in V
SeqTest(v, 'V', 1)
end
L = [L003277]
SeqTest(L, 'L')
end
end
composita = [false, false, false, false, true, false, true, false]
@testset "Queries" begin
for n in 0:7
@test isComposite(n) == composita[n+1]
end
end
# *** OEISUtils.jl *********
if oeis_isinstalled()
@info("OEIS data is installed as: " * oeis_path())
end
# *** OrthoPolynomials.jl *********
@testset "OrthoPoly" begin
@test isa(OrthoPoly(10, n -> 1, n -> n + 1)[end], fmpz)
@test isa(InvOrthoPoly(10, n -> 1, n -> n + 1)[end], fmpz)
@test RowSums(T217537(8)) == L217924(8)
if is_oeis_installed()
T = [
T066325,
T049310,
T137338,
T104562,
T037027,
T049218,
T159834,
T137286,
T053120,
T053117,
T053121,
T216916,
T217537,
T064189,
T202327,
T111062,
T099174,
T111593,
T064189
]
SeqTest(T, 'T')
L = [L217924, L005425, L000085, L001464, L003723, L108624, L006229]
SeqTest(L, 'L')
end
end
# *** PrimesIterator.jl *********
@testset "Primes" begin
@test PrimePi(2^14) == 1900
@test PrimePi(10^6) == 78498
end
# *** PrimeSwingFactorial.jl *********
@testset "PrimeSwingF" begin
for n in 0:999
S = PSfactorial(n)
B = Base.factorial(BigInt(n))
@test all(S .== B)
end
end
# *** Products.jl *********
@testset "FallingFact" begin
@test FallingFactorial(100, 100) == factorial(BigInt(100))
@test (100↓100) == factorial(BigInt(100))
@test FallingFactorial(333, 333) == factorial(BigInt(333))
@test FallingFactorial(111, 0) == 1
end
@testset "RisingFact" begin
@test RisingFactorial(11, 11) == 14079294028800
@test (11↑11) == 14079294028800
@test RisingFactorial(
33,
33
) == 31344295059422473624824839739793024055460338073600000000
@test RisingFactorial(111, 0) == 1
end
@testset "MultiFact" begin
a = [MultiFactorial(2, 1)(n) for n in 0:6]
b = [1, 1, 3, 15, 105, 945, 10395]
@test all(a .== b)
end
if is_oeis_installed()
V = [
V000142,
V000165,
V007696,
V001813,
V047053,
V001147,
V008545,
V081125,
V000407,
V032031,
V007559,
V008544
]
@testset "Products" begin
for v in V
SeqTest(v, 'V')
end
end
end
# *** QueensProblems.jl *********
@testset "QueensProblem" begin
levels = [1, 10, 72, 364, 1400, 3916, 7552, 9632, 7828, 4040, 724]
@test all(L319284(10) .== levels)
end
# *** RationalTrees.jl *********
@testset "EuclidTree" begin
S = [numerator(sum(r for r in EuclidTree(n))) for n in 1:9]
L = Nemo.fmpz[1, 5, 11, 23, 47, 95, 191, 383, 767] # A052940
@test all(S[1:9] .== L[1:9])
end
# *** RecordSearch.jl *********
# *** RiordanSquares.jl *********
@testset "RiordanSqr" begin
a = T039599(5)
b = [1, 1, 1, 2, 3, 1, 5, 9, 5, 1, 14, 28, 20, 7, 1]
@test all(a .== b)
a = T116392(5)
b = [1, 1, 1, 3, 4, 1, 7, 13, 7, 1, 19, 42, 32, 10, 1]
@test all(a .== b)
a = T172094(5)
b = [1, 1, 1, 3, 4, 1, 11, 17, 7, 1, 45, 76, 40, 10, 1]
@test all(a .== b)
a = T321620(5)
b = [1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 3, 2, 1, 1]
@test all(a .== b)
a = T321621(5)
b = [1, 1, 1, 2, 3, 1, 4, 8, 5, 1, 9, 21, 18, 7, 1]
@test all(a .== b)
a = T321623(5)
b = T321623(5)
@test all(a .== b)
a = T321624(5)
b = [1, 1, 1, 3, 4, 1, 4, 10, 7, 1, 7, 24, 26, 10, 1]
@test all(a .== b)
a = T322942(5)
b = [1, 1, 1, 1, 2, 1, 3, 5, 3, 1, 5, 12, 10, 4, 1]
@test all(a .== b)
end
# *** SelfConvolutive.jl *********
@testset "SelfConvRec" begin
if is_oeis_installed()
L = [
L005411,
L005412,
L006012,
L006318,
L047891,
L062980,
L082298,
L082301,
L082302,
L105523,
L107716,
L111529,
L111530,
L111531,
L111532,
L111533,
L146559,
L167872
]
SeqTest(L, 'L')
end
end
# *** SeqUtils.jl *********
# *** SeriesExpansion.jl *********
@testset "SeriesCoefficients" begin
a = L000032(14)
b = [1, 1, 3, 4, 7, 11, 18, 29, 47, 76, 123, 199, 322, 521]
@test all(a .== b)
a = L000073(15)
b = [1, 1, 2, 4, 7, 13, 24, 44, 81, 149, 274, 504, 927, 1705, 3136]
@test all(a .== b)
a = L000108(13)
b = [1, 1, 2, 5, 14, 42, 132, 429, 1430, 4862, 16796, 58786, 208012]
@test all(a .== b)
a = L000257(12)
b = [1, 1, 3, 12, 56, 288, 1584, 9152, 54912, 339456, 2149888, 13891584]
@test all(a .== b)
a = L000957(13)
b = [1, 1, 0, 1, 2, 6, 18, 57, 186, 622, 2120, 7338, 25724]
@test all(a .== b)
a = L001003(12)
b = [1, 1, 3, 11, 45, 197, 903, 4279, 20793, 103049, 518859, 2646723]
@test all(a .== b)
a = L001006(14)
b = [1, 1, 2, 4, 9, 21, 51, 127, 323, 835, 2188, 5798, 15511, 41835]
@test all(a .== b)
a = L001045(13)
b = [1, 1, 1, 3, 5, 11, 21, 43, 85, 171, 341, 683, 1365]
@test all(a .== b)
a = L002426(12)
b = [1, 1, 3, 7, 19, 51, 141, 393, 1107, 3139, 8953, 25653]
@test all(a .== b)
a = L005043(12)
b = [1, 1, 0, 1, 1, 3, 6, 15, 36, 91, 232, 603]
@test all(a .== b)
xL006318(n) = Coefficients(G006318, n)
a = xL006318(12)
b = [1, 2, 6, 22, 90, 394, 1806, 8558, 41586, 206098, 1037718, 5293446]
@test all(a .== b)
a = L068875(10)
b = [1, 2, 4, 10, 28, 84, 264, 858, 2860, 9724]
@test all(a .== b)
end
# *** SetPartitions.jl *********
@testset "SetPartitions" begin
@test collect(SetPartitions([])) == [[]]
@test collect(SetPartitions([], 0)) == [[]]
@test collect(SetPartitions([], 1)) == []
@test collect(SetPartitions([1])) == [[[1]]]
@test collect(SetPartitions([1], 0)) == []
@test collect(SetPartitions([1], 1)) == [[[1]]]
@test collect(SetPartitions([1], 2)) == []
@test collect(SetPartitions([1,2])) == [[[1,2]],[[1],[2]]]
@test collect(SetPartitions([1,2], 0)) == []
@test collect(SetPartitions([1,2], 1)) == [[[1, 2]]]
@test collect(SetPartitions([1,2], 2)) == [[[1], [2]]]
@test collect(SetPartitions([1,2], 3)) == []
@test collect(SetPartitions(0)) == [[]]
@test collect(SetPartitions(0, 0)) == [[]]
@test collect(SetPartitions(0, 1)) == []
@test collect(SetPartitions(1)) == [[[1]]]
@test collect(SetPartitions(1, 0)) == []
@test collect(SetPartitions(1, 1)) == [[[1]]]
@test collect(SetPartitions(1, 2)) == []
@test collect(SetPartitions(2)) == [[[1,2]],[[1],[2]]]
@test collect(SetPartitions(2, 0)) == []
@test collect(SetPartitions(2, 1)) == [[[1, 2]]]
@test collect(SetPartitions(2, 2)) == [[[1], [2]]]
@test collect(SetPartitions(2, 3)) == []
SP = [ [[1,2,3]], [[1,2], [3]], [[1,3], [2]], [[1], [2,3]], [[1], [2], [3]] ]
CP = collect(SetPartitions([1, 2, 3]))
@test SP == CP
RP = reduce(vcat, [collect(SetPartitions([1, 2, 3], k)) for k in 1:3])
@test SP == RP
for n in 1:7
s = collect(0:n-1)
@test length(collect(SetPartitions(s))) == SetNumber(length(s))
end
for n in 1:7, k in 1:n
sn = SetNumber(n, k)
@test length(collect(SetPartitions(1:n, k))) == sn
end
@test_throws DomainError SetPartitions([ ], -1)
@test_throws DomainError SetPartitions([1], -1)
end
# *** StirlingLahNumbers.jl *********
@testset "Stirling1" begin
for (n, S1) in enumerate(I132393(10))
SC = [stirlings1(n - 1, k) for k in 0:n-1]
@test S1 == SC
end
end
@testset "Stirling2" begin
for (n, S2) in enumerate(I048993(10))
SC = [stirlings2(n - 1, k) for k in 0:n-1]
@test S2 == SC
end
end
# *** SwingFactorial.jl *********
@testset "SwingFactorial" begin
for n in 0:999
S = Sfactorial(n)
B = Base.factorial(BigInt(n))
@test S == B
end
end
# *** Triangles.jl *********
BinTri(n) = [binomial(k, j) for k in 0:n-1 for j in 0:k]
X(n, k) =
((k > n || k < 0) && return 0;
(n == 0 && k == 0) && return 1;
4 * X(n - 1, k - 1) + (4 * n - 1) * X(n - 1, k))
T(n) = [X(j, k) for j in 0:n for k in 0:j]
@testset "Triangles" begin
t = T(6)
a = [3465, 8784, 7136, 2304, 256]
b = Row(t, 4)
@test all(a .== b)
t = BinTri(8)
a = [1, 2, 4, 8, 16, 32, 64, 128]
b = RowSums(t)
@test all(a .== b)
a = [1, 0, 0, 0, 0, 0, 0, 0]
b = RowSums(t, true)  # alternating sum
@test all(a .== b)
end
# *** UlamNumbers.jl *********
@testset "UlamNumbers" begin
@test UlamList(6)[end] == 8
end
# *** ZumkellerNumbers.jl *********
@testset "Zumkeller" begin
@test isZumkeller(17000) == true
@test isZumkeller(27472) == true
@test isZumkeller(29062) == false
@test isZumkeller(43464) == true
end
end # module