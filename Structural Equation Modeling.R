rm(list = ls())
# Import necessary packages for exploratory factor analysis
library(psych)
library(GPArotation)
library(dplyr)
# Import the bfi dataset
data(bfi)
# Extract necessary question items from the bfi dataset
data_1 <- bfi[1:10]  # Extract agreeableness and conscientiousness
data_2 <- bfi[16:20]  # Extract neuroticism
data_3 <- cbind(data_1, data_2)  # Combine data_1 and data_2 column-wise
data_4 <- data_3[c(1:300),]  # Extract data for the first 300 people
data_5 <- na.omit(data_4)  # Remove data with missing values
nrow(data_5)  # Check the number of data points
# Check the number of construct factors
fa.parallel(data_5, fa = "fa")

#######################################################
# Exploratory Factor Analysis
#######################################################
# Perform exploratory factor analysis
result = fa(data_5, nfactors = 4, fm = "ml", rotate = "promax")
# Visualize the results of exploratory factor analysis
fa.diagram(result)


#######################################################
# Confirmatory Factor Analysis
#######################################################
# Import necessary packages
library(lavaan)
library(semTools)
library(semPlot)
library(GPArotation)
# Create the model
model1 <-  'cooperation =~ A1 + A2 + A3 + A4 + A5
            diligence =~ C1 + C2 + C3 + C4 +C5
            nervous =~ N1 + N2 + N3 + N4 +N5'
fit1 <- cfa(model1, data = data_5)  # Perform confirmatory factor analysis
summary(fit1, fit.measure=TRUE)  # Check the results
# Visualize the results
semPaths(fit1, style="lisrel", whatLabels="est",
         layout="tree", rotation=4,  edge.label.cex=0.8)

#######################################################
# Structural Equation Modeling
#######################################################
# Structural equation
# Create the model
model2 <-  'cooperation =~ A1 + A2 + A3 + A4 + A5
            diligence =~ C1 + C2 + C3 + C4 +C5
            nervous =~ N1 + N2 + N3 + N4 +N5
            diligence ~ cooperation + nervous'
# Execute the model
fit2 <- sem(model2, data = data_5)
# Check the results
summary(fit2, fit.measure=TRUE)
# Visualize the results
semPaths(fit2, style="lisrel", whatLabels="est",
         layout="tree", rotation=3,  edge.label.cex=0.8)

#######################################################
# Statistical Causal Discovery (LiNGAM)
#######################################################
library(dplyr)  # Import necessary package
KC <- select(.data = data_5, c("C1", "C2", "C3","C4","C5"))  # Extract conscientiousness data
# Import packages necessary for LiNGAM
#install.packages("tidyverse")
#install.packages("ggExtra")
#install.packages("BiocManager")
#BiocManager::install(c("graph", "RBGL"))
#install.packages("pcalg")
# Import necessary packages
library(tidyverse)
library(pcalg)
model_KC <- lingam(KC)  # Implement LiNGAM
as(model_KC, "amat")  # Display results
library(igraph)  # Load necessary package
KC_L <- lingam(KC)$Bpruned  # LiNGAM
rownames(KC_L) <- colnames(KC)  # Add row names
colnames(KC_L) <- colnames(KC)  # Add column names
GM2 <- t(abs(KC_L))  # Take absolute values and transpose
GM3 <- GM2*5/max(GM2)  # Adjust values to appropriate size
GM4 <- graph.adjacency(GM3, weighted=T, mode = "directed")  # Create data for graph
plot(GM4, edge.width=E(GM4)$weight)  # Create graph

