#make sure your final aligned .faa from running MUSCLE is in this directory
#request job space
srun -p scavenger --time=3:00:00 --mem=80gb --pty bash

#environment
mamba activate /vortexfs1/home/mmeneses/.conda/envs/mamba_env/envs/MUSCLExl

#run raxml with rapid bootstrap (-f a), repeat 100 time (-N 100), method is -m PROTGAMMAAUTO
#-p and -x are set.seed flags to ensure consistent results when running more than once
raxmlHPC -s aligned_merged_mcrA.faa -f a -N 100 -p 151 -m PROTGAMMAAUTO -x 151 -n merged_mcrA

#final outputs should include a "bestTree" file that you can open with less and then copy/paste to ITOL website
#https://itol.embl.de/itol.cgi
