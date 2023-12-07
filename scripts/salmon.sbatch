#!/bin/sh

#SBATCH --partition=compute
#SBATCH --job-name=salmon_finalproj
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jeanne.bloomberg@whoi.edu
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=50G
#SBATCH --time=8:00:00
#SBATCH --output=salmon_finalproj%j.log
#export OMP_NUM_THREADS=1

#For meta-T

# using alignment mode, because we have already aligned with bowtie
# A means we let salmon infer the data type
# -a means we have an alignment file in BAM format
# -o is the output file


salmon quant -t ../output/MegaHit_to_use_downstream/all.contigs.fa -l A -a ../output/mapped_reads/FS851_metaT_mapped.bam -o ../output/salmon_quant_out/metaT_FS851
salmon quant -t ../output/MegaHit_to_use_downstream/all.contigs.fa -l A -a ../output/mapped_reads/FS852_metaT_mapped.bam -o ../output/salmon_quant_out/metaT_FS852
salmon quant -t ../output/MegaHit_to_use_downstream/all.contigs.fa -l A -a ../output/mapped_reads/FS854_metaT_mapped.bam -o ../output/salmon_quant_out/metaT_FS854
salmon quant -t ../output/MegaHit_to_use_downstream/all.contigs.fa -l A -a ../output/mapped_reads/FS856_metaT_mapped.bam -o ../output/salmon_quant_out/metaT_FS856



#For meta-G

# using alignment mode, because we have already aligned with bowtie
# same as above
# --meta means we have metagenomic data

salmon quant -t ../output/MegaHit_to_use_downstream/all.contigs.fa  -l A -a ../output/mapped_reads/FS851_MetaG_mapped.bam --meta -o ../output/salmon_quant_out/MetaG_FS851 
salmon quant -t ../output/MegaHit_to_use_downstream/all.contigs.fa  -l A -a ../output/mapped_reads/FS852_MetaG_mapped.bam --meta -o ../output/salmon_quant_out/MetaG_FS852
salmon quant -t ../output/MegaHit_to_use_downstream/all.contigs.fa  -l A -a ../output/mapped_reads/FS854_MetaG_mapped.bam --meta -o ../output/salmon_quant_out/MetaG_FS854
salmon quant -t ../output/MegaHit_to_use_downstream/all.contigs.fa  -l A -a ../output/mapped_reads/FS856_MetaG_mapped.bam --meta -o ../output/salmon_quant_out/MetaG_FS856

