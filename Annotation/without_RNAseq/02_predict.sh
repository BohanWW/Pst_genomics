#!/bin/bash

#SBATCH --job-name=pdc_Yr-84-17
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
# Your script goes here 

funannotate predict -i Yr-84-17_masurca.fa -o Yr-84-17 \
   	--species " Puccinia striiformis f. sp. tritici " --strain Yr-84-17 \
   	--busco_seed_species ustilago_maydis --cpus 32 \
	--force
