#!/bin/bash

#SBATCH --job-name=pangloss
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
# Your script goes here

#Run pangloss
python2 /data/stripe_rust/pangloss/pangenome_Yr/Pangloss/Pangloss.py --no_pred --ips --size --upset pstconfig.ini
