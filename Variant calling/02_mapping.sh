#This file shows steps used to generate variant call files for an isolate
#Run in dir where reference is located
mamba activate bowtie2
# $2 = reference genome
#Map raw illumina reads of isolate to the reference; check path to fastq files before running
#make the following codes as script “bowtie2.sh” and submit the job
bowtie2 -p 32 -x $2 -1 Yr-01-09_trimmed_R1.fastq -2 Yr-01-09_trimmed_R2.fastq -S 01_Yr-01-09.sam (.gz files also work)

sbatch bowtie2.sh

squeue (check the job it from slump-out)
#Convert sam file to bam
samtools view -S -b 01_$1.sam > 02_$1.bam
#Sort bam, things such as calling variants alignments must be sorted such that the alignments occur in “genome order”. That is, ordered positionally based upon their alignment coordinates on each chromosome.
samtools sort 02_$1.bam -o 03_$1.sorted.bam
