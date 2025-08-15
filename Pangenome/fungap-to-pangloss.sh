#get lines for genes only (i.e. no exons, cds, mrna)
grep "prediction_source" Yr-01-09.gff3 > Yr-01-09.att1
#remove columns for source (2), feature (3), score (6), sense (7), strand (8)
awk '{print $1,$9,$4,$5,$9}' Yr-01-09.att1 > Yr-01-09.att2
#replace ID= with iso_ , need to change iso name
sed 's/ID=/Yr-01-09_/g' Yr-01-09.att2 > Yr-01-09.att3
#add iso identifier column, need to change iso name
sed 's/$/\tYr-01-09/' Yr-01-09.att3 > Yr-01-09.att4
#replace ; with a space to breakup id and annotation
sed 's/;/ annotation/g' Yr-01-09.att4 > Yr-01-09.att5
#move annotation
awk '{print $1,$2,$3,$4,$5,$7,$8}' Yr-01-09.att5 > Yr-01-09.att6
awk '{print $1,$2,$4,$5,$6,$7}' Yr-01-09.att6 > Yr-01-09.att7
tr ' ' \\t < Yr-01-09.att7 >  Yr-01-09.att8
#convert the id column to match prot db
sed 's/\(|gene_.....\)/\1.t1/g' Yr-01-09.att8 > Yr-01-09.attributes
#remove intermediate files
rm Yr-01-09.att1 Yr-01-09.att2 Yr-01-09.att3 Yr-01-09.att4 Yr-01-09.att5 Yr-01-09.att6 Yr-01-09.att7 Yr-01-09.att8
