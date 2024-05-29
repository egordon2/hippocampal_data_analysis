
####################################################################################################################
# R script to produce heatmap of hippocampal neuronal cultures synchrony index
# AGONIST CHALLENGE (see plate map for conditions)
####################################################################################################################

# load MEA analysis package
library(MEAanalysis)

# load neuralMetric csv files

agonist_challenge_22DIV_25052023_0_120 <- create_synchrony_dataset(data_path = "neural_metric_files/SI_agonist_challenge/agonist_challenge_22DIV_25052023_neuralMetrics_0-120.csv",
                                                                   heatmap_condition = "Baseline")
agonist_challenge_22DIV_25052023_240_360 <- create_synchrony_dataset(data_path = "neural_metric_files/SI_agonist_challenge/agonist_challenge_22DIV_25052023_neuralMetrics_240-360.csv",
                                                                   heatmap_condition = "Acute Agonist Challenge")
agonist_challenge_22DIV_25052023_30min <- create_synchrony_dataset(data_path = "neural_metric_files/SI_agonist_challenge/agonist_challenge_22DIV_25052023_30min_neuralMetrics.csv",
                                                                heatmap_condition = "30 min Post-Agonist Challenge")
agonist_challenge_22DIV_25052023_1h <- create_synchrony_dataset(data_path = "neural_metric_files/SI_agonist_challenge/agonist_challenge_22DIV_25052023_1h_neuralMetrics.csv",
                                                                     heatmap_condition = "1 hr Post-Agonist Challenge")
agonist_challenge_23DIV_26052023_24h <- create_synchrony_dataset(data_path = "neural_metric_files/SI_agonist_challenge/agonist_challenge_23DIV_26052023_24h_neuralMetrics.csv",
                                                                heatmap_condition = "24 hr Post-Agonist Challenge")

# merge neuralMetric datasets

df_list <- list(agonist_challenge_22DIV_25052023_0_120, 
                agonist_challenge_22DIV_25052023_240_360,
                agonist_challenge_22DIV_25052023_30min,
                agonist_challenge_22DIV_25052023_1h,
                agonist_challenge_23DIV_26052023_24h)
heatmap_data <- df_list %>%
  reduce(full_join, by = 'Well')

# create synchrony heatmap

MEA_heatmap(data = heatmap_data, well_filter = "A1|A2|A3|A4|A5|A6|B1|B2|B3|B4|B5|B6|C1|C2|C3|C4|C5|C6|D1|D2|D3|D4|D5|D6")
