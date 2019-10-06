# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module KamtschatkaNumbers

using Base
export Kamchatka

"""

General description of the module goes here.

* All exported functions are listed here.
"""
const ModuleKamchatka = ""

"""

Return the ``n``-th Kamchatka number.
"""
Kamchatka(n) = 0

#START-TEST-########################################################

using Test

function test()
    @testset "Kamchatka" begin
        @test Kamchatka(0) == 0
    end
end

function demo()
end

function perf()
end

function main()
    test()
    demo()
    perf()
end

main()

end # module
