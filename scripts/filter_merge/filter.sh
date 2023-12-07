#!/usr/bin/env bash
#author: Avery

#SBATCH --partition=compute
#SBATCH --job-name=filter
#SBATCH --mail-type=ALL
#SBATCH --mail-user=avery.fulford@whoi.edu
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10gb
#SBATCH --time=02:00:00
#export OMP_NUM_THREADS=1

#use illumina-utils to filter merged reads, separated by sample and metaG or metaT. Input is merged reads in output/merged directory; output directory is within output/filtered
iu-filter-merged-reads ../../output/merged/FS851_metaG_MERGED --max-mismatches 2 --output ../../output/filtered/FS851_metaG_FILTERED
iu-filter-merged-reads ../../output/merged/FS851_metaT_MERGED --max-mismatches 2 --output ../../output/filtered/FS851_metaT_FILTERED
iu-filter-merged-reads ../../output/merged/FS852_metaG_MERGED --max-mismatches 2 --output ../../output/filtered/FS852_metaG_FILTERED
iu-filter-merged-reads ../../output/merged/FS852_metaT_MERGED --max-mismatches 2 --output ../../output/filtered/FS852_metaT_FILTERED
iu-filter-merged-reads ../../output/merged/FS854_metaG_MERGED --max-mismatches 2 --output ../../output/filtered/FS854_metaG_FILTERED
iu-filter-merged-reads ../../output/merged/FS854_metaT_MERGED --max-mismatches 2 --output ../../output/filtered/FS854_metaT_FILTERED
iu-filter-merged-reads ../../output/merged/FS856_metaG_MERGED --max-mismatches 2 --output ../../output/filtered/FS856_metaG_FILTERED
iu-filter-merged-reads ../../output/merged/FS856_metaT_MERGED --max-mismatches 2 --output ../../output/filtered/FS856_metaT_FILTERED
