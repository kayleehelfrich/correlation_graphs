rm(list=ls())
library(ggplot2)
library(ggpubr)
library(extrafont)
loadfonts(device = "win")
setwd("~/KayleeStuff/Smith_Lab/Data/Mouse_Validation_Data/Fetal_Hepc_BodyWeight_Correlation")
Data_file <- "FetLiverHepc_FetBodyWeight_Correlation.csv"

#reads a file in a table format and creates a data frame from it
data <- read.csv(Data_file, header=TRUE) 
data_frame <- data.frame(data)

#initialize a high resolution graph
png("FetLivHepc_FetalBodyWeight_Correlation_B&W.png", units="in", width=7, height=7, res=600) 

#Scatter plot with correlation analyses
sp <- ggscatter(data_frame, x = "Final.Value", y = "Avg.Fetal.Wt", #creates graph
                color = "Biological.Sets", size = 3, #sets color and shape based on pre-set variables
                palette = c("black", "gray"), #sets color of points
                add = "reg.line", #adds a regression line
                add.params = list(color = "black"), #adds color of regression line
                title = "Correlation of Fetal Hepcidin Expression and Weight",  #sets main graph title
                xlab = "Fetal Hepcidin Expression", ylab = "Fetal Weight", #sets x-axis and y-axis labels
                #legend = c(0.15, 0.88), 
                ellipse = FALSE) + #when true, adds an ellipse around the points
    stat_cor(method = "pearson", #uses Pearson correlation to analyze correlation
              label.x.npc = "left", label.y.npc = "top", size = 6) +
  scale_y_continuous(expand = c(0,0), limits = c(0,1.5)) +
  theme(text=element_text(size=24,  family="Times New Roman"),
        plot.title = element_text(hjust = 0.5, size=20, family = "Times New Roman"),
        legend.title = element_blank())
print(sp)

#release PNG file graph into directory
dev.off() 

