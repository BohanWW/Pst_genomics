## This script assumes that all files are in the same folder.
## Concatenate forward and reverse sequences. This also works on gzipped files.
## This assumes that the forward and reverse reads are named *_R1.fastq and *_R2.fastq respectively.

SEQ_READS=(*_R1.fastq)
for i in ${SEQ_READS[@]} ; do
R1=${i}
R2=${i%%_R1.fastq}_R2.fastq
NAME=$(basename ${i%%_R1.fastq})
cat ${R1} ${R2} > ${NAME}_cat.fastq
done

## Generate sequence signatures from concatenated fastq files.

CATSEQ=(*_cat.fastq)
for i in ${CATSEQ[@]} ; do
NAME=$(basename ${i%%_cat.fastq})
sourmash sketch dna -p k=21,scaled=10 ${i} -o ${NAME}.fastq.sig
done

## Generate sequence signatures from the genes of interest in fasta format.

PtbSEQ=(*.fasta)
for i in ${PtbSEQ[@]} ; do
NAME=$(basename ${i%%.fasta})
sourmash sketch dna -p k=21,scaled=10 ${i} -o ${NAME}.fasta.sig
done

## Search signatures.

PtbSIG=(*.sig)
for i in ${PtbSIG[@]} ; do
NAME=$(basename ${i%%.fastq.sig})
sourmash search ${i} *.sig --containment --threshold 0 --output ${NAME}.out
done
