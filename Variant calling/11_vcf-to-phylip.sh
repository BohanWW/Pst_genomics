### reference website: https://github.com/edgardomortiz/vcf2phylip 
python vcf2phylip.py --input Pst_allisolates_filtered.recode.vcf --fasta --min-samples-locus 60
# Which is equivalent to:
python vcf2phylip.py -i myfile.vcf -f -m 60
# This command will create a PHYLIP called myfile_min60.phy and a FASTA called myfile_min60.fasta
python vcf2phylip.py --input Pst_allisolates_filtered.recode.vcf --outgroup sample1 --fasta --nexus --nexus-binary
# Find the file ‘Pst_allisolates_filtered.recode.min26.fasta’, this is the final file we need, and move it to desktop for further analysing 
