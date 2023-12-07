#!/bin/bash

#SBATCH --partition=scavenger
#SBATCH --job-name=megaG_FS854_new1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mmeneses@whoi.edu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=36
#SBATCH --mem=186G
#SBATCH --time=24:00:00
#SBATCH --output=/proj/omics/env-bio/collaboration/Bloom-Fulf-Menes-Final/filtered/batches/megahit_FS854_%j.log
#export OMP_NUM_THREADS=1

conda activate /proj/home/mpachiadaki/miniconda3/envs/megahit

megahit -r /proj/omics/env-bio/collaboration/Bloom-Fulf-Menes-Final/filtered/FS856_metaG_FILTERED -o /proj/omics/env-bio/collaboration/Bloom-Fulf-Menes-Final/filtered/FS856_outputs_mega_scavenger
