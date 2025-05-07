module DarwinCode

using Random
using BenchmarkTools

export evolve_code, Individual, run_evolution

mutable struct Individual
    code::String
    fitness::Float64
end

function Individual(code::String)
    fit = evaluate_fitness(code)
    return Individual(code, fit)
end

function evaluate_fitness(code::String)
    try
        f = Meta.parse(code)
        eval(f)
        @belapsed $f()
    catch
        return Inf
    end
end

function mutate(code::String)
    replacements = [
        ("+", "-"), ("-", "+"),
        ("*", "+"), ("+", "*"),
        ("1", "2"), ("2", "3"), ("3", "1")
    ]
    expr = code
    for (a, b) in replacements
        if occursin(a, expr) && rand() < 0.3
            expr = replace(expr, a => b)
        end
    end
    return expr
end

function crossover(code1::String, code2::String)
    i = rand(1:min(length(code1), length(code2)))
    return code1[1:i] * code2[i+1:end]
end

function evolve_code(popsize::Int=10, generations::Int=30)
    population = [Individual("function f(); return $(rand(1:20)) + $(rand(1:20)); end") for _ in 1:popsize]

    for gen in 1:generations
        println("Generazione $gen")
        sorted = sort(population, by = x -> x.fitness)
        elites = sorted[1:div(popsize, 2)]

        new_gen = copy(elites)
        while length(new_gen) < popsize
            parent1, parent2 = rand(elites, 2)
            child_code = mutate(crossover(parent1.code, parent2.code))
            push!(new_gen, Individual(child_code))
        end

        population = new_gen
        println("Best fitness: $(population[1].fitness)")
    end

    return sort(population, by = x -> x.fitness)[1]
end

function run_evolution()
    best = evolve_code()
    println("=== Codice migliore trovato ===")
    println(best.code)
end

end # module
