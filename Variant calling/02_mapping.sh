#Convert sam file to bam
samtools view -S -b 01_$1.sam > 02_$1.bam
