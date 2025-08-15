### Filter the genomes
mamba activate funannotate
funannotate clean -i Yr-84-17_masurca.fa --minlen 1000 -o Yr-84-17.cleaned.fa

### Sort your scaffolds by length and rename with a simple fasta header to avoid downstream problems.
funannotate sort -i Yr-84-17.cleaned.fa -b scaffold -o Yr-84-17.cleaned.sorted.fa

### Now we want to softmask the repetitive elements in the assembly.
#!/bin/bash

#SBATCH --job-name=Yr-90-04_FunGAP
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
# Your script goes here

funannotate mask -i Yr-84-17.cleaned.fa --cpus 12 -o Yr-84-17_assembly.fa
