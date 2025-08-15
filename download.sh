### Download the sequences from the website
# copy the URL from the seq website
wget https://website
# rename the file into a neat name
mv $1 > $2
# change fastq file to fasta file
seqtk seq file.fastq > file.fasta
### Unzip the file for further analyze 
# Unzip the file
unzip file.zip
# to delete a file in the zip file, run the zip command deleting (-d) the test3 file from the (newfiles.zip) ZIP file.
zip -d newfiles.zip test3
# Verifying the Zip File Integrity: The zip command below recursively (-r) searches through the working directory for the (newfiles.zip) zip file, then verifies (-T) if it’s in good condition.
zip -r -T newfiles
#unzip .gz file
gunzip file.gz
#unzip tarball
tar -xvzf file.tar.gz
 
