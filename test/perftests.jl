# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.
# This file includes parts from Combinatorics.jl in modified form.

# Version of: UTC 2019-10-26 10:41:45
# 714d4830-f7cc-11e9-225f-e76193ad304c

# Do not edit this file, it is generated from the modules and will be overwritten!
# Edit the modules in the src directory and build this file with BuildSequences.jl!

tstdir = realpath(joinpath(dirname(@__FILE__)))
srcdir = joinpath(dirname(tstdir), "src")
tstdir ∉ LOAD_PATH && push!(LOAD_PATH, tstdir)
srcdir ∉ LOAD_PATH && push!(LOAD_PATH, srcdir)
module perftests
using IntegerSequences, Dates, InteractiveUtils
InteractiveUtils.versioninfo()
start = Dates.now()
# +++ Abundant.jl +++
GC.gc()
println("\nTEST: L005101(5000)")
@time L005101(5000)
# +++ AltPartitions.jl +++
# +++ AndreNumbers.jl +++
GC.gc()
println("\nTEST: (for m in 1:20, n in 0:100")
@time (for m in 1:20, n in 0:100
André(m, n)
end)
# +++ BellNumbers.jl +++
GC.gc()
BellNumberList(5)
println("\nTEST: BellNumberList(1000)")
@time BellNumberList(1000)
println("\nTEST: BellTriangle(100, [1 for _ in 1:100])")
@time BellTriangle(100, [1 for _ in 1:100])
# +++ BernoulliNumbers.jl +++
GC.gc()
println("\nTEST: (for m in 1:10, n in 0:499 BernoulliInt(m, n) end)")
@time (for m in 1:10, n in 0:499 BernoulliInt(m, n) end)
println("\nTEST: (for m in 1:10 BernoulliIntList(m, 500) end)")
@time (for m in 1:10 BernoulliIntList(m, 500) end)
GC.gc()
println("\nTEST: (for n in 0:1000 Bernoulli(n) end)")
@time (for n in 0:1000 Bernoulli(n) end)
println("\nTEST: BernoulliList(1000)")
@time BernoulliList(1000)
println("\nTEST: (for n in 0:1000 V027641(n) end)")
@time (for n in 0:1000 V027641(n) end)
GC.gc()
println("\nTEST: (for n in 0:10000 V195441(n) end)")
@time (for n in 0:10000 V195441(n) end)
# +++ BinaryInteger.jl +++
println("\nTEST: [V295513(k) for k in 0:100000]")
@time [V295513(k) for k in 0:100000]
# +++ BinaryQF.jl +++
GC.gc()
println("\nTEST: L034017(10000)")
@time L034017(10000)
# +++ BooleanOperations.jl +++
# +++ CantorMachines.jl +++
# +++ CarmichaelNumbers.jl +++
println("\nTEST: L = L002997(30)")
@time L = L002997(30)
# +++ ClausenNumbers.jl +++
GC.gc()
println("\nTEST: ClausenNumberList(10000)")
@time ClausenNumberList(10000)
println("\nTEST: (for n in 0:10000")
@time (for n in 0:10000
ClausenNumber(n)
end)
# +++ CombinationsIterator.jl +++
# +++ Compositions.jl +++
GC.gc()
println("\nTEST: LF097805(500)")
@time LF097805(500)
# +++ Counts.jl +++
println("\nTEST: [V257993(n) for n in 1:10000]")
@time [V257993(n) for n in 1:10000]
GC.gc()
println("\nTEST: PrimePiList(10000)")
@time PrimePiList(10000)
# +++ CyclotomicBinaryForms.jl +++
println("\nTEST: L299214(100)")
@time L299214(100)
# +++ DedekindEta.jl +++
println("\nTEST: PartitionNumberList(10000)")
@time PartitionNumberList(10000)
println("\nTEST: L000731(10000)")
@time L000731(10000)
println("\nTEST: RamanujanTauList(10000)")
@time RamanujanTauList(10000)
# +++ DelehamDelta.jl +++
GC.gc()
println("\nTEST: T225478(100)")
@time T225478(100)
println("\nTEST: T055883(100)")
@time T055883(100)
# +++ EulerTransforms.jl +++
println("\nTEST: (for n in 0:150")
@time (for n in 0:150
V107895(n)
end)
# +++ Fibonacci.jl +++
GC.gc()
println("\nTEST: (for n in 1:1000")
@time (for n in 1:1000
V000045(n)
end)
println("\nTEST: (for fib in I000045(10000)")
@time (for fib in I000045(10000)
end)
println("\nTEST: L000045(10000)")
@time L000045(10000)
# +++ FigurativeNumbers.jl +++
println("\nTEST: (for n in 1:1000")
@time (for n in 1:1000
V000326(n)
end)
# +++ GaussFactorials.jl +++
# +++ GeneralizedBinomial.jl +++
println("\nTEST: (for n in 0:10000")
@time (for n in 0:10000
Binomial(2n, n)
end)
println("\nTEST: (for n in -100:100, k in -100:100")
@time (for n in -100:100, k in -100:100
Binomial(n, k)
end)
println("\nTEST: (for k in -10000:10000")
@time (for k in -10000:10000
Binomial(-5, k)
end)
# +++ GeneralizedFibonacci.jl +++
println("\nTEST: (for n in 0:1000 Multinacci(3, n) end)")
@time (for n in 0:1000 Multinacci(3, n) end)
# +++ HighlyAbundant.jl +++
GC.gc()
println("\nTEST: (for n in 1:100 V034885(n) end)")
@time (for n in 1:100 V034885(n) end)
# +++ Hyper1F1.jl +++
GC.gc()
println("\nTEST: (for n in 0:150")
@time (for n in 0:150
V000262(n)
end)
# +++ IntPartitions.jl +++
println("\n-- performance test")
println("\nTEST: for n in 1:50, p in IntegerPartitions(n, byNumPart) p end")
@time for n in 1:50, p in IntegerPartitions(n, byNumPart) p end
println("\nTEST: for n in 1:50, p in IntegerPartitions(n, byMaxPart) p end")
@time for n in 1:50, p in IntegerPartitions(n, byMaxPart) p end
# +++ JacobiTheta.jl +++
println("\nTEST: L000143(100000)")
@time L000143(100000)
println("\nTEST: L035016(100000)")
@time L035016(100000)
# +++ Kolakoski.jl +++
println("\nTEST: I000002(100000)")
@time I000002(100000)
println("\nTEST: KolakoskiList(100000)")
@time KolakoskiList(100000)
# +++ LandauConstants.jl +++
"V001511" |> println
println("\nTEST: for n in 0:100 V001511(n) end")
@time for n in 0:100 V001511(n) end
"V163590" |> println
println("\nTEST: for n in 0:100 V163590(n) end")
@time for n in 0:100 V163590(n) end
"V327492" |> println
println("\nTEST: for n in 0:100 V327492(n) end")
@time for n in 0:100 V327492(n) end
"V005187" |> println
println("\nTEST: for n in 0:100 V005187(n) end")
@time for n in 0:100 V005187(n) end
"V001790" |> println
println("\nTEST: for n in 0:100 V001790(n) end")
@time for n in 0:100 V001790(n) end
"V277233" |> println
println("\nTEST: for n in 0:100 V277233(n) end")
@time for n in 0:100 V277233(n) end
"V327495" |> println
println("\nTEST: for n in 0:100 V327495(n) end")
@time for n in 0:100 V327495(n) end
# +++ NarayanaCows.jl +++
println("\nTEST: (for cow in NarayanasCows(10000)")
@time (for cow in NarayanasCows(10000)
end)
# +++ NumberTheory.jl +++
println("\nTEST: [Divisors(n) for n in 1:10000]")
@time [Divisors(n) for n in 1:10000]
println("\nTEST: [Radical(n) for n in 1:10000]")
@time [Radical(n) for n in 1:10000]
# +++ OEISUtils.jl +++
# +++ OrthoPolynomials.jl +++
GC.gc()
println("\nTEST: T111062(500)")
@time T111062(500)
GC.gc()
println("\nTEST: T066325(500)")
@time T066325(500)
GC.gc()
println("\nTEST: T053120(500)")
@time T053120(500)
# +++ Polynomials.jl +++
# +++ PrimesIterator.jl +++
println("\nTEST: primepi = PrimePi(1000000)")
@time primepi = PrimePi(1000000)
# +++ PrimeSwingFactorial.jl +++
GC.gc()
println("\nTEST: Base.factorial(BigInt(1000000))")
@time Base.factorial(BigInt(1000000))
println("\nTEST: PSfactorial(1000000)")
@time PSfactorial(1000000)
# +++ Products.jl +++
GC.gc()
println("\nTEST: (for n in 1:10000")
@time (for n in 1:10000
F!(n)
end)
GC.gc()
println("\nTEST: (for n in 1:1000")
@time (for n in 1:1000
V000407(n)
end)
GC.gc()
println("\nTEST: (for n in 1:200, k in 1:200")
@time (for n in 1:200, k in 1:200
RisingFactorial(n, k)
end)
# +++ QueensProblems.jl +++
println("\nTEST: L319284(15)")
@time L319284(15)
# +++ RationalTrees.jl +++
GC.gc()
println("\nTEST: EuclidTree(100)")
@time EuclidTree(100)
GC.gc()
println("\nTEST: [SchinzelSierpinskiEncoding(l) for l in EuclidTree(100)]")
@time [SchinzelSierpinskiEncoding(l) for l in EuclidTree(100)]
# +++ RecordSearch.jl +++
# +++ RiordanSquares.jl +++
# +++ SelfConvolutive.jl +++
GC.gc()
println("\nTEST: L005411(500)")
@time L005411(500)
# +++ SeqUtils.jl +++
# +++ SeriesExpansion.jl +++
println("\nTEST: L068875(1000)")
@time L068875(1000)
# +++ SetPartitions.jl +++
# +++ SetPartitionsByShape.jl +++
# +++ SetPartitionsMType.jl +++
# +++ StirlingLahNumbers.jl +++
GC.gc()
println("\nTEST: (for row in I132393(500)")
@time (for row in I132393(500)
end)
GC.gc()
println("\nTEST: (for row in I048993(500)")
@time (for row in I048993(500)
end)
GC.gc()
println("\nTEST: (for row in I271703(500)")
@time (for row in I271703(500)
end)
# +++ SwingFactorial.jl +++
GC.gc()
n = 1000000
println("\nTEST: Base.factorial(BigInt(n))")
@time Base.factorial(BigInt(n))
println("\nTEST: Sfactorial(n)")
@time Sfactorial(n)
println("n = $n")
# +++ Triangles.jl +++
# +++ UlamNumbers.jl +++
GC.gc()
for n in 6:10
println("\nTEST: UlamList(2^n)")
@time UlamList(2^n)
end
# +++ ZumkellerNumbers.jl +++
GC.gc()
println("\nTEST: (for n in 1:2000")
@time (for n in 1:2000
isZumkeller(n)
end)
println("\nTEST: L083207(500)")
@time L083207(500)
stop = Dates.now()
tdiff = stop - start
println("\nJulia version: " * string(VERSION) )
println(start)
println("Total test time: ", tdiff)
end # module
