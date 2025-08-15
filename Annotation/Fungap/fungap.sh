#optional: filter contigs
#mamba activate bbmap
#filter contigs using minlength or maxlength
reformat.sh in=$1 out=$1.filtered minlength=1000
#submit a job to run fungap
Nano runFunGAP2.sh
#!/bin/bash

#SBATCH --job-name=Yr-90-04_FunGAP
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
# Your script goes here

mamba activate fungap
python ~/FunGAP/fungap.py \
  --output_dir Yr-90-04 \
  --trans_read_s SRR26344775_s.fastq \
  --genome_assembly Yr-90-04_masurca.fa \
  --augustus_species ustilago_maydis \
  --busco_dataset basidiomycota_odb10 \
  --sister_proteome sister_orgs/prot_db.faa \
  --num_cores 32
