using Test
using DarwinCode

@testset "DarwinCode Tests" begin
    ind = DarwinCode.Individual("function f(); return 1+1; end")
    @test ind.fitness < 0.01

    mutated = DarwinCode.mutate("function f(); return 1+1; end")
    @test typeof(mutated) == String

    child = DarwinCode.crossover("abcde", "vwxyz")
    @test typeof(child) == String
end
