#get the direct path to databases for use later
#/proj/omics/env-bio/collaboration/databases/kofam/ko_list
#/proj/omics/env-bio/collaboration/databases/kofam/profiles
#after this I actually have to go into the mamba environment and get a direct link to the executable file
#/proj/home/mmeneses/.conda/envs/mamba_env/envs/kofamscan/bin/exec_annotation

#open the mamba environment with kofamscan conda install, Ruby, HMMR and Parallel
mamba activate /proj/home/mmeneses/.conda/envs/mamba_env/envs/kofamscan

#request job
srun -p compute --time=2:00:00 --mem=180gb --cpus-per-task=10 --nodes=10 --pty bash

#run it
/vortexfs1/home/mmeneses/.conda/envs/mamba_env/envs/kofamscan/bin/exec_annotation -o /proj/omics/env-bio/collaboration/Bloom-Fulf-Menes-Final/outputs/kofam/all.contigs-kofam-output.txt -p /proj/omics/env-bio/collaboration/databases/kofam/profiles -k /proj/omics/env-bio/collaboration/databases/kofam/ko_list /proj/omics/env-bio/collaboration/Bloom-Fulf-Menes-Final/outputs/prodigal-faas/all.contigs_prokka_outputs/all-contigs-prokkannotated.faa
