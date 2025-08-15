#Sort bam, things such as calling variants alignments must be sorted such that the alignments occur in “genome order”. That is, ordered positionally based upon their alignment coordinates on each chromosome.
samtools sort 02_$1.bam -o 03_$1.sorted.bam
