nano gatk_unzipping.sh
#’gatk_unzipping.sh’:
#having problems downstream with the zipped output file, unzipping seems to solve it
gunzip Pst_all-filtered_pst130_full.fna.vcf.gz

gatk VariantsToTable -F CHROM -F POS -F TYPE -F EVENTLENGTH -F NSAMPLES -F NCALLED \
-F QUAL -F AC -F AF -F AN -F DP -F QD -F FS -F MLEAC -F MLEAC -F MQ -F MQRankSum \
-F ReadPosRankSum -F SOR --variant Pst_all-filtered_pst130_full.fna.vcf --output Pst_all-filtered_pst130_full.fna.tab

gatk VariantsToTable --show-filtered -F FILTER -F CHROM -F POS -F TYPE -F EVENTLENGTH -F NSAMPLES -F NCALLED \
-F QUAL -F AC -F AF -F AN -F DP -F QD -F FS -F MLEAC -F MLEAC -F MQ -F MQRankSum \
-F ReadPosRankSum -F SOR --variant Pst_all-filtered_pst130_full.fna.vcf --output Pst_all-filtered_pst130_full.fna.plain.tab

# Install vcftools
mamba install vcftools
mamba create --name vcftools

git clone https://github.com/vcftools/vcftools.git
cd vcftools
./autogen.sh
./configure
make
make install

nano pst_06_vcftools-filter.sh
#!/bin/bash

#SBATCH --job-name=
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
# Your script goes here

#conda activate vcftools
#https://vcftools.github.io/man_latest.html

vcftools --vcf Pst_all-filtered_pst130.vcf --remove-indels --remove-filtered-all --maf 0.05 --min-alleles 2 --max-alleles 2 --max-missing 0.7 --recode --out Pst_allisolates_filtered

mamba activate vcftools

sbatch pst_06_vcftools-filter.sh

