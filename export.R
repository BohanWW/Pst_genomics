## Export csv.
write.csv(heatframe, "Mating_types_all_ste.csv")

## select top 4 similarty scores
top4 <- heatframe[order(heatframe$Similarity, decreasing = TRUE), ]  # Order data descending
top4 <- Reduce(rbind,                                 # Top N highest values by group
               by(top4,
                  top4["Genotype"],
                  head,
                  n = 4))
write.csv(top4, "Mating_types_all_top4.csv")
