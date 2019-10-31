# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module SpigotPi

export Pi, π, L000796

"""
Computes the first n decimal digits of Pi, uses a variant of the spigot algorithm valid as long as the number of digits <= 54900.

Based on ideas of A. Sale (1968). Algorithm due to D. Saada (1988) and S. Rabinowitz (1991). Proof due to S. Rabinowitz and S. Wagon (1995).

https://www.maa.org/sites/default/files/pdf/pubs/amm_supplements/Monthly_Reference_12.pdf

* Pi, π, L000796
"""
const ModuleSpigotPi = ""

"""

Return the decimal expansion of π up to ``n`` digits as a string.
Note the feature that the precision is increased only in steps of 4, i.e. only if ``n`` is divisible by 4. If ``n`` is not divisible by 4 then the number of digits in the output is rounded down to the largest number divisible by 4 smaller than ``n``.
# Examples
```julia-repl
julia> Pi(8)
31415926
julia> Pi(10)
31415926
julia> Pi(12)
314159265358
```
"""
function Pi(digits::Int)
    digits > 54900 && throw(ValueError("digits must be <= 54900"))

    buf = IOBuffer()
    zero = [ "0", "00", "000" ]
    c = (digits >> 2 + 1) * 14
    a = fill(20000000, c)
    d, f = 0, 10000

    while (b = c -= 14) > 0
        d = e = d % f
        while (b -= 1) > 0
            d = d * b + a[b]
            g = (b << 1) - 1
            a[b] = (d % g) * f
            d = div(d, g)
        end
        r = e + div(d, f)
        r < 1000 && print(buf, zero[r > 99 ? 1 : r > 9 ? 2 : 3])
        print(buf, r)
    end
    return String(take!(buf))
end

"""

Return the decimal expansion of π up to ``n`` digits as a string. (Note what the docstring of 'Pi'' says about the number of digits in the output.)
# Examples
```julia-repl
julia π(100)[100]
7
```
"""
π(digits) = Pi(digits)

"""

Return the decimal expansion of π up to ``n`` digits as a string. (Note what the docstring of 'Pi'' says about the number of digits in the output.)
"""
L000796(digits) = Pi(digits)

#START-TEST-########################################################

using Test

function test()
    @testset "Pi" begin
        @test Pi(12) == "314159265358"
        @test Pi(100)[100] == '7'
    end
end

function demo()
    π(1600) |> println
end

function perf()
    @time Pi(1600)
end

function main()
    test()
    demo()
    perf()
end

main()

end # module
