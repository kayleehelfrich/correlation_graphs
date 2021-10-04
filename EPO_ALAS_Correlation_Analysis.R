rm(list=ls())
library(ggplot2)
library(ggpubr)
setwd("~/KayleeStuff/Smith_Lab/Data/Mouse_Validation_Data/Epo_Correlation")
Data_file <- "FetalLiver_EPO_ALAS1and2_Correlation.csv"

#reads a file in a table format and creates a data frame from it
data <- read.csv(Data_file, header=TRUE) 
data_frame <- data.frame(data)

#initialize a high resolution graph
png("FetLiv_EPO_qPCR_RNAseq_Correlation.png", units="in", width=7, height=7, res=600) 

#Scatter plot with correlation analyses- Epo from qPCR and Epo from RNAseq
#with total counts
sp <- ggscatter(data_frame, x = "Fet.EPO.qPCR.FoldChange", y = "RNAseq.Epo", #creates graph
                color = "Biological.Sets", size = 3, #sets color and shape based on pre-set variables
                palette = c("black", "gray"), #sets color of points
                add = "reg.line", #adds a regression line
                add.params = list(color = "red"), #adds color of regression line
                title = "Correlation of Epo from RNAseq and qPCR",  #sets main graph title
                xlab = "Epo from qPCR", ylab = "Epo from RNAseq", #sets x-axis and y-axis labels
                legend = "right", 
                ellipse = FALSE) + #when true, adds an ellipse around the points
    stat_cor(method = "pearson", #uses Pearson correlation to analyze correlation
              label.x.npc = "middle", label.y.npc = "top", size = 6) #moves correlation numbers and label to desired location and size
print(sp)
#release PNG file graph into directory
dev.off() 

#with natural log counts
png("FetLiv_EPO_qPCR_NatLogRNAseq_Correlation.png", units="in", width=7, height=7, res=600) 

sp <- ggscatter(data_frame, x = "Fet.EPO.qPCR.FoldChange", y = "NaturalLog.Epo", #creates graph
                color = "Biological.Sets", size = 3, #sets color and shape based on pre-set variables
                palette = c("black", "gray"), #sets color of points
                add = "reg.line", #adds a regression line
                add.params = list(color = "red"), #adds color of regression line
                title = "Correlation of Epo from RNAseq and qPCR",  #sets main graph title
                xlab = "Epo from qPCR", ylab = "Epo from RNAseq (natural log)", #sets x-axis and y-axis labels
                legend = "right", 
                ellipse = FALSE) + #when true, adds an ellipse around the points
  stat_cor(method = "pearson", #uses Pearson correlation to analyze correlation
           label.x.npc = "middle", label.y.npc = "top", size = 6) #moves correlation numbers and label to desired location and size
print(sp)
dev.off() 

#RNAseq Epo with RNAseq Alas1
png("FetLiv_EPO_Alas1_RNAseq_Correlation.png", units="in", width=7, height=7, res=600) 

sp <- ggscatter(data_frame, x = "RNAseq.Epo", y = "RNAseq.Alas1", #creates graph
                color = "Biological.Sets", size = 3, #sets color and shape based on pre-set variables
                palette = c("black", "gray"), #sets color of points
                add = "reg.line", #adds a regression line
                add.params = list(color = "black"), #adds color of regression line
                title = "Correlation of Epo and Alas1 from RNAseq",  #sets main graph title
                xlab = "Epo from RNAseq", ylab = "Alas1 from RNAseq", #sets x-axis and y-axis labels
                legend = "right", 
                ellipse = FALSE) + #when true, adds an ellipse around the points
  stat_cor(method = "pearson", #uses Pearson correlation to analyze correlation
           label.x.npc = "middle", label.y.npc = "top", size = 6) #moves correlation numbers and label to desired location and size
print(sp)
dev.off()

#RNAseq Epo with RNAseq Alas2
png("FetLiv_EPO_Alas2_RNAseq_Correlation.png", units="in", width=7, height=7, res=600) 

sp <- ggscatter(data_frame, x = "RNAseq.Epo", y = "RNAseq.Alas2", #creates graph
                color = "Biological.Sets", size = 3, #sets color and shape based on pre-set variables
                palette = c("black", "gray"), #sets color of points
                add = "reg.line", #adds a regression line
                add.params = list(color = "black"), #adds color of regression line
                title = "Correlation of Epo and Alas2 from RNAseq",  #sets main graph title
                xlab = "Epo from RNAseq", ylab = "Alas2 from RNAseq", #sets x-axis and y-axis labels
                legend = "right", 
                ellipse = FALSE) + #when true, adds an ellipse around the points
  stat_cor(method = "pearson", #uses Pearson correlation to analyze correlation
           label.x.npc = "middle", label.y.npc = "top", size = 6) #moves correlation numbers and label to desired location and size
print(sp)
dev.off()

#Natural log RNAseq Epo with natural log RNAseq Alas1
png("FetLiv_EPO_Alas1_RNAseq_NatLog_Correlation.png", units="in", width=7, height=7, res=600) 

sp <- ggscatter(data_frame, x = "NaturalLog.Epo", y = "NaturalLog.Alas1", #creates graph
                color = "Biological.Sets", size = 3, #sets color and shape based on pre-set variables
                palette = c("black", "gray"), #sets color of points
                add = "reg.line", #adds a regression line
                add.params = list(color = "black"), #adds color of regression line
                title = "Correlation of the Natural Log of Epo and Alas1 from RNAseq",  #sets main graph title
                xlab = "Epo from RNAseq (natural log)", ylab = "Alas1 from RNAseq (natural log)", #sets x-axis and y-axis labels
                legend = "right", 
                ellipse = FALSE) + #when true, adds an ellipse around the points
  stat_cor(method = "pearson", #uses Pearson correlation to analyze correlation
           label.x.npc = "middle", label.y.npc = "top", size = 6) #moves correlation numbers and label to desired location and size
print(sp)
dev.off()

#Natural log RNAseq Epo with natural log RNAseq Alas2
png("FetLiv_EPO_Alas2_RNAseq_NatLog_Correlation.png", units="in", width=7, height=7, res=600) 

sp <- ggscatter(data_frame, x = "NaturalLog.Epo", y = "NaturalLog.Alas2", #creates graph
                color = "Biological.Sets", size = 3, #sets color and shape based on pre-set variables
                palette = c("black", "gray"), #sets color of points
                add = "reg.line", #adds a regression line
                add.params = list(color = "black"), #adds color of regression line
                title = "Correlation of the Natural Log of Epo and Alas2 from RNAseq",  #sets main graph title
                xlab = "Epo from RNAseq (natural log)", ylab = "Alas2 from RNAseq (natural log)", #sets x-axis and y-axis labels
                legend = "right", 
                ellipse = FALSE) + #when true, adds an ellipse around the points
  stat_cor(method = "pearson", #uses Pearson correlation to analyze correlation
           label.x.npc = "middle", label.y.npc = "top", size = 6) #moves correlation numbers and label to desired location and size
print(sp)
dev.off()
