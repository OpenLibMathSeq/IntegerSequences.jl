__precompile__(true)
# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module Triangles

using Nemo, SeqUtils

export ModuleTriangles
export Triangle, ZTriangle, QTriangle, RecTriangle
export TriangularNumber, isTriangular, assertTriangular
export ShowAsΔ, ShowAsMatrix, Row, RowSums
export fromΔ, toΔ, TriangleToList

"""

* Triangle, ZTriangle, QTriangle, RecTriangle, TriangularNumber, isTriangular, assertTriangular, ShowAsΔ, ShowAsMatrix, Row, RowSums, fromΔ, toΔ, TriangleToList
"""
const ModuleTriangles = ""

#    T(0,0)                          row 0
#    T(1,0) T(1,1)                   row 1
#    T(2,0) T(2,1) T(2,2)            row 2
#    T(3,0) T(3,1) T(3,2) T(3,3)     row 3
#    col 0  col 1  col 2  col 3
#
# The two dimensional index is ``(0, 0)``-based and displayed row-wise as
# a lower triangular array. In particular note that a `Triangle` has rows
# and cols from ``0`` to dim ``-1``.


abstract type AbstractTriangle end

"""

A Triangle is a list of rows. The rows of the triangle are generated by a function `(n::Int, k::Int) → gen::fmpz` for ``0 ≤ k ≤ n`` and ``0 ≤ n <``dim.
"""
struct Triangle <: AbstractTriangle
    dim::Int
    gen::Function
    function Triangle(dim::Int, gen::Function)
        dim <= 0 && throw(ArgumentError("dim has to be a positive integer."))
        new(dim, (n::Int, k::Int) -> gen(n, k)::fmpz)
    end
end

"""

Return the first row of the triangle.
"""
function Base.iterate(T::Triangle)
    ([T.gen(0, 0)], 1)
end

"""

Return the next row of the triangle.
"""
function Base.iterate(T::Triangle, n)
    n >= T.dim && return nothing
    row = [T.gen(n, k) for k ∈ 0:n]
    (row, n + 1)
end

Base.length(T::Triangle) = T.dim
Base.eltype(T::Triangle) = fmpz

# --------------------------------------------------

"""

A recursive triangle `RecTriangle` is a subtype of `AbstractTriangle`.
The rows of the triangle are generated by a function `gen(n, k, prevrow)` defined for ``n ≥ 0`` and ``0 ≤ k ≤ n``. The function returns value of type Nemo.fmpz.

The parameter prevrow is a function which returns the values of `row(n-1)` of the triangle and 0 if ``k < 0`` or ``k > n``. The function prevrow is provided
by an instance of `RecTriangle` and must not be defined by the user.
"""
struct RecTriangle <: AbstractTriangle
    dim::Int
    A::Array{fmpz}
    gen::Function  # generating function
    function RecTriangle(dim::Int, gen::Function)
        dim <= 0 && throw(ArgumentError("dim has to be a positive integer."))
        new(
            dim,
            fill(ZZ(0), dim),
            (n::Int, k::Int, f::Function) -> gen(n, k, f)::fmpz
        )
    end
end

function Base.iterate(T::RecTriangle)
    top = T.gen(0, 0, () -> undefined)
    T.A[1] = ZZ(top)
    ([top], 1)
end

"""

Return the next row of the triangle.
"""
function Base.iterate(T::RecTriangle, n)
    @inline prevrow(A, n) = (k) -> (k < 0 || k > n) ? ZZ(0) : A[k+1]
    n == T.dim && return nothing
    F(n, k) = T.gen(n, k, prevrow(T.A, n))
    row = [F(n, k) for k ∈ 0:n]
    for k ∈ 1:n+1
        T.A[k] = row[k]
    end
    (row, n + 1)
end

Base.length(R::RecTriangle) = R.dim
Base.eltype(R::RecTriangle) = fmpz

# --------------------------------------------------

"""

Return the``n``-th triangular number.
"""
TriangularNumber(n) = div(n * (n + 1), 2)

"""

Is ``n`` a triangular number?
"""
isTriangular(n) = n == TriangularNumber(isqrt(2n))

"""

Return the square root of ``2n`` or throw an ArgumentError if ``n`` is not a triangular number.
"""
function assertTriangular(n)
    dim = isqrt(2n)
    n ≠ TriangularNumber(dim) && throw(ArgumentError("This is not a triangular array!"))
    return dim
end

"""

Return a trianguler array with ``n`` rows set to ``0`` (type ZZ).
"""
ZTriangle(dim::Int) = zeros(ZZ, TriangularNumber(dim))

"""

Return a trianguler array with ``n`` rows set to ``0`` (type QQ).
"""
QTriangle(dim::Int) = zeros(QQ, TriangularNumber(dim))

"""

Return the triangle as a list of rows.
"""
TriangularArray(T::AbstractTriangle) = [row for row ∈ T]

"""

Return the triangle as a list of integers.
"""
TriangleToList(T::AbstractTriangle) = [k for row ∈ T for k ∈ row]

"""

Return row ``n (0 ≤ n)`` of the lower triangular matrix T or the row ``n`` in reversed order if `reversed` is set true.
"""
function Row(T, n, reversed = false)
    s = length(T)
    (s == 0 || n < 0) && return []
    assertTriangular(s)

    t = TriangularNumber(n + 1)
    s < t && error("This row is not in the matrix.")
    R = reversed ? range(t, step = -1, stop = t - n) :
        range(t - n, step = 1, stop = t)
    return [T[k] for k ∈ R]
end

"""

Return the row sums of a triangle, if `alternate=true` then the alternating row sums.
"""
function RowSums(T, alternate = false)
    n = length(T)
    n == 0 && return T
    len = assertTriangular(n)
    S = zeros(ZZ, len)
    lo = hi = 0
    step = 0

    while hi < n
        if alternate
            s = sum((-1)^k * T[lo + k + 1] for k ∈ 0:hi-lo)
        else
            s = sum(T[k+1] for k ∈ lo:hi)
        end
        step += 1
        S[step] = s
        hi += 1
        lo, hi = hi, hi + step
    end
    S
end

"""

Display a lower triangular matrix.
"""
function ShowAsΔ(T::AbstractTriangle, separator = ", ")
    for row ∈ T
        for k ∈ row
            print(k, separator)
        end
        println()
    end
end

"""

Display an array as a lower triangular matrix.
"""
function ShowAsΔ(T::AbstractArray, separator = ", ")
    if typeof(T) == Array{Array{fmpz,1},1}
        for row ∈ T
            for k ∈ row
                print(k, separator)
            end
            println()
        end
    elseif typeof(T) == Array{fmpz,2}
        for row ∈ 1:size(T, 1)
            T[row, :]' |> Println
        end
    elseif typeof(T) == Array{fmpz,1}
        dim = assertTriangular(length(T))
        low = high = 1
        for r ∈ 2:dim+1
            [T[j] for j = low:high] |> Println
            low, high = high + 1, high + r
        end
    else
        println(T)
    end
end

"""

Convert a lower triangular array to a square matrix.
"""
function fromΔ(T::AbstractTriangle)
    L = TriangleToList(T)
    dim = assertTriangular(length(L))

    A = fill(ZZ(0), dim, dim)
    k = 1
    for r ∈ 1:dim
        for j = 1:r
            A[r, j] = L[k]
            k += 1
        end
    end
    A
end

"""

Convert a square matrix to a list using only the ``T(n,k)`` with ``0 ≤ k ≤ n``. Returns a ZArray.
"""
function toΔ(M)
    dim = size(M, 1)
    T = ZTriangle(dim)
    k = 1

    if typeof(M[1, 1]) == Nemo.fmpq
        for r ∈ 1:dim, j = 1:r
            T[k] = numerator(M[r, j])
            k += 1
        end
    else
        for r ∈ 1:dim, j = 1:r
            T[k] = M[r, j]
            k += 1
        end
    end
    T
end

"""

Print the triangle in matrix form.
"""
ShowAsMatrix(T) = println(fromΔ(T))

#START-TEST-########################################################

using Test

function test()
    BinTri(n) = [binomial(k, j) for k ∈ 0:n-1 for j ∈ 0:k]

    X(n, k) =
        ((k > n || k < 0) && return 0;
        (n == 0 && k == 0) && return 1;
        4 * X(n - 1, k - 1) + (4 * n - 1) * X(n - 1, k))

    T(n) = [X(j, k) for j ∈ 0:n for k ∈ 0:j]

    @testset "Triangles" begin
        t = T(6)
        a = [3465, 8784, 7136, 2304, 256]
        b = Row(t, 4)
        @test all(a .== b)

        # RowSums
        t = BinTri(8)
        a = [1, 2, 4, 8, 16, 32, 64, 128]
        b = RowSums(t)
        @test all(a .== b)

        a = [1, 0, 0, 0, 0, 0, 0, 0]
        b = RowSums(t, true)  # alternating sum
        @test all(a .== b)
    end
end

function demo()

    println("\n--- Using Triangle\n")

    function X(n, k)
        (k > n || k < 0) && return fmpz(0)
        (n == 0 && k == 0) && return fmpz(1)
        ZZ(4 * X(n - 1, k - 1) + (4 * n - 1) * X(n - 1, k))
    end

    TX(dim) = Triangle(dim, X)
    ShowAsΔ(TX(6), "\t")

    println(TriangleToList(TX(6)))
    ShowAsΔ(TriangleToList(TX(6)))

    TL = TriangleToList(TX(6))
    for k ∈ 0:5
        Println(Row(TL, k))
    end

    println()
    ShowAsMatrix(TX(6))

    # The above triangle is much better implemented with a RecTriangle!

    println("\n--- Using RecTriangle\n")

    function r225478(n, k, prevrow::Function)
        (k == 0 && n == 0) && return fmpz(1)
        4 * prevrow(k - 1) + (4 * n - 1) * prevrow(k)
    end

    I225478(dim) = RecTriangle(dim, r225478)
    for row ∈ I225478(6)
        Println(row)
    end

    println()
    ShowAsΔ(RecTriangle(6, r225478), "\t")

    println()
    TA225478 = TriangularArray(I225478(6))
    ShowAsΔ(TA225478)

    println()
    println("ΔToListToΔ (test)")
    ShowAsΔ(TriangleToList(I225478(6)))

    println()
    ShowAsMatrix(I225478(6))

    println()
    GC.gc()
    @time TriangularArray(TX(16))
    @time TriangularArray(I225478(16))
end

"""

TriangularArray(TX(16))
    0.063180 seconds (785.95 k allocations: 11.996 MiB)
TriangularArray(I225478(16))
    0.000264 seconds (653 allocations: 15.781 KiB)
"""
function perf() end

function main()
    test()
    demo()
    perf()
end

main()

end # module
