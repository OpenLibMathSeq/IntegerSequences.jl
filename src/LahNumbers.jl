# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module LahNumbers

using Nemo
export Lah, LahTriangle

"""

* Posets: Partially ordered sets (posets) on n elements that consist entirely of k chains (nonempty, linearly ordered subsets).

* Set partitions: Number of ways to split {1,..,n} into an ordered collection of n+1-k nonempty sets that are noncrossing).

* Dyck paths: Dyck n-paths with n+1-k peaks labeled 1,2,..n+1-k in some order.

See [Lah numbers] (http://olms.onl/Lah/)

* Lah, LahTriangle
"""
const ModuleLah = ""

"""

Return the ``n``-th row of the Lah number triangle.
"""
function Lah(n)
    haskey(CacheLah, n) && return CacheLah[n]
    prevrow = Lah(n-1)
    row = Array{fmpz,1}(undef, n+1)
    row[1] = ZZ(0); row[n+1] = ZZ(1)
    for k in 2:n
        row[k] = prevrow[k-1] + prevrow[k]*(n+k-2)
    end
    CacheLah[n] = row
end

const CacheLah = Dict{Int, Array{fmpz,1}}([0 => [fmpz(1)]])

"""

Return the ``k``-th term of the ``n``-th row of the Lah number triangle.
"""
Lah(n, k) = Lah(n+1)[k+1]

"""

Return the unsigned Lah number triangle. (A271703)
"""
function LahTriangle(size)
    length(CacheLah) < size && Lah(size)
    [CacheLah[n] for n in 0:size-1]
end

#START-TEST-########################################################

using Test

Sum(itr)     = isempty(itr) ? 0 : sum(itr)
RowSum(T)    = [Sum(row) for row in T]
EvenSum(T)   = [Sum(R[r] for r in 1:2:length(R)) for R in T]
OddSum(T)    = [Sum(R[r] for r in 2:2:length(R)) for R in T]
AltrowSum(T) = EvenSum(T) - OddSum(T)

function test()
    @testset "Lah" begin
        @test Lah(7) == [0, 5040, 15120, 12600, 4200, 630, 42, 1]
    end
end

function demo()
    Lah(7) |> println
    typeof(Lah(7)) |> println
    LahTriangle(7) |> println
    typeof(LahTriangle(7)) |> println
end

function perf()
    @time Lah(1000)
    @time RowSum(LahTriangle(1000))
end

function main()
    test()
    demo()
    perf()
end

main()

end # module
