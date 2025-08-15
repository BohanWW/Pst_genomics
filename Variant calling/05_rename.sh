#!/bin/bash

#SBATCH --job-name=Yr-91-02_rename
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#Rename read groups (GATK sometimes wants the bam files to have extra metadata like which library the data comes from)
#$1=isolate name $2=sample name

picard AddOrReplaceReadGroups -I 04_$1_removed_duplicates.bam -O 05_$1_readsgrouped.bam -RGID 4 -RGLB lib1 -RGPL illumina -RGPU unit1 -RGSM $2

### Index the file
mamba activate samtools

samtools index 05_$1_readsgrouped.bam
