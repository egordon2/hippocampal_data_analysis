
####################################################################################################################
# R script to perform single electrode analysis of hippocampal neuronal cultures
# AGONIST CHALLENGE (see plate map for conditions)
####################################################################################################################

# load MEA analysis package
library(MEAanalysis)

# load electrode burst csv files
baseline_22DIV_25042023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_22DIV_25-04-2023(000)_electrode_burst_list.csv", 
                                                    recording_identifier = "baseline_22DIV_25042023")
agonist_challenge_22DIV_25052023_acute <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_22DIV_Agonists Challenge_25-04-2023(000)_electrode_burst_list.csv", 
                                                                   recording_identifier = "agonist_challenge_22DIV_25052023_acute")
agonist_challenge_22DIV_25052023_30min <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_22DIV_Agonists Challenge_30min after_25-04-2023(000)_electrode_burst_list.csv", 
                                                                   recording_identifier = "agonist_challenge_22DIV_25052023_30min")
agonist_challenge_22DIV_25052023_1h <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_22DIV_Agonists Challenge_1h after_25-04-2023(000)_electrode_burst_list.csv", 
                                                                recording_identifier = "agonist_challenge_22DIV_25052023_1h")
agonist_challenge_23DIV_25052023_24h <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_23DIV_Agonists Challenge_24h after_26-04-2023(000)(000)_electrode_burst_list.csv", 
                                                                 recording_identifier = "agonist_challenge_23DIV_25052023_24h")

