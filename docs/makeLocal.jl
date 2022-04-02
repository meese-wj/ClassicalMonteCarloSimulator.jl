using ClassicalMonteCarloSimulator
using Documenter

DocMeta.setdocmeta!(ClassicalMonteCarloSimulator, :DocTestSetup, :(using ClassicalMonteCarloSimulator); recursive=true)

makedocs(;
    modules=[ClassicalMonteCarloSimulator],
    authors="W. Joe Meese <meese022@umn.edu> and contributors",
    repo="https://github.com/meese-wj/ClassicalMonteCarloSimulator.jl.git/blob/{commit}{path}#{line}",
    sitename="ClassicalMonteCarloSimulator.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
