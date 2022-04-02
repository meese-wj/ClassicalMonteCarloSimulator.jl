module ClassicalMonteCarloSimulator

export MonteCarloSimulation, initialize!, thermalize!, measure!, analyze!, export_data, simulate!

"""
Interface for the simulations.
"""
abstract type MonteCarloSimulation end 

"""
# REQUIRED FOR `MonteCarloSimulation` INTERFACE 

    initialize!( sim::MonteCarloSimulation )

Setup the simulation using whatever steps are necessary, for example, like allocating memory or importing old simulations.

# Additional Information
* The implication is that this function modifies its argument `sim`.
* The default implementation `error`s out so as to not propagate undefined behavior.
"""
initialize!( sim::MonteCarloSimulation ) = error("No initialization procedure has been defined for $(typeof(sim))")

"""
# REQUIRED FOR `MonteCarloSimulation` INTERFACE 

    thermalize!( sim::MonteCarloSimulation )

Crucial step necessary for temperature-dependent simulations. This equilibrates the system at its given temperature.

# Additional Information
* The implication is that this function modifies its argument `sim`.
* The default implementation `error`s out so as to not propagate undefined behavior.
"""
thermalize!( sim::MonteCarloSimulation ) = error("No thermalization procedure has been defined for $(typeof(sim))")

"""
# REQUIRED FOR `MonteCarloSimulation` INTERFACE 

    measure!( sim::MonteCarloSimulation )

Take measurements of observables to gather statistics.

# Additional Information
* The implication is that this function modifies its argument `sim`.
* The default implementation `error`s out so as to not propagate undefined behavior.
"""
measure!( sim::MonteCarloSimulation ) = error("No measurement procedure has been defined for $(typeof(sim))")

"""
# REQUIRED FOR `MonteCarloSimulation` INTERFACE 

    analyze!( sim::MonteCarloSimulation )

After measurements are taken, analyze the statistics.

# Additional Information
* The implication is that this function modifies its argument `sim`.
* The default implementation `error`s out so as to not propagate undefined behavior.
"""
analyze!( sim::MonteCarloSimulation ) = error("No analysis protocol has been defined for $(typeof(sim))")

"""
# REQUIRED FOR `MonteCarloSimulation` INTERFACE 

    export_data( sim::MonteCarloSimulation )

Write the preferred data from the simulation to the disk for further study, analysis, or simulation.

# Additional Information
* The default implementation `error`s out so as to not propagate undefined behavior.
"""
export_data( sim::MonteCarloSimulation ) = error("No data export instructions have been defined for $(typeof(sim))")

"""
    simulate!( sim::MonteCarloSimulation )

This is the main simulation function for a `MonteCarloSimulation` type. All
interface functions are used in this function to execute the code.

# Additional Information 
The steps that must be taken to execute a Monte Carlo simulation are as follows:
1. `initialize!` the simulation by allocating memory, etc., before running.
1. `thermalize!` the system by allowing it to equilibrate at its given temperature.
1. `measure!` observables of the system once it has equilibrated.
1. `analyze!` the measurements taken of the observables at equilibrium.
1. `export_data` from all the properly analyzed observables from equilibrium.

* The implication is that this function modifies its argument `sim`.
"""
function simulate!( sim::MonteCarloSimulation )
    initialize!(sim)
    measure!(sim)
    analyze!(sim)
    export_data(sim)
    return nothing 
end

end # module ClassicalMonteCarloSimulator
