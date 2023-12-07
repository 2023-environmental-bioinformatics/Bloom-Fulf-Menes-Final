#!/bin/bash

#SBATCH --partition=compute
#SBATCH --job-name=megaG_FS851
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mmeneses@whoi.edu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=3
#SBATCH --mem=500G
#SBATCH --time=12:00:00
#SBATCH --output=megahit_FS851_run2_%j.log
#export OMP_NUM_THREADS=1

mamba activate /proj/home/mmeneses/.conda/envs/mamba_env/envs/megahit

megahit -r /proj/omics/env-bio/collaboration/Bloom-Fulf-Menes-Final/outputs/filtered/FS851_metaG_FILTERED -o ./FS851_output_mega2
