# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module CarmichaelNumbers

using Nemo, NumberTheory, Counts
export isCarmichael, I002997, F002997, L002997

"""
Is ``n`` a Carmichael/Šimerka number?
"""
function isCarmichael(n)
    (n == 1 || isEven(n) || isPrime(n)) && return false
    factors = Factors(n)
    for f in factors
        (f[2] > 1 || (n - 1) % (f[1] - 1) != 0) && return false
    end
    return true
end

"""
Iterate over the first n Carmichael/Šimerka numbers.
"""
I002997(n) = takefirst(isCarmichael, n)

"""
Iterate over the Carmichael/Šimerka numbers which do not exceed n.
"""
F002997(n) = filter(isCarmichael, 1:n)

"""
Return the first n Carmichael/Šimerka numbers in an array.
"""
L002997(n) = collect(I002997(n))

#START-TEST-########################################################

using Test

function test()
    @testset "Carmichael" begin
        @test ! isCarmichael(560)
        @test isCarmichael(561)
        @test ! isCarmichael(563)
    end
end

function demo()
    for n in 1:30000
        isCarmichael(n) && println(n)
    end

    println()
    for v in I002997(20)
        println(v)
    end
end

"""
@time L = L002997(30)
0.967192 seconds (4.01 M allocations: 248.863 MiB, 28.97% gc time)
"""
function perf()
    @time L = L002997(30)
end

function main()
    test()
    demo()
    perf()
end

main()

end # module
