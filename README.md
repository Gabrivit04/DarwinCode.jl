# DarwinCode.jl

> Automatic Julia Code Evolution using Genetic Algorithms  
> Author: Gabriele Vitale • vitalegabriele18@gmail.com

DarwinCode.jl is a Julia package that automatically generates and evolves Julia code using genetic algorithms. Inspired by biological evolution, it improves code over time through mutation, crossover, and selection.

## Getting Started

```bash
git clone https://github.com/Gabrivit04/DarwinCode.jl.git
cd DarwinCode.jl
julia --project
```

In Julia:
```julia
using Pkg
Pkg.instantiate()
using DarwinCode
DarwinCode.run_evolution()
```

##  Structure

```
DarwinCode.jl/
├── Project.toml
├── src/
│   └── DarwinCode.jl
├── test/
│   └── runtests.jl
├── cli.jl
└── README.md
```

##  Example Output

```
Generazione 1
Best fitness: 0.0041
Generazione 2
...
function f(); return 12+30; end
```

##  License

MIT License.
