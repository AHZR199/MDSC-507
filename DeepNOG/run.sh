#!/bin/bash
####### Reserve computing resources #############
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --time=144:00:00
#SBATCH --mem=70G
####### Specify Environment Variables #############
#																!!!!!!ACTIVATE  ENVIROMENT!!!!!!
#conda activate /work/soghigian_lab/apps/conda/envs/deepnog
#
export DEEPNOG_DATA=/work/soghigian_lab/databases/deepnog
export DEEPNOG_CONFIG=/work/soghigian_lab/databases/deepnog/config
####### Script Below #############

declare -a arr=("Aedes_aegypti", "Anopheles_stephensi, Anopheles_albimanus" "Anopheles_arabiensis" "Anopheles_gambiae_str._PEST" "Anopheles_sinensis" "Anopheles_stephensi")

## loop through array
for i in "${arr[@]}"
do
   deepnog infer -a "deepnog" -o $i.csv -of csv -db "culicidaeorthodb" -t "1" $i.faa
done