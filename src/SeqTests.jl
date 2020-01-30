# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module SeqTests

using Test, OEISUtils, SeqUtils
export SeqTest, GenerateAllTest, data_installed

const ShowTest = true

"""

Alias for is_oeis_installed.
"""
data_installed() = is_oeis_installed()

"""

Perform tests for an array of sequences of given type assuming the given offset.
"""
function SeqTest(seqarray, kind, offset = 0)
    if kind == 'V'
        return SeqVTest(seqarray, offset)
    end
    if kind == 'B'
        return SeqBTest(seqarray)
    end
    if kind == 'L'
        return SeqLTest(seqarray)
    end
    if kind == 'T'
        return SeqTTest(seqarray)
    end
    if kind == 'P'
        return SeqPTest(seqarray)
    end

    error("Test function not found!")
end

function SeqVTest(seq, offset = 0)
    name = SeqName(seq)
    O = oeis_local(name, 10)
    S = ZArray(10, seq, offset)
    if ShowTest
        println("V --> ", name)
        println(O)
        println(S)
    end
    @test all(S[1:10] .== O[1:10])
end

function SeqBTest(seqarray)
    for seq ∈ seqarray
        name = SeqName(seq)
        # the parameter is not 'length' but 'search bound'.
        O = oeis_local(name, 12)
        S = seq(300)
        if ShowTest
            println("B --> ", name)
            println(O)
            println(S)
        end
        @test all(S[0:11] .== O[0:11])
    end
end

function SeqLTest(seqarray)
    for seq ∈ seqarray
        name = SeqName(seq)
        O = oeis_local(name, 12)
        S = seq(12)
        if ShowTest
            println("L --> ", name)
            println(O)
            println(S)
        end
        @test all(S .== O)
    end
end

function SeqTTest(seqarray)
    for seq ∈ seqarray
        name = SeqName(seq)
        O = oeis_local(name, 21)
        S = seq(6)
        if ShowTest
            println("T --> ", name)
            println(O)
            println(S)
            # ShowAsΔ(O); ShowAsΔ(S)
        end
        @test all(S .== O)
    end
end

function SeqPTest(seqarray)
    for seq ∈ seqarray
        name = SeqName(seq)
        O = oeis_local(name, 28)
        S = seq(7)
        if ShowTest
            println("P --> ", name)
            ShowAsΔ(O)
            ShowAsΔ(S)
        end
    end
end

"""

Test to generate sequences from a given list of sequences.
"""
function GenerateAllTest(A::Array{Function,1})
    err = String[]
    for a ∈ A
        stra = string(a)
        stra * " " |> print
        try
            if startswith(stra, 'L')
                a(10) |> println
            elseif startswith(stra, "TL")
                if applicable(a, 1)
                    for k ∈ 0:4 a(k) |> println end
                else
                    for k ∈ 0:4 a(0, k) |> println end
                    for k ∈ 0:4 a(2, k) |> println end
                end
            elseif startswith(stra, 'T')
                reduce(vcat, [row for row in a(5)]) |> println
            elseif startswith(stra, "is")
                [a(k) for k ∈ 0:12] |> println
                [k for k ∈ 0:12 if a(k)] |> println
            elseif startswith(stra, 'I')
                collect(a(6)) |> println
            elseif startswith(stra, 'F')
                collect(IterTools.takewhile(k -> k <= 20, a(21))) |> println
            elseif startswith(stra, 'P')
                for k ∈ 0:4 a(k) |> println end
            elseif startswith(stra, 'R')
                [a(Float64(k)) for k ∈ 0:4] |> println
            elseif startswith(stra, 'G')
                Coefficients(a, 6) |> println
            elseif startswith(stra, 'M')
                a(6) |> println
            elseif startswith(stra, 'V')
                if applicable(a, 1)
                    [a(k) for k ∈ 0:6] |> println
                else
                    [a(0, k) for k ∈ 0:6] |> println
                    [a(2, k) for k ∈ 0:6] |> println
                end
            else
                if applicable(a, 1)
                    [a(k) for k ∈ 0:6] |> println
                else
                    [a(0, k) for k ∈ 0:6] |> println
                    [a(2, k) for k ∈ 0:6] |> println
                end
            end
        catch
            "ERROR!" |> println
            push!(err, stra)
        end
    end
    numerr = length(err)
    if numerr > 0
        @warn(numerr, " errors found:")
        for e ∈ err println(e) end
    end
    return numerr
end

#START-TEST-########################################################

using Test

function test()
    @testset "GenerateAll" begin
        #global SEQUENCES
        #@test GenerateAllTest(SEQUENCES) == 0
        #GenerateAllTest(SEQUENCES)
    end
end

function demo()
end

function perf()
end

function main()
    #test()
    demo()
    perf()
end

main()

end # module
