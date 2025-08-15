#!/bin/bash
#SBATCH --job-name=Yr-20-04_masurca
#SBATCH --ntasks=1
#SBATCH –cpus		-per-task=32
# Your script goes here
fastp -w 32 -i  Yr-14-03_S1_L001_R1_001.fastq.gz -I  Yr-14-03_S1_L001_R2_001.fastq.gz -o Yr-14-03_trimmed_R1_001.fastq -O Yr-14-03_trimmed_R2_001.fastq
masurca -i Yr-14-03_trimmed_R1_001.fastq, Yr-14-03_trimmed_R2_001.fastq -t 32



### Files look like: CA/{primary,alternative}.scf.fasta. 
#Move the CA/{primary,alternative}.scf.fasta file to the isolate folder
#Rename it as Yr-14-03_masurca.fa
quast -o ./Yr-14-03_quast Yr-14-03_masurca.fa
#move all quast folders into the same ‘_assembliesGQ’ folder under ‘_striperust’ 
#move all Yr-14-03_masurca.fa of all isolates into the same ‘_assembliesGQ’ folder 
