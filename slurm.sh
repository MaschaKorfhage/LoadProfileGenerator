#!/bin/bash

#SBATCH --output="slurm/citysim_%A.out"
#SBATCH --job-name=CitySim
#SBATCH --partition=c23mm
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2G
#SBATCH --mail-user=mascha.korfhage@gmail.com
#SBATCH --mail-type=ALL
#SBATCH -A thes2412


# bitte anpassen
#SBATCH --time=1:00:00
#SBATCH --ntasks=1

SCENARIO="test_scenario"
INPUTDIR="/home/gzi37280/CityScenarioGenerator/scenarios/$SCENARIO"


ml load OpenMPI/5.0.3

unlink input
ln -s $INPUTDIR input

cd CitySimulation/bin/Release/net9.0/linux-x64/publish/

$MPIEXEC $FLAGS_MPI_BATCH CitySimulation $INPUTDIR

JOB_ID="${SLURM_ARRAY_JOB_ID:-$SLURM_JOB_ID}"

mkdir /home/gzi37280/LoadProfileGenerator/OldResults/$JOB_ID
cp -r /hpcwork/gzi37280/city_simulation_results/$SCENARIO/Logs/poi_presence /home/gzi37280/LoadProfileGenerator/OldResults/$JOB_ID/
cp -r /hpcwork/gzi37280/city_simulation_results/$SCENARIO/Logs/poi_queue /home/gzi37280/LoadProfileGenerator/OldResults/$JOB_ID/