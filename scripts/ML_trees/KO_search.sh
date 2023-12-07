#from the kofam-output directory, I'm using grep to find information about the mcrA genes in the contigs 
#the paper says that the K0/KEGG0 value for mcrA is K00399, so I'll search for that in the all.contigs_kofam.txt
for i in *.txt; do echo $i; grep -n "K00399" $i >> K0_mcrA_genes.info; done

#this file will contain the line number, HHHBGIEE identifier and the e-value of the protein suspected to be mcrA
you can extract these from the main prokka output file all.contigs-prokkaannotated.faa using a version of this:
#grep -A 11 'HHHBGIEE_[number]' all-contigs-prokkannotated.faa >> HHHBGIEE_[number].faa

#these outputs will be concatenated later in the MUSCLE script
