#!/bin/bash
####### Reserve computing resources #############
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --time=144:00:00
#SBATCH --mem=20G
####### Specify Environment Variables #############
sh ortho_dl.sh culicidae 7157 0.9 0.9

sh ortho_process.sh culicidae

cd /work/soghigian_lab/abdullah.zubair2/507/Final_OrthoSet/orthoset_construction/culicidae_orthologs

cat *.log > tax_for_orthograph.cog

