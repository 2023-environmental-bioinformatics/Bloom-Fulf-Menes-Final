#make sure the config.yml file is in the same directory as this script, otherwise it won't run
#this is the alternative method to running kofamscan in case the original version (using direct paths) doesn't work
#there is no need to direct path to the databases, those are included in the .yml
#both methods gave me trouble but I thought it be better to include them both

#open the mamba environment with kofamscan conda install, Ruby, HMMR and Parallel
mamba activate /proj/home/mmeneses/.conda/envs/mamba_env/envs/kofamscan

#request job
srun -p compute --time=2:00:00 --mem=180gb --cpus-per-task=10 --nodes=10 --pty bash

/proj/home/mmeneses/.conda/envs/mamba_env/envs/kofamscan/bin/exec_annotation -o all.contigs_kofam.txt /proj/omics/env-bio/collaboration/Bloom-Fulf-Menes-Final/output/prodigal-faas/all.contigs_prokka_outputs/all-contigs-prokkannotated.faa
