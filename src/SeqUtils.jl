# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module SeqUtils

using Nemo

export ModuleSeqUtils
export SeqShow, SeqPrint, SeqName, SeqNum, Println, ZArray, Nemofmpz

"""

Nemo is a library designed, developed and maintained by William Hart with the help of others. Many functions in our project are based on Nemo.
"""
const ModuleSeqUtils = ""

"""

The basic integer type of our project is 'Nemo.fmpz'. Think of a 'Nemo.fmpz' as a 'BigInt'. 'fmpz' stands for 'fast multiple precision zahl' (zahl=integer). The mathematical symbol for the ring of integers is the blackboard (double-struck) Z, also written ZZ. In reference to this ZZ(n) defines the integer n as a fmpz.
"""
function Nemofmpz(n::Int)
    return ZZ(n)
end

"""

Return an array of type `fmpz` of length ``n`` preset with ``0``.
"""
ZArray(len::Int) = zeros(ZZ, len)

"""

Return an array of type fmpz and of size ``n`` filled by the values of the function ``f`` in the range `offset:n`.
"""
function ZArray(n::Int, f::Function, offset = 1)
    n ≤ 0 && return fmpz[]
    fmpz[f(k) for k ∈ offset:offset+n-1] # !
end

"""

Return the size of the array ``A``.
"""
SeqSize(A) = Base.length(A)

"""

Return the range of a SeqArray.
"""
SeqRange(A) = 1:SeqSize(A)

"""

Print the array ``A`` in the format ``n ↦ A[n]`` for n in the given range.
"""
function SeqShow(A::Array, R::AbstractRange, offset = 0)
    for k ∈ R
        if isassigned(A, k)
            println(k + offset, " ↦ ", A[k])
        else
            println(k + offset, " ↦ ", "undef")
        end
    end
end

"""

Print the array ``A`` in the format ``n ↦ A[n]`` for n in the range first:last.
"""
SeqShow(A, first::Int, last::Int) = SeqShow(A, first:last)

"""

Print the array ``A`` in the format ``n ↦ A[n]``.
"""
SeqShow(A::Array, offset = 0) = SeqShow(A, 1:length(A), offset - 1)


function print_without_type(io, v::AbstractVector)
    print(io, "[")
    for (i, el) ∈ enumerate(v)
        i > 1 && print(io, ", ")
        print(io, el)
    end
    println(io, "]")
end

"""

Print the array without typeinfo.
"""
Println(v::AbstractVector) = print_without_type(IOContext(stdout), v)

"""

Print the array without typeinfo.
"""
function Println(V::Array{Array{Nemo.fmpz,1},1})
    for v ∈ V  v |> Println end
end

"""

Print the array with or without typeinfo.
"""
function SeqPrint(v::AbstractVector, typeinfo = false)
    typeinfo ? println(v) : Println(v)
end

"""

Valid prefixes to the numerical part of the OEIS A-numbers.

* C  => Coroutine (channel)
* F  => Filter (all below n)
* G  => Generating function
* I  => Iteration
* L  => List (array based)
* M  => Matrix (2-dim square)
* P  => Polynomial (over ZZ or QQ)
* R  => RealFunction (Float64)
* S  => Staircase (list iteration)
* T  => Triangle (list iteration)
* V  => Value (single term)
* is => is a (predicate), boolean
"""
const ValidPrefixes = ['C', 'F', 'G', 'I', 'L', 'M', 'R', 'S', 'T', 'V']

"""

Return the name of a OEIS sequence given a similar named function as a string.
"""
function SeqName(fun)
    aname = string(fun)
    for X ∈ ValidPrefixes
        aname = replace(aname, X => 'A')
    end

    if !occursin(r"^A[0-9]{6}$", aname)
        fullname = split(aname, ".")
        aname = String(fullname[end])
        if !occursin(r"^A[0-9]{6}$", aname)
            @error(aname, " is not a valid A-name!")
            return
        end
    end
    aname
end

"""

Return the A-number of a OEIS sequence given a similar named function as an integer.
"""
function SeqNum(seq)
    aname = SeqName(seq)
    parse(Int, aname[2:end])
end

#START-TEST-########################################################

using Test

function test() end

function demo()
    A = fmpz[1, 2, 3, 4, 5]

    println()
    SeqShow(A)
    println()

    SeqShow(A, -4)
    println()

    A |> Println

    println()
    V = Array{Nemo.fmpz,1}[[1], [0, 1], [0, 1, 70], [0, 1, 990, 34650]]
    for v ∈ V  v |> Println end
end

function perf() end

function main()
    test()
    demo()
    perf()
end

main()

end # module

# a(f) = applicable(f, 1) ? f(1) : f(1,2)
# m(f) = first(methods(h)).nargs == 1 ? f(1) : f(1,2)
