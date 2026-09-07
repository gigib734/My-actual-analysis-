#grouping by chromatin state and summarising effect sizes
chr_B1 <- sig_B1_filtered_muscle_meth %>%
  group_by(chr_state) %>%
  summarise(
    weighted_effect_size = sum(Effect_size / (SE^2)) / sum(1/(SE^2)),
    n=n(),
    .groups = 'drop'
  )


#A1
ggplot(chr_A1, aes(x = chr_state, y = weighted_effect_size)) +
  geom_bar(stat = "identity", fill = "#88cbe3") +
  geom_hline(yintercept = 0, linewidth = 1.2, color = "black") +
  geom_text(aes(label = paste("n =", n)), vjust = -0.5, size = 3.5) +
  xlab("Chromatin State") +
  ylab("Methylation Effect Direction") +
  theme_classic()

#A2
ggplot(chr_A2, aes(x = chr_state, y = weighted_effect_size)) +
  geom_bar(stat = "identity", fill = "#f28d57") +
  geom_hline(yintercept = 0, linewidth = 1.2, color = "black") +
  geom_text(aes(label = paste("n =", n)), vjust = -0.5, size = 3.5) +
  xlab("Chromatin State") +
  ylab("Methylation Effect Direction") +
  theme_classic()
#A3
ggplot(chr_A3, aes(x = chr_state, y = weighted_effect_size)) +
  geom_bar(stat = "identity", fill = "#87ed93") +
  geom_hline(yintercept = 0, linewidth = 1.2, color = "black") +
  geom_text(aes(label = paste("n =", n)), vjust = -0.5, size = 3.5) +
  xlab("Chromatin State") +
  ylab("Methylation Effect Direction") +
  theme_classic()
#A4
ggplot(chr_A4, aes(x = chr_state, y = weighted_effect_size)) +
  geom_bar(stat = "identity", fill = "#fffa63") +
  geom_hline(yintercept = 0, linewidth = 1.2, color = "black") +
  geom_text(aes(label = paste("n =", n)), vjust = -0.5, size = 3.5) +
  xlab("Chromatin State") +
  ylab("Methylation Effect Direction") +
  theme_classic()
#B1
ggplot(chr_B1, aes(x = chr_state, y = weighted_effect_size)) +
  geom_bar(stat = "identity", fill = "#f89cff") +
  geom_hline(yintercept = 0, linewidth = 1.2, color = "black") +
  geom_text(aes(label = paste("n =", n)), vjust = -0.5, size = 3.5) +
  xlab("Chromatin State") +
  ylab("Methylation Effect Direction") +
  theme_classic()
