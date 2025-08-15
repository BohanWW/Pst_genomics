#install interproscan
#download the program from https://www.ebi.ac.uk/interpro/download/InterProScan/ 
#install under a new environment named ‘interproscan’
#test run the script interproscan.sh
./interproscan.sh
#test run setup.py
python3 setup.py -f interproscan.properties
#after running fungap, move files “fungap_out_prot.faa” and “fungap_out.gff3” in the fungap_output directory to interproscan directory
#clean the * symbol in the fasta file
sed 's/\*//g' Yr-01-09_fungap.fasta > Yr-01-09_cleaned.fasta
#run interproscan
/home/AGR.GC.CA/weib/mambaforge/envs/interproscan/interproscan.sh -i Yr-01-09_cleaned.fasta -f tsv -appl Pfam --goterms -pa --iprlookup -b pfam --tempdir ./temp
#change name of the tsv file
mv pfam.tsv Yr-01-09.tsv
#run pfam
gff3_add_pfam.py --input_gff3 fungap_out.gff3 --pfam_file Yr-01-09.tsv
#the output file will be "fungap_out_pfam.gff3"
