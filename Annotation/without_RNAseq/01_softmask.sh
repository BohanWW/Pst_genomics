### First we want to softmask the repetitive elements in the assembly
#!/bin/bash

#SBATCH --job-name=softmask_Yr-84-17
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
# Your script goes here 

funannotate mask -i Yr-84-17_masurca.fa --cpus 12 -o Yr-84-17_assembly.fa
