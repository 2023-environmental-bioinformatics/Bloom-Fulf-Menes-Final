#!/bin/bash

#SBATCH --partition=compute
#SBATCH --job-name=all.contigs_prokka_run
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mmeneses@whoi.edu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=500G
#SBATCH --time=12:00:00
#SBATCH --output=all.contigs_prokka_%j.log
#export OMP_NUM_THREADS=1

mamba activate /proj/home/mmeneses/.conda/envs/mamba_env/envs/prokka

prokka --outdir /proj/omics/env-bio/collaboration/Bloom-Fulf-Menes-Final/prodigal-faas/all.contigs_prokka_outputs --prefix all-contigs-prokkannotated /proj/omics/env-bio/collaboration/Bloom-Fulf-Menes-Final/prodigal-faas/all.contigs.fa
