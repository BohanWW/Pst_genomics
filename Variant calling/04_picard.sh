#!/bin/bash

#SBATCH --job-name=Yr-91-02_remove-duplicates
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#Mark and remove duplicates from aligned BAM
#$1=isolate name job


picard MarkDuplicates --REMOVE_DUPLICATES -I 03_$1.sorted.bam -O 04_$1_removed_duplicates.bam -M 04_$1_marked_dup_metrics.txt

