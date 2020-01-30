# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module OEISUtils
using HTTP, Nemo

export ModuleOEISUtils
export oeis_writebfile, oeis_trimdata, oeis_remote, oeis_local, is_oeis_installed
export oeis_notinstalled, oeis_path, oeis_search, oeis_readbfile

"""

A collection of utilities for handling OEIS related tasks.
"""
const ModuleOEISUtils = ""

# Directory of OEIS data.
srcdir = realpath(joinpath(dirname(@__FILE__)))
ROOTDIR = dirname(srcdir)
datadir = joinpath(ROOTDIR, "data")

"""

Returns the path where the oeis data is expected.
"""
oeis_path() = joinpath(datadir, "stripped")

"""

Indicates if the local copy of the OEIS data (the so-called 'stripped' file) is installed (in ../data).
"""
is_oeis_installed() = isfile(oeis_path())

"""

Indicates if the local copy of the OEIS data (the so-called 'stripped' file) is not installed and warns.
"""
function oeis_notinstalled()
    if !is_oeis_installed()
        @warn("OEIS data not installed! Download stripped.gz from oeis.org,")
        @warn("expand it and put it in the directory ../data.")
        return true
    end
    return false
end

"""

Write a so-called b-file for submission to the OEIS. The file is saved in the 'data' directory.
"""
function oeis_writebfile(anum::String, fun::Function, range::OrdinalRange)

    if !occursin(r"^A[0-9]{6}$", anum)
        @warn("Not a valid A-number!")
        return
    end

    filename = joinpath(datadir, "b" * anum[2:end] * ".txt")
    @info("Writing " * anum * " to " * filename)

    f = open(filename, "w")
    for n ∈ range
        println(f, n, " ", fun(n))
    end
    close(f)
end

function oeis_writebfile(anum, list, offset = 1)

    if !occursin(r"^A[0-9]{6}$", anum)
        @warn("Not a valid A-number!")
        return
    end

    filename = joinpath(datadir, "b" * anum[2:end] * ".txt")
    @info("Writing " * anum * " to " * filename)

    n = offset
    f = open(filename, "w")
    for l ∈ list
        println(f, n, " ", list[n])
        n += 1
    end
    close(f)
end

"""

Read a file in the so-called b-file format of the OEIS.
"""
function oeis_readbfile(filename)

    @info("Reading " * filename)

    file = open(filename, "r")
    lines = readlines(file)

    for l ∈ lines
        s = split(l, ' ')
        i = parse(Int, s[1])
        v = parse(Int, s[2])
        println(i, " ", v)
    end
    close(file)
end

"""

Make sure that the length of the data section of an OEIS entry does not exceed 260 characters.
"""
function oeis_trimdata(fun, offset::Int)
    len = n = 0
    S = ""
    while true
        st = string(fun(offset + n))
        len += length(st)
        len > 260 && break
        S *= st * ", "
        len += 2
        n += 1
    end
    println(n, " terms")
    return S
end

"""

Download the sequence with A-number 'anum' from the OEIS to a file in json format. The file is saved in the 'data' directory.
"""
function oeis_remote(anum)
    if !occursin(r"^A[0-9]{6}$", anum)
        @warn("Not a valid A-number!")
        return
    end

    filename = joinpath(datadir, anum * ".json")

    url = HTTP.URI("http://oeis.org/search?q=id:" * anum * "&fmt=json")
    tries = 3
    r = nothing
    for i = 1:tries
        try
            r = HTTP.get(url; readtimeout = 2)
            getfield(r, :status) == 200 && break
            getfield(r, :status) == 302 && break
        catch e
            @warn(e)
        end
        sleep(2)
    end
    if r ≠ nothing && getfield(r, :status) == 200
        open(filename, "w") do f
            write(f, getfield(r, :body))
        end
        @info("Dowloaded " * basename(filename) * " to " * datadir)
    else
        if r === nothing
            @warn("Could not download $url, connection timed out.\n")
        else
            @warn("Could not download $url\nStatus: $(getfield(r, :status))")
        end
    end
end

"""

Get the sequence with A-number 'anum' from a local copy of the expanded 'stripped.gz' file which can be downloaded from the OEIS. 'bound' is an upper bound for the number of terms returned. The 'stripped' file is assumed to be in the '../data' directory.
"""
function oeis_local(anum::String, bound::Int)

    if !occursin(r"^A[0-9]{6}$", anum)
        @warn(anum * " is not a valid A-number!")
        return []
    end

    oeis_notinstalled() && return []

    A = Array{String}
    data = open(oeis_path())
    for ln ∈ eachline(data)
        if startswith(ln, anum)
            A = split(chop(chomp(ln)), ","; limit = bound + 2)
            break
        end
    end
    close(data)

    [convert(fmpz, parse(BigInt, n)) for n ∈ A[2:min(bound + 1, end)]]
end

"""

Search for a sequence in the local OEIS database ('../data/stripped'). Input the sequence as a comma separated string. The search is redone 'restarts' times in the case that no match was found with the first remaining term removed from the search string. Prints the matches.
"""
function oeis_search(seq::String, restarts::Int, verbose=false)

    oeis_notinstalled() && return []

    found = false
    seq = replace(seq, ' ' => "")
    verbose && println("Searching for:")
    verbose && println(seq)

    data = open(oeis_path())
    foundMAX = 4  # bound the search (sequences with many '0' make trouble).
    for line ∈ eachline(data)
        index = findfirst(seq, line)
        index === nothing && continue
        println("Searched for $seq")
        println("$line in range ", index)
        found = true
        foundMAX -= 1
        if foundMAX <= 0
            @warn("Truncating the search! There might be too many others sequences!")
            break
        end
    end
    close(data)

    if !found && restarts > 0
        ind = findfirst(isequal(','), seq)
        if !(ind === nothing) && (length(seq) > ind)
            seq = seq[ind+1:end]
            verbose && println("Restarting with fewer terms.")
            oeis_search(seq, restarts-1, verbose)
        end
    end
end

"""

Search for a sequence in the local OEIS database starting from the second term.
"""
function oeis_search(seq::Array{fmpz,1}, restarts::Int, verbose=false)
    oeis_search("$seq"[2:end-1], restarts, verbose)
end

function oeis_search(seq::Array{Int,1}, restarts::Int, verbose=false)
    oeis_search("$seq"[2:end-1], restarts, verbose)
end

function oeis_search(seq::Array{BigInt,1}, restarts::Int, verbose=false)
    oeis_search("$seq"[2:end-1], restarts, verbose)
end

#START-TEST-########################################################

function test()
    if is_oeis_installed()
        @info("OEIS data is installed as: " * oeis_path())
    end
end

function demo()
    oeis_writebfile("A000290", n -> n * n, 0:10)
    bfilepath = joinpath(datadir, "b000290.txt")
    oeis_readbfile(bfilepath)

    println(oeis_trimdata(n -> (-1)^n * n^5, 10))

    oeis_remote("A123456")

    println(oeis_local("A123456", 12))
    println(oeis_local("A015108", 11))

    seq = "0, 1, 2, 3, 6, 9, 14, 22, 32, 46, 66, 93, 128, 176, 238, 319"
    oeis_search(seq, 2)
    oeis_search([0, 1, 2, 3, 6, 9, 14, 22, 32, 46, 66, 93, 128, 176], 2)
end

function perf() end

function main()
    test()
    demo()
    perf()
end

main()

end # module
