#joint genotyping on GenomicsDB workspace created with GenomicsDBImport
#in this case ‘VariantsCalling_GQ’ was the workspaces directory
# Create the temporary directory (double check before running scripts)
mkdir -p /data/stripe_rust/VariantsCalling_GQ/merged_gvcf_all/tmp
# Set read/write permissions
chmod -R u+rwx /data/stripe_rust/VariantsCalling_GQ/merged_gvcf_all
chmod -R u+rwx /data/stripe_rust/VariantsCalling_GQ/merged_gvcf_all/tmp
#$1 = reference fasta
gatk --java-options "-Xmx4g" GenotypeGVCFs \
   		-R pst130_full.fna \
		-V gendb://merged_gvcf_all \
		-O Pst_31isolates0730_unfiltered.vcf.gz \   
		--tmp-dir /data/stripe_rust/VariantsCalling_GQ/merged_gvcf_all/tmp
