#Correlation Analysis
rm(list=ls())
library(ggplot2)
library(ggpubr)
library(extrafont)
loadfonts(device = "win")
setwd("~/KayleeStuff/Smith_Lab/Data/Mouse_Validation_Data/Epo_Correlation")
Data_file <- "MatKid_FetLiv_EPO_Correlation.csv"

#reads a file in a table format and creates a data frame from it
data <- read.csv(Data_file, header=TRUE) 
data_frame <- data.frame(data)

#initialize a high resolution graph
png("FetLiv_MatKid_EPO_Correlation_FoldChange_B&W.png", units="in", width=5, height=7, res=600) 

#Scatter plot with correlation analyses
sp <- ggscatter(data_frame, x = "Mat.EPO.FoldChange", y = "Fet.EPO.FoldChange", #creates graph
                color = "Biological.Sets", size = 3, #sets color and shape based on pre-set variables
                palette = c("black", "gray"), #sets color of points
                add = "reg.line", #adds a regression line
                add.params = list(color = "black"), #adds color of regression line
                title = "Correlation of Fetal and Maternal Epo",  #sets main graph title
                xlab = "Maternal Epo Expression", ylab = "Fetal Epo Expression", #sets x-axis and y-axis labels
                legend = c(0.15, 0.88), 
                ellipse = FALSE) + #when true, adds an ellipse around the points
    stat_cor(method = "pearson", #uses Pearson correlation to analyze correlation
              label.x.npc = "left", label.y.npc = "top", size = 6) +
  scale_y_continuous(expand = c(0,0), limits = c(0,4)) +
  theme(text=element_text(size=24,  family="Times New Roman"),
        plot.title = element_text(hjust = 0.5, size=20, family = "Times New Roman"),
        legend.title = element_blank())
print(sp)

#release PNG file graph into directory
dev.off() 
