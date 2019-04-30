# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

# Another demo for Julia's iteration protokoll.
# Also demonstrates the layout of Sequences-modules.

module NarayanaCows
using IterTools
export NarayanasCows, L214551

"""
The type object to construct a new instance of the modified Narayanas cows sequence with given length.
"""
struct NarayanasCows
    length
end

"""
Return the first term of the modified Narayanas cows sequence.
"""
function Base.iterate(I::NarayanasCows)
    I.length == 0 && return nothing
    state = (1, (0, 0, 1, 1))
end

"""
Return the next term of the modified Narayanas cows sequence.
"""
function Base.iterate(I::NarayanasCows, (x, y, z, c))
    c >= I.length && return nothing
    x = div(z + x, gcd(z, x))
    (x, (y, z, x, c + 1))
end

Base.length(f::NarayanasCows) = f.length
Base.eltype(f::NarayanasCows) = Int

"""
Return a list of the first n terms of the modified Narayanas cows sequence.
"""
L214551(n) = collect(NarayanasCows(n))

#START-TEST-########################################################

using Test, SeqUtils

function test()
    @testset "Narayana" begin
        @test IterTools.nth(NarayanasCows(12), 12) == 5
    end
end

function demo()
    for cow in NarayanasCows(20)
        print(cow, ", ")
    end
    println()

    L214551(20) |> println
    println()

    SeqShow(L214551(20))
end

function perf()
    @time (for cow in NarayanasCows(10000) end)
end

function main()
    test()
    demo()
    perf()
end

main()

end # module
