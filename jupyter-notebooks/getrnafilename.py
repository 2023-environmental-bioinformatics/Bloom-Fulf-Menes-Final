#author: Avery
#this file was written to automate the process of creating config files for the illumina-utils package, which uses config files
#per sample to merge and then filter reads. The illumina-utils merge command requires a config file which lists project name, specified with 
#the sample name, mG vs mT, and R1 vs 2, with an equals sign. After the equals sign, each raw datafile within that project needs to be listed, 
#separated by a comma and a space. This script prints a correctly formatted string for easy copy-and-pasting into the corresponding config file.

#name the lists to append to in following for-loops
header = []
metaG = []
metaT = []
FS851_mG = []
FS851_mG = []
FS851_mT = []
FS852_mG = []
FS852_mT = []
FS854_mG = []
FS854_mT = []
FS856_mG = []
FS856_mT = []
FS851_mG_R1 = []
FS851_mG_R2 = []
FS851_mT_R1 = []
FS851_mT_R2 = []
FS852_mG_R1 = []
FS852_mG_R2 = []
FS852_mT_R1 = []
FS852_mT_R2 = []
FS854_mG_R1 = []
FS854_mG_R2 = []
FS854_mT_R1 = []
FS854_mT_R2 = []
FS856_mG_R1 = []
FS856_mG_R2 = []
FS856_mT_R1 = []
FS856_mT_R2 = []


with open('downloadedfilekey.tsv','r') as f: #open the file key, downloaded from the database
        for line in f:
                lst = line.strip().split('\t') #split each line, without formatting, into a list
                if lst[0] == 'run_accession':
                        header.append(lst) #separate the header from the rest of the file
                else: #for each line that is not the header ...
#                       print(lst)
#                       print(lst[5])
                        R1 = lst[4].split(';')[0] #separate the R1 from the R2
                        R2 = lst[4].split(';')[1]
                        if 'RNA' in lst[5]:
                                metaT.append(R1.split('/')[-1]) #get the metaT R1 reads into a list
                                metaT.append(R2.split('/')[-1]) #get the metaT R2 reads into a list
                        if 'RNA' not in lst[5]:
                                metaG.append(R1.split('/')[-1]) #get the metaG R1 reads into a list
                                metaG.append(R2.split('/')[-1]) #get the metaG R2 reads into a list

#	print(metaG)
#	print(metaT)

	for filename in metaG: #for each filename in the metaG list I appended to above, separate out by sample and R1 vs R2 by appending to new lists
		if 'FS851' in filename:
			if 'R1' in filename:
				FS851_mG_R1.append(filename)
			if 'R2' in filename:
				FS851_mG_R2.append(filename)
		if 'FS852' in filename:
                        if 'R1'	in filename:
                                FS852_mG_R1.append(filename)
                        if 'R2'	in filename:
                                FS852_mG_R2.append(filename)
		if 'FS854' in filename:
                        if 'R1'	in filename:
                                FS854_mG_R1.append(filename)
                        if 'R2'	in filename:
                                FS854_mG_R2.append(filename)
		if 'FS856' in filename:
                        if 'R1'	in filename:
                                FS856_mG_R1.append(filename)
                        if 'R2'	in filename:
                                FS856_mG_R2.append(filename)

	for filename in metaT: #for each filename in the metaT list I appended to above, separate out by sample	and R1 vs R2 by	appending to new lists
                if 'FS851' in filename:
                        if 'R1'	in filename:
                                FS851_mT_R1.append(filename)
                        if 'R2'	in filename:
                                FS851_mT_R2.append(filename)
                if 'FS852' in filename:
                        if 'R1' in filename:
                                FS852_mT_R1.append(filename)
                        if 'R2' in filename:
                                FS852_mT_R2.append(filename)
                if 'FS854' in filename:
                        if 'R1' in filename:
                                FS854_mT_R1.append(filename)
                        if 'R2' in filename:
                                FS854_mT_R2.append(filename)
                if 'FS856' in filename:
                        if 'R1' in filename:
                                FS856_mT_R1.append(filename)
                        if 'R2' in filename:
                                FS856_mT_R2.append(filename)

f.close()

#The variable I named lstlst is a list of the lists I created above, so each item in the list is a list itself of all the filenames that correspond to that combination of sample, mG vs mT, and R1 vs R2. 
#The variable named lstlstnames is a list of all the strings with categories based on sample, mG vs mT, and R1 vs R2.
lstlstnames = ['FS851_mG_R1', 'FS851_mG_R2', 'FS851_mT_R1', 'FS851_mT_R2', 'FS852_mG_R1', 'FS852_mG_R2', 'FS852_mT_R1', 'FS852_mT_R2', 'FS854_mG_R1', 'FS854_mG_R2', 'FS854_mT_R1', 'FS854_mT_R2', 'FS856_mG_R1', 'FS856_mG_R2', 'FS856_mT_R1', 'FS856_mT_R2']
lstlst = [FS851_mG_R1, FS851_mG_R2, FS851_mT_R1, FS851_mT_R2, FS852_mG_R1, FS852_mG_R2, FS852_mT_R1, FS852_mT_R2, FS854_mG_R1, FS854_mG_R2, FS854_mT_R1, FS854_mT_R2, FS856_mG_R1, FS856_mG_R2, FS856_mT_R1, FS856_mT_R2]

#This for-loop outputs the raw data filename within each project name in lstlst in the correct format to be copy-and-pasted into the illumina-utils config files.
#for each project name in lstlst, it prints the str project name at the corresponding index in lstlstnames, an equals sign, and each filename separated by a comma and space.
i=0
for projectname in lstlst:
	print(lstlstnames[i] + ' = ' + ', '.join(projectname))
	i += 1


#test to see if all filenames are downloaded
#downloadflist becomes a list of all file names that were successfully downloaded
downloadflist = []
with open('filelist.csv','r') as f2:
	for line in f2:
		linelst = line.strip().split() #separate each line in filelist.csv into a non-formatted list
		for filename in linelst: #for each filename in the list generated above,
			downloadflist.append(filename) #add it to the downloadflist list
f2.close()

print(downloadflist)

test to see if all filenames are downloaded by checking whether all project names in lstlst is in downloadflist. If not, the script will print the filenames that were not downloaded.
for lst in lstlst:
	for filename in lst:
		if filename not in downloadflist:
			print(filename + 'not downloaded')

