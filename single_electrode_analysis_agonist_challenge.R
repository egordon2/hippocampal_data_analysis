
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

# merge electrode burst datasets
output_table <- rbind(baseline_22DIV_25042023, 
                      agonist_challenge_22DIV_25052023_acute,
                      agonist_challenge_22DIV_25052023_30min,
                      agonist_challenge_22DIV_25052023_1h,
                      agonist_challenge_23DIV_25052023_24h)

# assign output_table to analysis_dataset
analysis_dataset <- output_table

# calculate burst parameters
# note time intervals updates based on start of electrode_burst_recording
# number of bursts
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 10802.57616, 10922.57616, recording_identifier = "agonist_challenge_22DIV_25052023_acute")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 11042.57616, 11162.57616, recording_identifier = "agonist_challenge_22DIV_25052023_acute")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 12722.5004, 12842.5004, recording_identifier = "agonist_challenge_22DIV_25052023_30min")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 14522.11672, 14642.11672, recording_identifier = "agonist_challenge_22DIV_25052023_1h")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 0, 120, recording_identifier = "agonist_challenge_23DIV_25052023_24h")

# burst duration
analysis_dataset <- electrode_burst_duration(data = analysis_dataset, 10802.57616, 10922.57616, recording_identifier = "agonist_challenge_22DIV_25052023_acute")
analysis_dataset <- electrode_burst_duration(data = analysis_dataset, 11042.57616, 11162.57616, recording_identifier = "agonist_challenge_22DIV_25052023_acute")
analysis_dataset <- electrode_burst_duration(data = analysis_dataset, 12722.5004, 12842.5004, recording_identifier = "agonist_challenge_22DIV_25052023_30min")
analysis_dataset <- electrode_burst_duration(data = analysis_dataset, 14522.11672, 14642.11672, recording_identifier = "agonist_challenge_22DIV_25052023_1h")
analysis_dataset <- electrode_burst_duration(data = analysis_dataset, 0, 120, recording_identifier = "agonist_challenge_23DIV_25052023_24h")

# number of spikes per burst
analysis_dataset <- electrode_spikes_per_burst(data = analysis_dataset, 10802.57616, 10922.57616, recording_identifier = "agonist_challenge_22DIV_25052023_acute")
analysis_dataset <- electrode_spikes_per_burst(data = analysis_dataset, 11042.57616, 11162.57616, recording_identifier = "agonist_challenge_22DIV_25052023_acute")
analysis_dataset <- electrode_spikes_per_burst(data = analysis_dataset, 12722.5004, 12842.5004, recording_identifier = "agonist_challenge_22DIV_25052023_30min")
analysis_dataset <- electrode_spikes_per_burst(data = analysis_dataset, 14522.11672, 14642.11672, recording_identifier = "agonist_challenge_22DIV_25052023_1h")
analysis_dataset <- electrode_spikes_per_burst(data = analysis_dataset, 0, 120, recording_identifier = "agonist_challenge_23DIV_25052023_24h")

# mean burst ISI
analysis_dataset <- electrode_mean_burst_ISI(data = analysis_dataset, 10802.57616, 10922.57616, recording_identifier = "agonist_challenge_22DIV_25052023_acute")
analysis_dataset <- electrode_mean_burst_ISI(data = analysis_dataset, 11042.57616, 11162.57616, recording_identifier = "agonist_challenge_22DIV_25052023_acute")
analysis_dataset <- electrode_mean_burst_ISI(data = analysis_dataset, 12722.5004, 12842.5004, recording_identifier = "agonist_challenge_22DIV_25052023_30min")
analysis_dataset <- electrode_mean_burst_ISI(data = analysis_dataset, 14522.11672, 14642.11672, recording_identifier = "agonist_challenge_22DIV_25052023_1h")
analysis_dataset <- electrode_mean_burst_ISI(data = analysis_dataset, 0, 120, recording_identifier = "agonist_challenge_23DIV_25052023_24h")

# create single electrode bar chart
single_electrode_barchart(data = analysis_dataset, electrode_parameter = "number_of_bursts", electrode_filter = "A1_1|A1_2", statistic = se)
single_electrode_barchart(data = analysis_dataset, electrode_parameter = "burst_duration", electrode_filter = "A1_1|A1_2", statistic = se)
single_electrode_barchart(data = analysis_dataset, electrode_parameter = "spikes_per_burst", electrode_filter = "A1_1|A1_2", statistic = se)
single_electrode_barchart(data = analysis_dataset, electrode_parameter = "mean_burst_ISI", electrode_filter = "A1_1|A1_2", statistic = se)

