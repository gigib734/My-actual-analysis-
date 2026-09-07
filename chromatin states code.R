

library(tidyverse)
library(openxlsx)
install.packages("readxl")
library(readxl)
library(readr)
methylation_data <- df
md <- df
head(md)
table(md$Annotated_genes)
library(tidyr)
library(dplyr)
md_split <- md %>%
  separate_rows('Annotated_genes', sep = ";")
head(md_split)
md_split_efect <- md_split %>%
  select('Annotated_genes', 'chr_state', Effect_size)
head(md_split_efect)
PCDHGA1_trial <- md_split_efect %>%
  filter(Annotated_genes == "PCDHGA1")
head(PCDHGA1_trial)


unique(md$Effect_size)
md_split_efect$Effect_size <- as.numeric(gsub("[^0-9.-]", "", md_split_efect$Effect_size))

x <- md_split_efect$Effect_size
x_clean <- as.numeric(x)

md_split_efect[is.na(x_clean) & !is.na(x), "Effect_size"]

md_split_efect$Effect_size <- as.numeric(md_split_efect$Effect_size)
str(md_split_efect$Effect_size)

grouped_md <- md_split_efect %>%
  group_by(Annotated_genes, chr_state) %>%
  summarise(
    mean_effect_size = mean(Effect_size, na.rm = TRUE),
    .groups = "drop"
  )
library(ggplot2)

PCDHGA1_triall <- grouped_md %>%
  filter(Annotated_genes == "PCDHGA1")

ggplot(PCDHGA1_triall, aes(x = chr_state, y = mean_effect_size)) +
  geom_bar(stat = "identity",
           show.legend = FALSE) + 
  xlab("Chromatin State") +
  ylab("Methylation Effect Direction") 

PCDHGB1 <- grouped_md %>%
  filter(Annotated_genes == "PCDHGB1")

ggplot(PCDHGB1, aes(x = chr_state, y = mean_effect_size)) +
  geom_bar(stat = "identity", fill = "#bc83d4") +
  geom_hline(yintercept = 0, linewidth = 1.2, color = "black") +
  xlab("Chromatin State") +
  ylab("Methylation Effect Direction") +
  theme_classic()
