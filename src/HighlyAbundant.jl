# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module HighlyAbundant

using IterTools, NumberTheory, RecordSearch

export ModuleHighlyAbundant
export I002093, F002093, L002093, V002093
export I034885, F034885, L034885, V034885

"""

* I002093, F002093, L002093, V002093, I034885, F034885, L034885, V034885
"""
const ModuleHighlyAbundant = ""

# -----------------------------------------------------------------
# Indices!

"""

Iterate over the first ``n`` highly abundant numbers.
"""
I002093(n) = Records(σ, n, true, true)

"""

Iterate over the highly abundant numbers which do not exceed ``n`` (``1 ≤ i ≤ n``).
"""
F002093(n) = Records(σ, n, false, true)

"""

Return the first ``n`` highly abundant numbers as an array.
"""
L002093(n) = collect(I002093(n))

"""

Return the ``n``-th highly abundant number. Indexing starts with 1.
"""
V002093(n) = nth(I002093(n), n)
# V002093(n) = nth(I002093(n+1), n+1) Indexing starts at 0


# -----------------------------------------------------------------
# Values!

"""

Iterate over the first ``n`` record values of sigma.
"""
I034885(n) = Records(σ, n, true, false)

"""

Iterate over the record values of sigma the indices of which do not exceed ``n`` (``1 ≤ r ≤ n``).
"""
F034885(n) = Records(σ, n, false, false)

"""

Return the first ``n`` record values of sigma as an array.
"""
L034885(n) = collect(I034885(n))

"""

Return the ``n``-th record of sigma. Indexing starts with 1.
"""
V034885(n) = nth(I034885(n), n)
# V034885(n) = nth(I034885(n+1), n+1) Indexing starts at 0.

#START-TEST-########################################################

function test() end

function demo()
    # 1, 2, 3, 4, 6, 8, 10, 12, 16, 18, 20, 24, 30, 36, 42, 48, 60, ...

    println("\nIterate over the first 20 highly abundant numbers.")
    for r ∈ I002093(20)
        print(r, ", ")
    end
    println("...")

    println("\nReturn the first 20 highly abundant numbers as an array.")
    println(L002093(20))

    println("\nIterate over the highly abundant numbers which do not exceed 20.")
    for r ∈ F002093(20)
        print(r, ", ")
    end
    println("...")

    println("\nReturn the 9-th highly abundant number.")
    println("9 -> ", V002093(9))
    println()

    # 1, 3, 4, 7, 12, 15, 18, 28, 31, 39, 42, 60, 72, 91, 96, 124, 168, ...

    println("\nIterate over the first 20 record values of sigma.")
    for r ∈ I034885(20)
        print(r, ", ")
    end
    println("...")

    println("\nReturn the first 20 record values of sigma as an array.")
    println(L034885(20))

    println("\nIterate over the record values of sigma the indices of which do not exceed 20.")
    for r ∈ F034885(20)
        print(r, ", ")
    end
    println("...")

    println("\nReturn the 9-th record of sigma.")
    println("9 -> ", V034885(9))
    println()
end

"""

for n ∈ 1:100 V034885(n)
    0.433958 seconds (802.79 k allocations: 12.632 MiB)
"""
function perf()
    GC.gc()
    @time (for n ∈ 1:100 V034885(n) end)
end

function main()
    test()
    demo()
    perf()
end

main()

end # module

#=
Iterate over the first 20 highly abundant numbers.
1, 2, 3, 4, 6, 8, 10, 12, 16, 18, 20, 24, 30, 36, 42, 48, 60, 72, 84, 90, ...

Return the first 20 highly abundant numbers as an array.
fmpz[1, 2, 3, 4, 6, 8, 10, 12, 16, 18, 20, 24, 30, 36, 42, 48, 60, 72, 84, 90]

Iterate over the highly abundant numbers which do not exceed 20.
1, 2, 3, 4, 6, 8, 10, 12, 16, 18, 20, ...

Return the 9-th highly abundant number. (Indexing starts at 1.)
9 -> 16

Iterate over the first 20 record values of sigma.
1, 3, 4, 7, 12, 15, 18, 28, 31, 39, 42, 60, 72, 91, 96, 124, 168, 195, 224, 234, ...

Return the first 20 record values of sigma as an array.
fmpz[1, 3, 4, 7, 12, 15, 18, 28, 31, 39, 42, 60, 72, 91, 96, 124, 168, 195, 224, 234]

Iterate over the record values of sigma the indices of which do not
exceed 20.
1, 3, 4, 7, 12, 15, 18, 28, 31, 39, 42, ...

Return the 9-th record of sigma. (Indexing starts at 1.)
9 -> 31

0.418483 seconds (842.91 k allocations: 13.243 MiB)
 =#
