# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

#=
Unfortunately their is a bug in NEMO/flint2/libgmp (at least in the Windows version).
gmp: overflow in mpz type
The bug has been reported several times.

 # --------------------

Please submit a bug report with steps to reproduce this fault, and any error messages that follow (in their entirety). Thanks.
Exception: EXCEPTION_ACCESS_VIOLATION at 0x18ecbc76 -- __gmpn_mul_1_x86_64 at C:\Users\Home\AppData\Local\Julia-1.3.0-rc4\bin\libgmp-10.dll (unknown line)
in expression starting at C:\Users\Home\JuliaProjects\IntegerSequences.jl\src\BernoulliNumbers.jl:258
__gmpn_mul_1_x86_64 at C:\Users\Home\AppData\Local\Julia-1.3.0-rc4\bin\libgmp-10.dll (unknown line)
jl_makecontext at C:\Users\Home\AppData\Local\Julia-1.3.0-rc4\bin\libjulia.dll (unknown line)
unknown function (ip: 000000000000001D)
Allocations: 97879032 (Pool: 97864154; Big: 14878); GC: 115

 # --------------------

Welcome to Nemo version 0.15.1

Nemo comes with absolutely no warranty whatsoever

gmp: overflow in mpz type

signal (22): SIGABRT
in expression starting at C:\Users\Home\JuliaProjects\IntegerSequences.jl\src\BernoulliNumbers.jl:270
crt_sig_handler at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\signals-win.c:91
raise at C:\WINDOWS\System32\msvcrt.dll (unknown line)
abort at C:\WINDOWS\System32\msvcrt.dll (unknown line)
__gmp_default_alloc_overflow at C:\Users\Home\AppData\Local\Julia-1.3.0-rc4\bin\libgmp-10.dll (unknown line)
.text at C:\Users\Home\AppData\Local\Julia-1.3.0-rc4\bin\libgmp-10.dll (unknown line)
.text at C:\Users\Home\AppData\Local\Julia-1.3.0-rc4\bin\libgmp-10.dll (unknown line)
flint_mpz_mul_si at /workspace/srcdir/flint2/fmpz/workspace/srcdir/flint2\gmpcompat.h:117 [inlined]
fmpz_mul_si at /workspace/srcdir/flint2/fmpz\mul_si.c:43
* at C:\Users\Home\.julia\packages\Nemo\qzx0m\src\flint\fmpz.jl:365
* at C:\Users\Home\.julia\packages\Nemo\qzx0m\src\flint\fmpz.jl:370 [inlined]
BernoulliInt at C:\Users\Home\JuliaProjects\IntegerSequences.jl\src\BernoulliNumbers.jl:49 [inlined]
macro expansion at C:\Users\Home\JuliaProjects\IntegerSequences.jl\src\BernoulliNumbers.jl:185 [inlined]
macro expansion at C:\cygwin\home\Administrator\buildbot\worker\package_win64\build\usr\share\julia\stdlib\v1.3\Test\src\Test.jl:1107 [inlined]
test at C:\Users\Home\JuliaProjects\IntegerSequences.jl\src\BernoulliNumbers.jl:184
main at C:\Users\Home\JuliaProjects\IntegerSequences.jl\src\BernoulliNumbers.jl:265
unknown function (ip: 0000000017BB4B03)
_jl_invoke at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\gf.c:2136 [inlined]
jl_apply_generic at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\gf.c:2300
jl_apply at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\julia.h:1631 [inlined]
do_call at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\interpreter.c:328
eval_value at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\interpreter.c:417
eval_stmt_value at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\interpreter.c:368 [inlined]
eval_body at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\interpreter.c:764
jl_interpret_toplevel_thunk_callback at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\interpreter.c:888
unknown function (ip: FFFFFFFFFFFFFFFE)
unknown function (ip: 0000000012CCDE8F)
unknown function (ip: FFFFFFFFFFFFFFFF)
jl_toplevel_eval_flex at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\toplevel.c:814
jl_eval_module_expr at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\toplevel.c:181
jl_toplevel_eval_flex at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\toplevel.c:640
jl_parse_eval_all at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\ast.c:873
include_string at .\loading.jl:1075
#139 at C:\Users\Home\.julia\packages\Atom\lBERI\src\eval.jl:138
withpath at C:\Users\Home\.julia\packages\CodeTools\xGemk\src\utils.jl:30
_jl_invoke at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\gf.c:2136 [inlined]
jl_apply_generic at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\gf.c:2300
withpath at C:\Users\Home\.julia\packages\Atom\lBERI\src\eval.jl:47
#138 at C:\Users\Home\.julia\packages\Atom\lBERI\src\eval.jl:135 [inlined]
with_logstate at .\logging.jl:395
with_logger at .\logging.jl:491 [inlined]
#137 at C:\Users\Home\.julia\packages\Atom\lBERI\src\eval.jl:134 [inlined]
hideprompt at C:\Users\Home\.julia\packages\Atom\lBERI\src\repl.jl:85
_jl_invoke at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\gf.c:2136 [inlined]
jl_apply_generic at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\gf.c:2300
macro expansion at C:\Users\Home\.julia\packages\Atom\lBERI\src\eval.jl:133 [inlined]
macro expansion at C:\Users\Home\.julia\packages\Media\ItEPc\src\dynamic.jl:24 [inlined]
#136 at C:\Users\Home\.julia\packages\Atom\lBERI\src\eval.jl:122
_jl_invoke at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\gf.c:2136 [inlined]
jl_apply_generic at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\gf.c:2300
handlemsg at C:\Users\Home\.julia\packages\Atom\lBERI\src\comm.jl:164
unknown function (ip: 0000000017B73432)
_jl_invoke at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\gf.c:2130 [inlined]
jl_apply_generic at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\gf.c:2300
jl_apply at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\julia.h:1631 [inlined]
jl_f__apply at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\builtins.c:627
#19 at .\task.jl:333
unknown function (ip: 0000000017B6FCAE)
_jl_invoke at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\gf.c:2130 [inlined]
jl_apply_generic at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\gf.c:2300
jl_apply at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\julia.h:1631 [inlined]
start_task at /home/Administrator/buildbot/worker/package_win64/build/src/home/Administrator/buildbot/worker/package_win64/build/src\task.c:659
Allocations: 32613597 (Pool: 32606222; Big: 7375); GC: 36
=#

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module BernoulliNumbers
using Nemo, NumberTheory, PrimesIterator, AndreNumbers, ClausenNumbers, Products

export ModuleBernoulliNumbers
export BernoulliInt, BernoulliIntList, Bernoulli, BernoulliList
export V195441, V065619, V281586, V281588, V027641, L065619

"""
We are primarily concerned with the integer Bernoulli numbers.

Cf. ``A000182 (m=2), A293951 (m=3), A273352 (m=4), A318258 (m=5).``

```
[1] [0, 1,    0,       0,             0,                  0]
[2] [0, 1,   -2,      16,          -272,               7936]
[3] [0, 1,   -9,     477,        -74601,           25740261]
[4] [0, 1,  -34,   11056,     -14873104,        56814228736]
[5] [0, 1, -125,  249250,   -2886735625,    122209131374375]
[6] [0, 1, -461, 5699149, -574688719793, 272692888959243481]
```

The rational Bernoulli numbers are defined here with ``B(1) = 1/2``. Why this is preferred over ``B(1) = -1/2`` is explained in the [Bernoulli Manifesto](http://luschny.de/math/zeta/The-Bernoulli-Manifesto.html).

* BernoulliInt, BernoulliIntList, Bernoulli, BernoulliList
* V195441, V065619, V281586, V281588, V027641, L065619
"""
const ModuleBernoulliNumbers = ""

"""
Return the generalized integer Bernoulli numbers ``b_{m}(n) = n × ``André``(m, n-1)``.
"""
BernoulliInt(m::Int, n::Int) = n == 0 ? ZZ(0) : n * André(m, n - 1)

"""
Return the number of down-up permutations w on ``[n+1]`` such that ``w_2 = 1``.
"""
V065619(n::Int) = BernoulliInt(2, n)

"""
Return the generalized integer Bernoulli numbers ``b_{3}(n) = n × ``André``_{3}(n-1)``.
"""
V281586(n::Int) = BernoulliInt(3, n)

"""
Return the generalized integer Bernoulli numbers ``b_{4}(n) = n × `` André``_{4}(n-1)``.
"""
V281588(n::Int) = BernoulliInt(4, n)

"""
Return a list of length `len` of the integer Bernoulli numbers ``b_{m}(n)`` using Seidel's boustrophedon algorithm.
"""
function BernoulliIntList(m::Int, len::Int)
    len ≤ 0 && return fmpz[]
    R = zeros(ZZ, len)
    len == 1 && return R
    R[2] = 1
    len == 2 && return R
    A = zeros(ZZ, len)
    A[1] = 1; A[2] = 1

    for n ∈ 1:len - 2
        if n % m ≠ 0
            for i ∈ n:-1:1 A[i] += A[i + 1] end
            C = A[1]
        else
            C = 0
            for i ∈ 1:(n + 2) A[i], C = C, A[i]; C = A[i] - C end
        end
        R[n + 2] = C
    end
    R
end

"""
Computes a list of length `len` of the integer Bernoulli numbers ``b_{2}(n)`` using Seidel's boustrophedon algorithm.
"""
function L065619(len::Int)
    len ≤ 0  && return fmpz[]
    R  = zeros(ZZ, len)
    len == 1 && return R[0]
    len == 2 && (R[0, 1] = 1; return R)

    A = Dict{Int,fmpz}(-1 => 1, 0 => 0)
    k = 0; e = 1
    for i ∈ 0:len - 1
        Am = 0; A[k + e] = 0; e = -e
        for j ∈ 0:i
            Am += A[k]; A[k] = Am; k += e
        end
        j = e < 0 ? div(-i, 2) : div(i, 2)
        R[i+1] = A[j]
    end
    R
end

"""
Return the rational Bernoulli number ``B_n``  (cf. A027641/A027642).
"""
function Bernoulli(n::Int)
    isOdd(n) && (n == 1 ? (return fmpq(1, 2)) : (return fmpq(0, 1)))
    n == 0 && return fmpq(1, 1)
    denom = ^(ZZ(4), n) - ^(ZZ(2), n)
    fmpq(BernoulliInt(2, n), denom)
end

"""
Return a list of the first `len` Bernoulli numbers ``B_n`` (cf. A027641/A027642).
"""
function BernoulliList(len::Int)
    if len ≤ 0 return fmpq[] end
    R = zeros(QQ, len)
    R[1] = fmpq(1, 1); len == 1 && return R
    R[2] = fmpq(1, 2); len == 2 && return R

    A = Dict{Int,fmpz}(0 => 1, -2 => 0, -1 => 1, 1 => 0)
    a = fmpz(12); b = fmpz(240)
    k = e = 1

    for i ∈ 2:len - 1
        Am = 0; A[k + e] = 0; e = -e
        for j ∈ 0:i
            Am += A[k]; A[k] = Am; k += e
        end
        if e > 0
            R[i + 1] = fmpq(0, 1)
        else
            d = i >> 1
            R[i + 1] = isEven(d) ? fmpq(-A[-d], a) : fmpq(A[-d], a)
            a, b = b, b << 4 + b << 2 - a << 6
        end
    end
    R
end

"""
Return the numerator of the Bernoulli number ``B_n``.
"""
function V027641(n::Int)
    isOdd(n) && (n == 1 ? (return ZZ(-1)) : return ZZ(0))
    n == 0 && return ZZ(1)
    denom = ^(ZZ(4), n) - ^(ZZ(2), n)
    Nemo.numerator(BernoulliInt(2, n) // denom)
end

# We could also define the denominator of the Bernoulli number as
#    V027642(n::Int) = denominator(Bernoulli(n))
# however V027642 is implemented more efficiently via the
# Clausen numbers (see the module "Clausen").

"""
Return denominator(Bernoulli ``_{n+1}(x) - `` Bernoulli ``_{n+1})``.
"""
function V195441(n::Int)
    n < 4 && return ZZ([1, 1, 2, 1][n + 1])
    P = Primes(2, div(n + 2, 2 + n % 2))
    ∏([p for p ∈ P if p ≤ sum(digits(n + 1, base=Int(p)))])
end

#START-TEST-########################################################

using Test, SeqTests

function test()

    @testset "BernoulliNum" begin

        @test BernoulliInt(2, 10) == ZZ(79360)
        @test BernoulliInt(3, 30) == ZZ(-7708110416280010548302670)
        @test BernoulliInt(4, 40) == ZZ(-44494882577309421077208834962882560)

        @test isa(BernoulliInt(3, 30), Nemo.fmpz)
        @test isa(BernoulliIntList(2, 20)[end], Nemo.fmpz)
        @test isa(Bernoulli(0), Nemo.fmpq)

        @test isa(V027641(10), Nemo.fmpz)
        @test isa(V195441(10), Nemo.fmpz)

        for m ∈ 1:20
            @test BernoulliInt(m, 200) == BernoulliIntList(m, 200 + 1)[end]
        end

        for n ∈ 0:20
            @test denominator(Rational(Bernoulli(2 * n))) == ClausenNumber(n)
        end

        t = ZZ(8622529719094842064796322984685715031642180319435676189471082876882585178647210)
        @test V195441(10000) == t

        # A065619 in the OEIS has an arbitrary offset of 1.
        l = fmpz[0, 1, 2, 3, 8, 25, 96, 427, 2176]
        @test all(L065619(9) .== l)

        if is_oeis_installed()
            V = [V195441, V281586, V281588, V027641]
            for v ∈ V SeqTest(v, 'V') end
        end
    end
end

function demo()
    println("\nGeneralized integer Bernoulli numbers BernoulliInt(m, n):")
    for m ∈ 1:5
        println([BernoulliInt(m, n) for n ∈ 0:10])
    end
    println("\nGeneralized integer Bernoulli numbers BernoulliInt(3, n):")
    for len ∈ 1:6
        println(BernoulliIntList(3, len))
    end
    println("\nClassical rational Bernoulli numbers:")
    for n ∈ 0:20
        print(fmpq(Nemo.numerator(Bernoulli(n)), Nemo.denominator(Bernoulli(n))), ", ")
    end
    println()
end

"""
Since the BernoulliInts are cached via the André numbers the benchmarks below
depend on the cache history.

for m ∈ 1:10, n ∈ 0:499 BernoulliInt(m,n) end
    0.983624 seconds (1.67 M allocations: 36.160 MiB, 9.71% gc time)
for m ∈ 1:10 BernoulliIntList(m,500) end
    0.504717 seconds (1.26 M allocations: 19.258 MiB)
for n ∈ 0:1000 Bernoulli(n) end
    1.104452 seconds (946.74 k allocations: 20.252 MiB)
BernoulliList(1000)
    0.789146 seconds (508.75 k allocations: 7.891 MiB, 11.06% gc time)
for n ∈ 0:1000 V027641(n) end
    0.005921 seconds (7.74 k allocations: 144.313 KiB)
for n ∈ 0:10000 V195441(n) end
    0.881609 seconds (3.49 M allocations: 330.094 MiB, 26.84% gc time)
"""
function perf()
    GC.gc()
    @time (for m ∈ 1:10, n ∈ 0:499 BernoulliInt(m, n) end)
    @time (for m ∈ 1:10 BernoulliIntList(m, 500) end)

    GC.gc()
    @time (for n ∈ 0:1000 Bernoulli(n) end)
    @time BernoulliList(1000)
    @time (for n ∈ 0:1000 V027641(n) end)

    GC.gc()
    @time (for n ∈ 0:10000 V195441(n) end)
end

function main()
    test()
    demo()
    perf()
end

# main()

end # module

# [0] 0, 1,  2, 3,  4,  5,    6,    7,     8,     9,     10
# [1] 0, 1, -2, 3, -4,  5,   -6,    7,    -8,     9,    -10
# [2] 0, 1, 2, -3, -8,  25,  96, -427, -2176, 12465,  79360
# [3] 0, 1, 2,  3, -4, -15, -54,  133,   792,  4293, -15130
# [4] 0, 1, 2,  3,  4,  -5, -24,  -98,  -272,   621,   4960
# [5] 0, 1, 2,  3,  4,   5,  -6,  -35,  -160,  -495,  -1250
