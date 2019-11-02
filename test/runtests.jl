tstdir = realpath(joinpath(dirname(@__FILE__)))
srcdir = joinpath(dirname(tstdir), "src")
tstdir ∉ LOAD_PATH && push!(LOAD_PATH, tstdir)
srcdir ∉ LOAD_PATH && push!(LOAD_PATH, srcdir)
module runtests
using Nemo, Test, SeqTests, IntegerSequences, IterTools, DataStructures

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

        #if is_oeis_installed()
        #    V = [V195441, V281586, V281588, V027641]
        #    for v ∈ V SeqTest(v, 'V') end
        #end
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

main()

end # module
