# This file is part of IntegerSequences.
# Copyright Peter Luschny. License is MIT.

(@__DIR__) ∉ LOAD_PATH && push!(LOAD_PATH, (@__DIR__))

module ForcePrecompile

using IntegerSequences, BuildSequences


BuildSequences.build_all()


end # module
