#merge GVCFs from multiple samples to unify SNP quality scores
#should make this universal later
# index each file 
gatk IndexFeatureFile \
-I Yr-01-09.g.vcf.gz
#make sure no periods at the end of the .gz file
#make this as a script ‘gatk_merge02.sh’
#run this job at the ‘variants_calling’ folder
#‘gatk_merge02.sh’:
gatk --java-options "-Xmx4g -Xms4g" GenomicsDBImport \
	-V gvcf/Yr-01-09.g.vcf.gz \
	-V gvcf/Yr-14-03.g.vcf.gz \
	-V gvcf/Yr-16-05.g.vcf.gz \
	-V gvcf/Yr-20-01.g.vcf.gz \
	-V gvcf/Yr-20-04.g.vcf.gz \
	-V gvcf/Yr-20-05.g.vcf.gz \
	-V gvcf/Yr-22-12.g.vcf.gz \
	-V gvcf/Yr-84-17.g.vcf.gz \
	-V gvcf/Yr-89-08.g.vcf.gz \
--genomicsdb-workspace-path merged_gvcf_all \
--tmp-dir /data/stripe_rust/variants_calling/tmp \
--interval-padding 100 \
	-L gvcf/Yr-01-09.g.vcf.gz \
	-L gvcf/Yr-14-03.g.vcf.gz \
	-L gvcf/Yr-16-05.g.vcf.gz \
	-L gvcf/Yr-20-01.g.vcf.gz \
	-L gvcf/Yr-20-04.g.vcf.gz \
	-L gvcf/Yr-20-05.g.vcf.gz \
	-L gvcf/Yr-22-12.g.vcf.gz \
	-L gvcf/Yr-84-17.g.vcf.gz \
	-L gvcf/Yr-89-08.g.vcf.gz
