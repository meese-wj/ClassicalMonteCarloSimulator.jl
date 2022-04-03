"""
Module housing the abstract types for the Monte Carlo simulations.
"""
module MonteCarloComponents 

export SimulationParameters, AddressBook, Hamiltonian, Observables, MonteCarloMethod, Analysis, Model

"""
Parent type for the parameters used to run the simulations.
"""
abstract type SimulationParameters end

"""
Parent type for connections between degrees of freedom in the system.
"""
abstract type AddressBook end

"""
Parent type for all `Hamiltonian`s to be defined.
"""
abstract type Hamiltonian end

"""
Parent type for the `Observables` taken for a given `Hamiltonian`.
"""
abstract type Observables end

"""
Parent type for the Monte Carlo algorithm applied for a given problem.
"""
abstract type MonteCarloMethod end

"""
Parent type for the `Analysis` approach taken to garner the statistics.
"""
abstract type Analysis end

"""
Parametric parent type that separates the physics from the Monte Carlo scheme.

# Additional Information
Each `Model` is defined parametrically with the following:
1. A `Hamiltonian` called `system`.
1. An `AddressBook` called `connections` relating the degrees of freedom to each other.
1. A set of `Observables` called `measurements`.
"""
abstract type Model{Ham <: Hamiltonian, Addr <: AddressBook, Obs <: Observables} end

end # module MonteCarloComponents