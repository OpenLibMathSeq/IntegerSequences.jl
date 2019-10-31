module QueensAlwaysPuzzleMe

using Distributed, BenchmarkTools

# There is also a simple (i.e. not distributed) version:
# https://github.com/PeterLuschny/IntegerSequences.jl/blob/master/demos/SimpleQueens.jl
# For some background see https://wp.me/paipV7-E and https://oeis.org/A319284

function solve!(profile, level, size, start, cols, diag4, diag1)

    if level > 0
        for i in start:size
            save = cols & (1 << i) +
            diag1 & (1 << (i + level)) +
            diag4 & (1 << (32 + i - level))

            if save == 0

                cols  = xor(cols,  1 << i)
                diag1 = xor(diag1, 1 << (i + level))
                diag4 = xor(diag4, 1 << (32 + i - level))

                solve!(profile, level - 1, size, 0, cols, diag4, diag1)

                cols  = xor(cols,  1 << i)
                diag1 = xor(diag1, 1 << (i + level))
                diag4 = xor(diag4, 1 << (32 + i - level))

                profile[level + 1] += 1

                cols == 0 && return
            end
        end
    else
        for i in 0:size
            save = cols & (1<<i) + diag1 & (1<<i) + diag4 & (1<<(32+i))
            save == 0 && (profile[1] += 1)
        end
    end
end

function distributed_search(n::Int, k::Int)

    profile = zeros(Int, n + 1)
    cols = diag4 = diag1 = Int(0)
    solve!(profile, n - 1, n - 1, k, cols, diag4, diag1)
    return profile
end

function queens(n::Int)

    n == 0 && return [1]

    profile = Distributed.@distributed (+) for k = 0:n-1
        distributed_search(n, k)
    end

    profile[n+1] = 1  # add the root
    [profile[n-i+1] for i = 0:n]
end

function ProfileQueens(up_to)
    for n in 0:up_to
        profile = queens(n)
        #show_profile(n, profile)
    end
end

"""
julia> show_profile(7, queens(7))
    size:      7
    profile:   [1, 7, 30, 76, 140, 164, 94, 40]
    nodes:     552
    solutions: 40
"""
function show_profile(n, p)
    println("size:      ", n)
    println("profile:   ", p)
    println("nodes:     ", sum(p))
    println("solutions: ", p[n+1])
    println()
end

"""
julia> BechmarkQueens()
    Number of cpu-threads : 4
    Number of threads used: 4
    95.699 ms (589 allocations: 48.88 KiB)
"""
function BechmarkQueens()
    println("Number of cpu-threads : ", Base.Sys.CPU_THREADS)
    println("Number of threads used: ", Threads.nthreads())
    println()

    @btime ProfileQueens(12)
end

BechmarkQueens()

end # module
