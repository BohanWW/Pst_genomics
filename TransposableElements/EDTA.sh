#!/bin/bash
#SBATCH --job-name=edta_yr-01-09
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
# Your script goes here

#Run EDTA on individual assemblies
perl /home/AGR.GC.CA/weib/mambaforge/envs/EDTA/bin/EDTA.pl \
    --genome /data/stripe_rust/EDTA_TEST/Yr-16-05_masurca.fa \
    --sensitive 1 \
    --anno 1 \
    --threads 40 \
--force 1
