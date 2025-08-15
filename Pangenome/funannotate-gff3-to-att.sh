#get lines for genes only (i.e. no exons, cds, mrna)
grep "gene" Yr-91-02.gff3 > Yr-91-02.att1
#remove columns for source (2), feature (3), score (6), sense (7), strand (8)
awk '{print $1,$9,$4,$5,$9}' Yr-91-02.att1 > Yr-91-02.att2
#replace ID= with iso_ , need to change iso name
sed 's/ID=/Yr-91-02_/g' Yr-91-02.att2 > Yr-91-02.att3
#add iso identifier column, need to change iso name
sed 's/$/\tannotation\tYr-91-02/' Yr-91-02.att3 > Yr-91-02.att4
#replace ; with a space to breakup id and annotation
sed 's/;/ /g' Yr-91-02.att4 > Yr-91-02.att6
#move annotation
#awk '{print $1,$2,$3,$4,$5,$7,$8}' Yr-91-02.att5 > Yr-91-02.att6
awk '{print $1,$2,$3,$4,$6,$7}' Yr-91-02.att6 > Yr-91-02.att7
tr ' ' \\t < Yr-91-02.att7 >  Yr-91-02.att8
#convert the id column to match prot db
sed 's/\(FUN_......\)/\1-T1/g' Yr-91-02.att8 > Yr-91-02.attributes
rm Yr-91-02.att1 Yr-91-02.att2 Yr-91-02.att3 Yr-91-02.att4 Yr-91-02.att6 Yr-91-02.att7 Yr-91-02.att8
