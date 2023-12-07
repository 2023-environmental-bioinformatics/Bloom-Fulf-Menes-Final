#!/bin/sh
#authors: Avery and Jeanne

#SBATCH --partition=compute
#SBATCH --job-name=bowtie_metaG
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jeanne.bloomberg@whoi.edu
#SBATCH --ntasks=6
#SBATCH --cpus-per-task=1
#SBATCH --mem=60G
#SBATCH --time=06:00:00
#export OMP_NUM_THREADS=1

#use bowtie2 to align metaG reads to metaG alignments from megahit, concatenated with unique headers using the scripts found in concatenate.txt.
#the -f argument specifies that we are using reads in fasta file format
#the -x specifies the index, which we generated using the bowtie2-build command written in the build-index.txt file in this directory
#the -U specifies the input metaG contigs file to map back to the concatenated alignments
#the -S specifies that we want the output, in sam format, at the given path
bowtie2 -f -x ../output/MegaHit_to_use_downstream/megahit_index -U ../output/MegaHit_to_use_downstream/FS851_final.contigs.fa -S ../output/mapped_reads/FS851_MetaG_mapped.sam
bowtie2 -f -x ../output/MegaHit_to_use_downstream/megahit_index -U ../output/MegaHit_to_use_downstream/FS852_final.contigs.fa -S ../output/mapped_reads/FS852_MetaG_mapped.sam
bowtie2 -f -x ../output/MegaHit_to_use_downstream/megahit_index -U ../output/MegaHit_to_use_downstream/FS854_final.contigs.fa -S ../output/mapped_reads/FS854_MetaG_mapped.sam
bowtie2 -f -x ../output/MegaHit_to_use_downstream/megahit_index -U ../output/MegaHit_to_use_downstream/FS856_final.contigs.fa -S ../output/mapped_reads/FS856_MetaG_mapped.sam
