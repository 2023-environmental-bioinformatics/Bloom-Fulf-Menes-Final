#!/bin/sh
#authors: Avery and Jeanne

#SBATCH --partition=compute
#SBATCH --job-name=btie2_transcript
#SBATCH --mail-type=ALL
#SBATCH --mail-user=avery.fulford@whoi.edu
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=20G
#SBATCH --time=06:00:00
#export OMP_NUM_THREADS=1


#use bowtie2 to align metaT reads to metaG alignments from megahit, concatenated with unique headers using the scripts found in concatenate.txt.
#the -f argument specifies that we are using reads in fasta file format
#the -x specifies the index, which we generated using the bowtie2-build command written in the build-index.txt file in this directory
#the -U specifies the input metaG contigs file to map back to the concatenated alignments
#the -S	specifies that we want the output, in sam format, at the given path
bowtie2 -f -x ../output/MegaHit_to_use_downstream/megahit_index -U ../output/silva/metaT_rRNA_removed/unaligned_SSUandLSU_reads_FS852.fasta -S ../output/mapped_reads/FS852_metaT_mapped.sam
bowtie2 -f -x ../output/MegaHit_to_use_downstream/megahit_index -U ../output/silva/metaT_rRNA_removed/unaligned_SSUandLSU_reads_FS854.fasta -S ../output/mapped_reads/FS854_metaT_mapped.sam
bowtie2 -f -x ../output/MegaHit_to_use_downstream/megahit_index -U ../output/silva/metaT_rRNA_removed/unaligned_SSUandLSU_reads_FS856.fasta -S ../output/mapped_reads/FS856_metaT_mapped.sam
