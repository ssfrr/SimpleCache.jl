using Documenter, SimpleCache

makedocs(;
    modules=[SimpleCache],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/ssfrr/SimpleCache.jl/blob/{commit}{path}#L{line}",
    sitename="SimpleCache.jl",
    authors="Spencer Russell",
    assets=String[],
)

deploydocs(;
    repo="github.com/ssfrr/SimpleCache.jl",
)
