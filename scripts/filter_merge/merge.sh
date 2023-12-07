#!/usr/bin/env bash
#author: Avery

#SBATCH --partition=compute
#SBATCH --job-name=merge
#SBATCH --mail-type=ALL
#SBATCH --mail-user=avery.fulford@whoi.edu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10gb
#SBATCH --time=02:00:00
#export OMP_NUM_THREADS=1

#use illumina utils to merge reads, using a final quality "Q30" check which eliminates pairs if the 66% of bases in the first half of each read do not have Q-scores over Q30, as specified by the paper. This command uses config files, specified for each sample and each metaT vs metaG sequence type.
iu-merge-pairs FS851_metaG_config.ini --enforce-Q30-check
iu-merge-pairs FS851_metaT_config.ini --enforce-Q30-check
iu-merge-pairs FS852_metaG_config.ini --enforce-Q30-check
iu-merge-pairs FS852_metaT_config.ini --enforce-Q30-check
iu-merge-pairs FS854_metaG_config.ini --enforce-Q30-check
iu-merge-pairs FS854_metaT_config.ini --enforce-Q30-check
iu-merge-pairs FS856_metaG_config.ini --enforce-Q30-check
iu-merge-pairs FS856_metaT_config.ini --enforce-Q30-check
