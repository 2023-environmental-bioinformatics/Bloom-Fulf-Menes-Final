#for this script to work, the directory that you run this script in must have 
#1. the .faa files containing the extracted all-contigs-prokkaannotated amino acid sequences found with KO/HHHBGIEE 
#2. an uploaded .faa file containing the amino acid sequences taken of known mcrA genes, taken from NCBI or BLAST

#first concatenate all the .faa files together
for i in *.faa; do echo $i; cat $i >> merged_mcrA.faa; done

#activate and use MUSCLE to align
mamba activate /vortexfs1/home/mmeneses/.conda/envs/mamba_env/envs/MUSCLExl

muscle -align merged_mcrA.faa -output aligned_merged_mcrA.faa
