
####################################################################################################################
# R script to produce heatmap of hippocampal neuronal cultures synchrony index
# BLOCKER CHALLENGE (see plate map for conditions)
####################################################################################################################

# load MEA analysis package
library(MEAanalysis)

# load neuralMetric csv files

blocker_challenge_31DIV_04052023_0_120 <- create_synchrony_dataset(data_path = "neural_metric_files/SI_blocker_challenge/blocker_challenge_31DIV_04052023_neuralMetrics_0-120.csv",
                                                                   heatmap_condition = "Baseline")
blocker_challenge_31DIV_04052023_240_360 <- create_synchrony_dataset(data_path = "neural_metric_files/SI_blocker_challenge/blocker_challenge_31DIV_04052023_neuralMetrics_240-360.csv",
                                                                   heatmap_condition = "Acute Blocker Challenge")
blocker_challenge_31DIV_04052023_30min <- create_synchrony_dataset(data_path = "neural_metric_files/SI_blocker_challenge/blocker_challenge_31DIV_04052023_30min_neuralMetrics.csv",
                                                                     heatmap_condition = "30 min Post-Blocker Challenge")
blocker_challenge_31DIV_04052023_1h <- create_synchrony_dataset(data_path = "neural_metric_files/SI_blocker_challenge/blocker_challenge_31DIV_04052023_1h_neuralMetrics.csv",
                                                                   heatmap_condition = "1 hr Post-Blocker Challenge")
blocker_challenge_32DIV_05052023_24h <- create_synchrony_dataset(data_path = "neural_metric_files/SI_blocker_challenge/blocker_challenge_32DIV_05052023_24h_neuralMetrics.csv",
                                                                heatmap_condition = "24 hr Post-Blocker Challenge")


# merge neuralMetric datasets

df_list <- list(blocker_challenge_31DIV_04052023_0_120, 
                blocker_challenge_31DIV_04052023_240_360,
                blocker_challenge_31DIV_04052023_30min,
                blocker_challenge_31DIV_04052023_1h,
                blocker_challenge_32DIV_05052023_24h)
heatmap_data <- df_list %>%
  reduce(full_join, by = 'Well')

# create synchrony heatmap

MEA_heatmap(data = heatmap_data, well_filter = "A1|A2|A3|A4|A5|A6|B1|B2|B3|B4|B5|B6|C1|C2|C3|C4|C5|C6|D1|D2|D3|D4|D5|D6")
