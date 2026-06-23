#!/bin/bash

#SBATCH --output="slurm/citysim_%A.out"
#SBATCH --job-name=CitySim
#SBATCH --partition=c23ms
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2G
#SBATCH --mail-user=mascha.korfhage@gmail.com
#SBATCH --mail-type=ALL


# bitte anpassen
#SBATCH --time=72:00:00
#SBATCH --ntasks=40
INPUTDIR="/home/gzi37280/CityScenarioGenerator/scenarios/scenario_juelich-grosse-rurstr"


ml load OpenMPI/5.0.3

unlink input
ln -s $INPUTDIR input

cd CitySimulation/bin/release/net9.0/linux-x64/publish/

$MPIEXEC $FLAGS_MPI_BATCH CitySimulation $INPUTDIR

# the following line creates a symlink to the scenario directory, for better traceability