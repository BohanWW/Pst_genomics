#Quality scores suggested by M. McDonald
#May need to adjust, but currently output looks good.
#$1 = reference fasta (pst130_full.fna)
QUAL=250
QD=20.0
FS=0.1
SOR=3.0
MQ=30.0
ReadPosRankSum_lower=-2.0
ReadPosRankSum_upper=2.0
MQRankSum_lower=-2.5
MQRankSum_upper=2.5
### Make a script
nano variantfiltraction.sh
# variantfiltraction.sh:
#gatk IndexFeatureFile -I Pst_all-isolates_unfiltered.vcf.gz
gatk VariantFiltration --reference $1 \
--variant Pst_all-isolates_unfiltered.vcf.gz \
--output Pst_all-filtered_$1.vcf.gz \
--filter-name QUALFilter --filter-expression "QUAL < 250"  \
--filter-name QDFilter --filter-expression "QD < 20.0" \
--filter-name FSFilter --filter-expression "FS > 0.1" \
--filter-name MQFilter --filter-expression "MQ < 30.0" \
--filter-name SORFilter --filter-expression "SOR > 3.0" \
--filter-name MQRSFilterLow --filter-expression "MQRankSum < -2.0" \
--filter-name MQRSFilterHigh --filter-expression "MQRankSum > 2.0" \
--filter-name RPRSFilterLow --filter-expression "ReadPosRankSum < -2.5"  \
--filter-name RPRSFilterHigh --filter-expression "ReadPosRankSum > 2.5"
