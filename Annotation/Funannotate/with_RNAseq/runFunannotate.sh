#!/bin/bash

#SBATCH --job-name=train_Yr-17-12
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
# Your script goes here

funannotate train -i Yr-17-12_assembly.fa -o Yr-17-12 \
    --left liquid_R1.fq.gz solid_R1.fq.gz medium_R1.fq.gz \
    --right liquid_R2.fq.gz solid_R2.fq.gz medium_R2.fq.gz \
    --nanopore_mrna nanopore_mRNA.fq.gz \
    --stranded RF --jaccard_clip --species "Puccinia striiformis f. sp. tritici" \
--strain Yr-17-12 
--cpus 12
