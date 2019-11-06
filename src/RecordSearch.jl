# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module RecordSearch

using Nemo

export ModuleRecordSearch
export Records, RecordsCached

"""

The type object to construct an iterated search for records in sequences.

* Records
"""
const ModuleRecordSearch = ""

"""

The type object to construct an iterated search for records in sequences.
"""
struct RecordsCached
    "function representing the sequence"
    fun::Function
    "search limit OR search length"
    lim::Int
    "true ↦ search all below lim, false ↦ search length items"
    below::Bool
    "true ↦ return index of record, false ↦ return value of record"
    index::Bool
    "the records"
    records
end

Base.iterate(::RecordsCached) = (ZZ(1), (ZZ(1), ZZ(0), ZZ(1)))

"""

Return the value or the index of the next record.
"""
function Base.iterate(R::RecordsCached, state)
    h, n, s = state
    if (R.below ? s : n) >= R.lim
        println(); println(R.records)
        return nothing
    end
    while true
        v = R.fun(n)
        if v > h
            R.records[n] = v
            return (R.index ? n : v, (v, n + 1, s + 1))
        end
        n += 1
    end
end

Base.length(R::RecordsCached) = R.lim
Base.eltype(R::RecordsCached) = fmpz

"""

The type object to construct an iterated search for records in sequences.
"""
struct Records
    "function representing the sequence"
    fun::Function
    "search limit OR search length"
    lim::Int
    "true ↦ search all below lim, false ↦ search length items"
    below::Bool
    "true ↦ return index of record, false ↦ return value of record"
    index::Bool
end

Base.iterate(::Records) = (ZZ(1), (ZZ(1), ZZ(0), ZZ(1)))

"""

Return the value or the index of the next record.
"""
function Base.iterate(R::Records, state)
    h, n, s = state
    (R.below ? s : n) >= R.lim && return nothing
    while true
        v = R.fun(n)
        v > h && return (R.index ? n : v, (v, n + 1, s + 1))
        n += 1
    end
end

Base.length(R::Records) = R.lim
Base.eltype(R::Records) = fmpz

end # module

# The module HighlyAbundant is the test case of this module.
