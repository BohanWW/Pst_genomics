## Move "*.out" of all alleles to "Z:/Bohan/_Stripe Rust/Genome/MAT".
library(ggplot2)
library(reshape2)
library(gplots)
library(dplyr)
setwd("Z:/Bohan/_Stripe Rust/Genome/MAT")

## Hardcode gene models. Comment in/out as necessary.


gene_models = list("Pst_bE1b-HD2", "Pst_bE1-HD2", "Pst_bE2-HD2", "Pst_bE3-HD2", "Pst_bE4-HD2", "Pst_bE5-HD2", "Pst_bE6-HD2", "Pst_bE7-HD2", "Pst_bE8-HD2", "Pst_bE9-HD2")

gene_models = list("Pst_bW1b-HD1", "Pst_bW1-HD1", "Pst_bW2-HD1", "Pst_bW3-HD1", "Pst_bW4-HD1", "Pst_bW5-HD1", "Pst_bW6-HD1", "Pst_bW7-HD1", "Pst_bW8-HD1", "Pst_bW9-HD1")

gene_models = list("Pst_STE3.2.1", "Pst_STE3.2.2", "Pst_STE3.2.3")

heatframe = data.frame(Gene_Model=factor(),Genotype=factor(),Similarity=numeric())

for (model in gene_models){
  filename = paste("Z:/Bohan/_Stripe Rust/Genome/MAT/ttest/",model,".out",sep = "")
  tempdata = read.delim(file = filename,header=TRUE,sep = ",")
  tempframe = data.frame(Gene_Model = model,Genotype = tempdata$filename,Similarity=tempdata$similarity)
  tempframe = data.frame(lapply(tempframe, function(x) {
    gsub("fastq_sigs/","",x)
  }))
  tempframe = data.frame(lapply(tempframe, function(x) {
    gsub("_cat.fastq.sig","",x)
  }))
  heatframe = rbind(heatframe,tempframe)
}
heatframe$Similarity = as.numeric(heatframe$Similarity)

## Generate heatmap.
heatmap = ggplot(heatframe,aes(x = Genotype,y=Gene_Model,fill=(Similarity))) + geom_tile() + guides(fill = guide_colourbar(barwidth = 0.5,barheight = 20))
heatmap

#Success! New tasks: identify good colourcoding for the different genotypes, as well as useful cutoffs, and make the genotypes readable (make it interactable??)

heatmap2 = ggplot(heatframe,aes(x = Genotype,y=Gene_Model,fill=(Similarity))) + geom_tile() + scale_fill_gradientn(colors = c("grey10","darkslategrey","darkolivegreen","seagreen4","deepskyblue","deepskyblue3"), values = c(0,0.4,0.5,0.8,0.9,1)) + guides(fill = guide_colourbar(barwidth = 0.5,barheight = 20)) + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1,size = 4))
heatmap2

#visualise distribution
freqhisto = ggplot(heatframe,aes(x = Similarity)) + geom_histogram(bins = 100)
freqhisto

heatmap3 = ggplot(heatframe,aes(y = Genotype,x=Gene_Model,fill=(Similarity))) + geom_tile() + scale_fill_gradientn(colors = c("grey10","darkslategrey","darkolivegreen","seagreen4","deepskyblue","deepskyblue3"), values = c(0,0.4,0.5,0.8,0.9,1)) + guides(fill = guide_colourbar(barwidth = 0.5,barheight = 20)) + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1,size = 8), axis.text.y = element_text(size = 4))
heatmap3

heatmap3 <- ggplot(heatframe, aes(y = Genotype, x = Gene_Model, fill = Similarity)) +
  geom_tile() +
  scale_fill_gradientn(
    colors = c("grey10", "darkslategrey", "darkolivegreen", "seagreen4", "deepskyblue", "deepskyblue3"),
    values = c(0, 0.4, 0.5, 0.8, 0.9, 1)
  ) +
  guides(fill = guide_colourbar(barwidth = 0.5, barheight = 20)) +
  theme(
    axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 0.4, size = 8),
    axis.text.y = element_text(size = 8)
  ) +
  scale_y_discrete(labels = function(y) gsub("\\.fastq\\.sig$", "", y))


heatmap3
