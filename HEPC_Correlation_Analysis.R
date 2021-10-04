rm(list=ls())
library(ggplot2)
library(ggpubr)
setwd("~/KayleeStuff/Smith_Lab/Data/Mouse_Validation_Data/Hepc_Correlation")
Data_file <- "MatLiv_FetLiv_HEPC_Correlation_Model1.csv"

#reads a file in a table format and creates a data frame from it
data <- read.csv(Data_file, header=TRUE) 
data_frame <- data.frame(data)

#initialize a high resolution graph
png("FetLiv_MatLiv_HEPC_Correlation_Model1_FoldChange.png", units="in", width=7, height=7, res=600) 

#Scatter plot with correlation analyses
sp <- ggscatter(data_frame, x = "Mat.HEPC.FoldChange", y = "Fet.HEPC.FoldChange", #creates graph
                color = "Biological.Sets", size = 3, #sets color and shape based on pre-set variables
                palette = c("black", "gray"), #sets color of points
                add = "reg.line", #adds a regression line
                add.params = list(color = "red"), #adds color of regression line
                title = "Correlation of Fetal and Maternal Liver Hepcidin, FC",  #sets main graph title
                xlab = "FC of maternal HEPC", ylab = "FC of fetal HEPC", #sets x-axis and y-axis labels
                legend = "right", 
                ellipse = FALSE) + #when true, adds an ellipse around the points
    stat_cor(method = "pearson", #uses Pearson correlation to analyze correlation
              label.x.npc = "middle", label.y.npc = "top", size = 6) #moves correlation numbers and label to desired location and size
print(sp)

#release PNG file graph into directory
dev.off() 

#adjust p values to account for multiple hypothesis testing
pvals <- c(0.19, 0.43, 0.54, 0.35)
p.adjust(pvals, method="BH")



#####MD and PAE only######
rm(list=ls())
setwd("~/KayleeStuff/Smith_Lab/Data/Mouse_Validation_Data/Epo_Correlation")
Data_file <- "MatKid_FetLiv_EPO_Correlation_PAEonly.csv"

#reads a file in a table format and creates a data frame from it
data <- read.csv(Data_file, header=TRUE) 
data_frame <- data.frame(data)

#initialize a high resolution graph
png("FetLiv_MatKid_EPO_Correlation_FoldChange_PAEonly.png", units="in", width=7, height=7, res=600) 

#Scatter plot with correlation analyses
sp <- ggscatter(data_frame, x = "Mat.EPO.FoldChange", y = "Fet.EPO.FoldChange", #creates graph
                color = "Biological.Sets", size = 3, #sets color and shape based on pre-set variables
                palette = c("black", "gray"),
                add = "reg.line", #adds a regression line
                add.params = list(color = "red"), #adds color of regression line
                title = "Correlation of Fetal Liver and Maternal Kidney Epo, FoldChange, PAE only",  #sets main graph title
                xlab = "FC of maternal EPO", ylab = "FC of fetal Epo", #sets x-axis and y-axis labels
                legend = "right", 
                ellipse = FALSE) + #when true, adds an ellipse around the points
  stat_cor(method = "pearson", #uses Pearson correlation to analyze correlation
           label.x.npc = "middle", label.y.npc = "top", size = 6) #moves correlation numbers and label to desired location and size
print(sp)

#release PNG file graph into directory
dev.off() 
