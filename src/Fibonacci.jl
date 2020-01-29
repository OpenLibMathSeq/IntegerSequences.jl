# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module Fibonacci

using Nemo, IterTools

export ModuleFibonacci
export I000045, F000045, L000045, V000045, R000045, is000045, L039834

"""

* I000045, F000045, L000045, V000045, R000045, is000045
"""
const ModuleFibonacci = ""

struct FiboIterate
    length
end

function Base.iterate(I::FiboIterate)
    I.length == 0 && return nothing
    state = (fmpz(0), (fmpz(0), fmpz(1), fmpz(1)))
end

function Base.iterate(I::FiboIterate, (a, b, c))
    c >= I.length && return nothing
    (b, (b, a + b, c + 1))
end

Base.length(f::FiboIterate) = f.length
Base.eltype(f::FiboIterate) = fmpz

"""

Iterate over the first ``n`` Fibonacci numbers.
"""
I000045(n) = FiboIterate(n)

"""

Iterate over the Fibonacci numbers which do not exceed ``n``.
"""
F000045(n) = IterTools.takewhile(k -> k <= n, FiboIterate(n + 1))

"""

Return the first ``n`` Fibonacci numbers in an array.
"""
L000045(n) = Base.collect(FiboIterate(n))

"""

Return the ``n``-th Fibonacci number.
"""
function V000045(n)
    F = fmpz[1 1; 1 0]
    Fn = F^n
    Fn[2, 1]
end

"""

Return the ``n``-th Fibonacci number, explicite formula by Paul Hankin.
"""
function HankinFibonacci(n)
    n < 2 && return n
    a = <<(fmpz(4), (n - 1) * (n + 2))
    b = <<(fmpz(4), 2 * (n - 1))
    c = <<(fmpz(2), n - 1)
    div(a, b - c - 1) & (c - 1)
end

"""

Fibonacci function for real values, returns a Float64.
"""
function R000045(x::Float64)
    (Base.MathConstants.golden^x -
     cos(x * Base.MathConstants.pi) * Base.MathConstants.golden^(-x)) / sqrt(5)
end

"""

Query if ``n`` is a Fibonacci number, returns a Bool.
"""
function is000045(n)
    d = 0
    for f ∈ FiboIterate(n + 2)
        d = n - f
        d <= 0 && break
    end
    d == 0
end

"""

Return the signed Fibonacci numbers, dubbed negaFibonacci numbers.
"""
function L039834(n)
    L = Array{fmpz,1}(undef, n)
    x, y = 1, 1
    for n in 1:n
        L[n] = x
        x, y = y, x - y
    end
    L
end

#START-TEST-########################################################

using Test

function test()
    @testset "Fibonacci" begin
        @test isa(V000045(30), fmpz)
    end
end

function demo()
    println("V000045")
    for n ∈ 0:12
        print(V000045(n), ", ")
    end
    println()

    println("I000045")
    for f ∈ I000045(20)
        print(f, ", ")
    end
    println()

    println("F000045")
    for f ∈ F000045(20)
        print(f, ", ")
    end
    println()

    println("L000045")
    print(L000045(17))
    println()

    println("R000045")
    println([R000045(Float64(x / 2 + 0.5)) for x ∈ 0:9])
    println(typeof(R000045(2 + 0.5)))

    println("is000045")
    for n ∈ 0:150
        is000045(n) && print(n, " ")
    end
    println()
end

"""

for n ∈ 1:1000 V000045(n) end
    0.004861 seconds (8.49 k allocations: 320.141 KiB)
for fib ∈ I000045(10000) end
    0.006211 seconds (40.00 k allocations: 937.547 KiB)
L000045(10000)
    0.006533 seconds (49.49 k allocations: 1.137 MiB)
"""
function perf()
    GC.gc()
    @time (for n ∈ 1:1000
        V000045(n)
    end)
    @time (for fib ∈ I000045(10000)
    end)
    @time L000045(10000)
    # println("----")
    # @time (for n ∈ 1:1000 HankinFibonacci(n) end)
end

function main()
    test()
    demo()
    perf()
end

#main()
L039834(12) |> println

end # module

#=

Test Summary: | Pass  Total
Fibonacci     |    1      1

0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144,
0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181,

fmpz[0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987]

[0.568864, 1.0, 0.920442, 1.0, 1.48931, 2.0, 2.40975, 3.0, 3.89906, 5.0]

  0.323110 seconds (13.20 k allocations: 206.234 KiB)
  0.007040 seconds (40.00 k allocations: 937.547 KiB)
  0.006942 seconds (49.49 k allocations: 1.137 MiB)

=#

### EOF ############################################################

#= COMMENTS ########################################################
# An alternative implementation mimicking Python's elegant way with yield:

using ResumableFunctions

@resumable function fibonnaci(n::Int) :: Int
  a, b = 0, 1
  for i ∈ 1:n-1
    @yield a
    a, b = b, a + b
  end
  a
end

for fib ∈ fibonnaci(10)
    println(fib)
end

=#
