push!(LOAD_PATH, "../src/")

using Documenter, Sequences

makedocs(
   modules = [Sequences],
   clean = true,
   doctest = false,
   format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
   sitename = "Sequences",
   pages = [
      "About" => "about.md",
      "Sequences" => "index.md",
      "Modules" => "modules.md",
      "Notebooks and demos" => "notebooks.md",
      "User guide" => "userguide.md",
      "Developer guide" => "developerguide.md",
      "Use of the OEIS" => "useofoeis.md",
      "License" => "license.md",
   ]
)

deploydocs(
    repo = "github.com/OpenLibMathSeq/Sequences.jl.git"
)
