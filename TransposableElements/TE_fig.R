#Transposable Elements Ptr
data <- read.table('Z:/Bohan/_Stripe Rust/Genome/EDTA/Yr.TEsummary/Yr_TE_all.csv', header = TRUE, sep=",")
library(ggplot2)

#graph by full
cbPalette <- c(
  "#999999", "#E69F00", "#56B4E9", "#CC79A7", "#009E73", "#F0E442", "#0072B2",
  "#D55E00", "#E41A1C", "#377EB8", "#4DAF4A", "#984EA3", "#FF7F00", "#FFFF33",
  "#A65628", "#F781BF", "#66C2A5", "#FC8D62", "#8DD3C7", "#BEBADA", "#FB8072",
  "#80B1D3", "#FDB462", "#B3DE69", "#FCCDE5", "#D9D9D9", "#BC80BD", "#CCEBC5",
  "#FFED6F", "#1B9E77", "#D95F02", "#7570B3", "#E7298A", "#66A61E", "#E6AB02",
  "#A6761D", "#666666", "#A6CEE3", "#1F78B4", "#B2DF8A", "#33A02C", "#FB9A99",
  "#E31A1C", "#FDBF6F", "#FF7F00", "#CAB2D6"
)

data.code <- aggregate(data$perc_masked ~ data$Isolate*data$Full, FUN = 'sum')
iso <- data.code$`data$Isolate`
Class <- data.code$`data$Full`
TE <- data.code$`data$perc_masked`

ggplot(data.code,aes(x=iso,y=TE, fill=Class))+
  geom_col(position="stack",width=0.7)  +
  xlab("Isolate")+ylab("Percentage of genome with transposable elements")+
  theme(text = element_text(size=14),
        axis.text.x = element_text(angle=45, hjust=1))+
  scale_fill_manual(values=cbPalette)

###Alternatively, we can use this script###
library(ggplot2)

# Assuming your dataframe is named 'data' and has columns:
# Isolate (chr), FULL (chr), perc_masked (chr like "0.01%")

# 1. Convert perc_masked from percentage string to numeric
data$perc_masked_num <- as.numeric(sub("%", "", data$perc_masked))

# 2. Aggregate sum of perc_masked_num by Isolate and FULL
data.code <- aggregate(perc_masked_num ~ Isolate * FULL, data = data, FUN = sum)

# 3. Rename columns for clarity
colnames(data.code) <- c("Isolate", "FULL", "perc_masked_sum")

# 4. Generate a color palette (you can customize or generate more colors if needed)
# Here we generate a palette with length equal to unique FULL categories
n_colors <- length(unique(data.code$FULL))
cbPalette <- colorRampPalette(c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", 
                                "#0072B2", "#D55E00", "#CC79A7", "#A65628", "#984EA3"))(n_colors)

# 5. Plot stacked bar plot
ggplot(data.code, aes(x = Isolate, y = perc_masked_sum, fill = FULL)) +
  geom_col(position = "stack", width = 0.7) +
  xlab("Isolate") +
  ylab("Percentage of genome with transposable elements") +
  theme(text = element_text(size = 14),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_manual(values = cbPalette) +
  guides(fill = guide_legend(title = "TE Classification"))

