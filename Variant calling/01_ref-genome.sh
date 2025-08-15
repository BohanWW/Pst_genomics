This file is used to prepare a reference genome for use in generating variant call files
conda activate gatk
#Index the reference genome Pt-1C-BFP supercontigs, index here is 'broad' short for BroadInstitute who sequenced Pt-1C-BFP
# $1 = reference fasta; $2 isolate name
mamba activate bowtie2
bowtie2-build $1 $2
#index the reference
mamba activate samtools
samtools faidx $1
#Create .dict for reference
gatk CreateSequenceDictionary -R $1

#This file shows steps used to generate variant call files for an isolate
#Run in dir where reference is located
mamba activate bowtie2
# $2 = reference genome
#Map raw illumina reads of isolate to the reference; check path to fastq files before running
#make the following codes as script “bowtie2.sh” and submit the job
bowtie2 -p 32 -x $2 -1 Yr-01-09_trimmed_R1.fastq -2 Yr-01-09_trimmed_R2.fastq -S 01_Yr-01-09.sam (.gz files also work)
