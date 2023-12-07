# Bloom-Fulf-Menes-Final
Repository for final project of Jeanne, Avery and Michael

Avery Fulford, Jeanne Bloomberg, and Michael Meneses plan to recreate Figures 1, 2, and 5b of Galambos et al. (2019) “Genome-resolved metagenomics and metatranscriptomics reveal niche differentiation in functionally redundant microbial communities at deep-sea hydrothermal vents.” This paper studies the ecology of the microbial communities living near deep-sea hydrothermal vents. The authors sequenced metagenomes and metatranscriptomes from 15 different vents at two sites (Piccard and Von Damm) to determine if there are significant differences in metabolic potential and microbial activity between the two sites. Instead of analyzing the data from all the vents, we are analyzing the data from the four vents from Piccard. Below, when we refer to “samples,” we are referring to the four vents.

Figure 1 shows the relative abundance of key metabolic genes from the metagenomic data, while Figure 2 shows the same thing, but for metatranscriptomic data. The key metabolic genes are those primarily involved in chemolithoautotrophy. These figures are aimed at describing the microbial potential (Fig. 1) and activity (Fig. 2) of the communities. Figure 5b determines the phylogenetic source of the mcrA gene. Because it can be used for either methanogenesis or anaerobic methane oxidation, the authors are using phylogenic to determine mcrA’s metabolic function.

Raw metatranscriptomic reads are accessible under code PRJEB15541 in the EMBL-EBI European Nucleotide Archive database. doi:10.1111/1462-2920.14806

Ganntt chart, group lab notebook, and meeting notes were tracked here: 
https://docs.google.com/spreadsheets/d/1l1PXMgrRd6gpeohbTcg_VXJ8fSteAu4TMvCu4IeQTIY/edit#gid=0

Repository contents: 
- data/: contains all the raw data from the European Nucleotide Archive
- envs/: contains all the yaml files necessary to create the conda environments used in this analysis
- jupyter-notebooks/: 
	- getrnafilename.py: prints the name of each raw data filename in a format that is easily copy-and-paste-able into config files used for the illumina-utils merge reads function.
	- Pull_ENA_Data.ipynb: downloads the raw reads from ENA.
	- final-comparison.ipynb: final comparison of the original and the reproduced figures. Includes conclusions about reproducibility. 
	- data-parsing-AHF.ipynb: used to associate the read abundances per contig id from the salmon output, the contig id and COG annotations from the prokka output, and the KEGG annotations from the kofamscan output. Also includes a calculation of the abundance of single-copy COGs per sample in the metagenomic samples, and the total transcriptomic read abundance per metatranscriptomic sample, to standardize the abundance of read hits to metabolic genes of interest in the metaG and metaT samples, respectively. 
	- bubble-plot-mG.ipynb: used to create the bubble plot for the standardized abundance of metagenomic reads, calculated in data-parsing-AHF.ipynb and manually converted into the excel file found in output/data_processing/.
	- bubble-plot-mT.ipynb: used to create the bubble plot for the standardized abundance of metatranscriptomic reads, calculated in data-parsing-AHF.ipynb and manually converted into the excel file found in output/data_processing/.
	- bubble_plot_mod.py: the script provided by the authors on their github for creating the bubble plots. Almost impossible to reproduce, but included it here for easy comparison.
- logs/:  
	- megahit/: contains the logs for megahit assemblies for each sample
	- salmon/: contains the logs for salmon quantification for each sample
- outputs/: 
	- assemblies/:
		- batches/: assembly sbatch scripts (also present in ../../scripts/)
		- bad-runs/: unsuccessful assemblies
		- FS851_output_mega2/: megahit assembly output for FS851
		- FS852_outputs_mega2/: megahit assembly output for FS852
		- FS854_outputs_mega_scavenger/: megahit assembly output for FS854
		- FS856_outputs_mega_scavenger/: megahit assembly output for FS856
	- data_processing/: for convenience, copies of all necessary output files for the data-parsing-AHF.ipynb script are in this directory
		- all.contigs_kofam.txt: copy of kofamscan output (columns used downstream were gene name and KO, the KEGG Orthology ID)
		- all-contigs-prokkannotated.gff: copy of prokka/prodigal output (raw output file that I used script scripts/prokka-gff-parse.txt to simplify to prokka-contigs-idsonly.gff)
		- all-contigs-prokkannotated.tsv: copy of prokka/prodigal output (associates locus tag with COG annotation with key columns locus_tag and COG)
		- calculations_for_bubble_plots.xlsx: the excel file used as a data input for bubble-plot-m?.ipynb. Formatted to be compatible with the author-provided bubble_plot_mod.py, but when this script proved very difficult to reproduce, I used my own python script. Manually modified by copy-and-pasting from normalized_m?_abun.tsv to try and be compatible with the author's code.
		- concatenateddf.tsv: output of data-parsing-AHF.ipynb. The complete dataframe that joins together contig IDs, COGG annotations, KO annotations, and the number of read hits to each contig.
		- genesofinterest.txt: metabolic genes of interest, as chosen by the authors, listed first by their metabolic group (named according to the figure in the paper), followed by comma-separated KEGG orthology IDs for easy parsing in data-parsing-AHF.ipynb. I manually created this file by searching gene names into the KO database and copy-pasting their IDs into this file.
		- m?_FS85?_quant.sf: copy of salmon output (read hits per contig id per sample)
		- normalized_mG_abun.tsv: final output of data-parsing-AHF.ipynb. Metagenomic read hits to metabolic genes of interest, standardized by average abundance of single-copy COGs.
		- normalized_mT_abun.tsv: final output of data-parsing-AHF.ipynb. Metatranscriptomic read hits to metabolic genes of interest, standardized by the total read abundance of the metatranscriptome for each sample location. 
		- prokka-contigs-idsonly.gff: copy of prokka/prodigal output (simplified from all-contigs-prokannotated.gff using script scripts/prokka-gff-parse.txt. Associates contig ID with locus tag)
		- sccogs_readhits.tsv: output of data-parsing-AHF.ipynb. Read hits per metagenomic sample to single-copy COGs, listed in singlecopycogs.txt.
		- singlecopycogs.txt: list of IDs for COGs that have a single copy within a given genome, provided by the paper's supplementary table 7.
	- download_data/: 
		- downloadedfilekey.tsv: list of the downloaded data
		- filereport_read_run_PRJEB15541_tsv.txt: list of the filtered data
		- filelist.csv: names of the files for downloading
	- figures/: original figures from the paper and reproduced figures from our analyses 
	- filtered/: contains the merged and filtered reads for each sample
	- kofam_outputs/: kofamscan outputs 
	- mapped_reads/: 
		- *sam: SAM files from bowtie2
		- *bam: BAM files converted with samtools
		- *sorted.bam: sorted BAM files
	- MegaHit_to_use_downstream/: cleaned directory for downstream use
		- all.contigs.fa: concatenated assembly with all four samples
		- *final.contigs.fa: assembly for each sample
		- *bt2: indexed assemblies (done by bowtie2) for mapping the reads
	- merged/: contains the merged reads for each sample
	- MUSCLE/: contains .faa files of mcrA sequences, the aligned output, and RAxML outputs
		- badbatch/: outputs of a bad run where we used DNA sequences to create the trees
	- prodigal-faas/: contains the megahit outputs needed to run prokka, as well as the prokka outputs
		- all.contigs.fa: copy of concatenated metagenome contigs
		- all.contigs_prokka_outputs/ contains all outputs generated by prokka
		- FS85*_output_mega*/: symbolic links to the original megahit outputs
		- vanilla_run_FS851/: contains prokka outputs of a test run using the base "vanilla" settings
	- salmon_quant_out/: 
		- MetaG*/: output for salmon quantification for each meta-G sample 
		- metaT*/: output for salmon quantification for each meta-T sample
	- silva/: 
		- LSURef_111_tax_silva.fasta.tgz: zipped fasta for LSU rDNA from Silva
		- LSURef_111_tax_silva.fasta: un-zipped fasta for LSU rDNA
		- SSURef_111_tax_silva.fasta.tgz: zipped fasta for SSU rDNA from Silva
		- SSURef_111_tax_silva.fasta: un-zipped fasta for SSU rDNA
		- aligned*: fasta of the reads that alinged to the LSU and SSU Silvas
		- unaligned*: fasta of the reads that we unalinged to the LSU Silva
		- *bt2: indices created by bowtie2 and used for alignment of rRNA
		- metaT_rRNA_removed/: contains the meta-T fastas that have the SSU and LSU removed
- scripts/:
	- aligning/: 
		- bowtie*: scripts for aligning meta-T and meta-G samples to the concatenated meta-G assembly. Requires bowtie2.yaml environment. 
		- sam_to_bam: scripts for converting SAM files from bowtie2 to BAM files. Requires samtools.yaml environment. 
		- concatenate.txt: script to prepare for bowtie2 alignment of metaT and metaG reads back to metaG contigs by concatenating the metaG alignments from the megahit output and making sure each header is unique.
		- build-index.txt: script to build index from concatenated metaG alignments from megahit output, using bowtie2. 
	- all.contigs.prokka.sbatch: script for annotating the concatenated metaG contig file. Requires prokka.yaml.
	- bowtie_rRNAremove_metaT: script for removing the rRNA from the meta-T samples. Requires bowtie2.yaml environment.
	- filter_merge/: requires illumina-utils.yaml environment 
		- filter.sh: script for filtering the merged reads
		- merge.sh: script for merging the raw reads
		- *config.ini: scripts for configuring the raw reads for illumina-utils merge
	- kofamscan_steps/: contains scripts needed for KO annotation of prokka outputs, as well as the requires config.yml. Requires kofamscan.yaml.
	- megahit_batches/: scripts for assembling meta-G reads with megahit. Requires megahit.yaml environment. 
	- ML_trees/: contains scripts and instructions for generating maximum likelyhood trees for mcrA genes
		- KO_search.sh: script for extracting HHHB identifiers of proteins that match mcrA KO
		- MUSCLE_alignment.sh: script for concatenating .faa files and then aligning them through MUSCLE. Requires MUSCLExl.yaml.
		- RAxML_tree.sh: script for generating maximum likeyhood trees from aligned .faa files. Requires MUSCLExl.yaml
	- salmon.sbatch: script to quantify the number of reads aligned to the concatenated assembly for each sample. Requires salmon.yaml environment. 
	- prokka-gff-parse.txt: script to simplify the prokka .gff output file to just get the lines that associate contig id with gene id. 
