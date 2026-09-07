blood_methylation_data <- read.csv("C:/Users/gbloc/OneDrive/Desktop/PCDHG_Gila/Coding/Methylation & Transcription Correlation/Meta-analysis results DMPs blood PCDH genes - Meta-analysis results DMPs blood PCDH genes (1).csv")
blood_transcription_data <- read.csv("C:/Users/gbloc/OneDrive/Desktop/PCDHG_Gila/Coding/Methylation & Transcription Correlation/Meta-analysis results DEGs blood PCDH genes - Meta-analysis results DEGs blood PCDH genes.csv.csv")
muscle_transcription_data <- read.csv("C:/Users/gbloc/OneDrive/Desktop/PCDHG_Gila/Coding/Methylation & Transcription Correlation/transcriptmi cmetanalysis for skeletal muscle - ametanalysisstderryay.csv.csv")
muscle_methylation_data <- read.csv("C:/Users/gbloc/OneDrive/Desktop/PCDHG_Gila/Coding/Methylation & Transcription Correlation/SKELETAL MUSCLE DMPS - Meta-analysis results DMPs muscle PCDH genes.csv")

library(dplyr)
library(tidyverse)
library(readr)
library(ggplot2)

#filter for only pcdh values
A1_filtered_blood_meth <- blood_methylation_data[grepl("(^|;)PCDHGA1(;|$)", blood_methylation_data$Annotated_genes), ]
A2_filtered_blood_meth <- blood_methylation_data[grepl("(^|;)PCDHGA2(;|$)", blood_methylation_data$Annotated_genes), ]
A3_filtered_blood_meth <- blood_methylation_data[grepl("(^|;)PCDHGA3(;|$)", blood_methylation_data$Annotated_genes), ]
A4_filtered_blood_meth <- blood_methylation_data[grepl("(^|;)PCDHGA4(;|$)", blood_methylation_data$Annotated_genes), ]
B1_filtered_blood_meth <- blood_methylation_data[grepl("(^|;)PCDHGB1(;|$)", blood_methylation_data$Annotated_genes), ]

#FDR < 0.05
sig_A1_filtered_blood_meth <- A1_filtered_blood_meth %>%
  filter(FDR < 0.005)
sig_A2_filtered_blood_meth <- A2_filtered_blood_meth %>%
  filter(FDR < 0.005)
sig_A3_filtered_blood_meth <- A3_filtered_blood_meth %>%
  filter(FDR < 0.005)
sig_A4_filtered_blood_meth <- A4_filtered_blood_meth %>%
  filter(FDR < 0.005)
sig_B1_filtered_blood_meth <- B1_filtered_blood_meth %>%
  filter(FDR < 0.005)

rm(A4_filtered_blood_meth)
#colours
#A1: #88cbe3
#A2: #fab35c
#A3: #87ed93
#A4:#fff985
#B1: #a175bd
  #
