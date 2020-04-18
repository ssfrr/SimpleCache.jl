using SimpleCache
using Test

@testset "SimpleCache.jl" begin
    cachename = tempname()
    @test cached(()->42, cachename) == 42
    @test cached(()->43, cachename) == 42
    @test cached(()->44, cachename; reset=true) == 44
    rm(cachename)
end
