#Create a script in windows using notepad but in bat format ‘pst_gtrgamma.bat’
REM This file is for pst RAxML maximun liklihood gtrgamma substitution model
REM -s sequence file (ie. fasta)
REM -m model (gtrgamma)
REM -n output name 
REM -p random seed 
REM -T threads (ie. cores)
REM -# bootstraps
REM -x rapid bootstrapping + seed generation
REM -f algorium selection

raxmlHPC-PTHREADS -f a -p 12345 -s Pst_allisolates_filtered.recode.min26.fasta -x 12345 -# 1000 -m GTRGAMMA -n PstSNPs -T 2 
use command prompt
#dir=ls
cd "OneDrive - AGR-AGR"\Desktop\standard-RAxML\WindowsExecutables_v8.2.10>
pst_gtrgamma.bat
find the ‘RAxML_bestTree.PstSNPs’
go to the ITOL website: https://itol.embl.de/tree/2051943299177171710120892 
upload the besttree snps file.
