
####################################################################################################################
# R script to process data for analysis of hippocampal neuronal cultures
# AGONIST CHALLENGE CHALLENGE 
####################################################################################################################

# Process electrode burst data #####################################################################################

# load electrode burst csv files
baseline_22DIV_25042023 <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_22DIV_Agonists Challenge_25-04-2023(000)_electrode_burst_list.csv", 
                                                    recording_identifier = "1_hippocampal_baseline")
agonist_challenge_22DIV_25052023_acute <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_22DIV_Agonists Challenge_25-04-2023(000)_electrode_burst_list.csv", 
                                                                   recording_identifier = "2_hippocampal_acute")
agonist_challenge_22DIV_25052023_30min <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_22DIV_Agonists Challenge_30min after_25-04-2023(000)_electrode_burst_list.csv", 
                                                                   recording_identifier = "3_hippocampal_30min")
agonist_challenge_22DIV_25052023_1h <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_22DIV_Agonists Challenge_1h after_25-04-2023(000)_electrode_burst_list.csv", 
                                                                recording_identifier = "4_hippocampal_1h")
agonist_challenge_23DIV_25052023_24h <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_23DIV_Agonists Challenge_24h after_26-04-2023(000)(000)_electrode_burst_list.csv", 
                                                                 recording_identifier = "5_hippocampal_24h")
# merge electrode burst datasets
output_table <- rbind(baseline_22DIV_25042023, 
                      agonist_challenge_22DIV_25052023_acute,
                      agonist_challenge_22DIV_25052023_30min,
                      agonist_challenge_22DIV_25052023_1h,
                      agonist_challenge_23DIV_25052023_24h)

# assign output_table to analysis_dataset
analysis_dataset <- output_table

# Use MEAanalysis package to generate the well average for each parameter
# number of bursts
analysis_dataset <- well_number_of_bursts(data = analysis_dataset, 10802.57616, 10922.57616, recording_identifier = "1_hippocampal_baseline")
analysis_dataset <- well_number_of_bursts(data = analysis_dataset, 11042.57616, 11162.57616, recording_identifier = "2_hippocampal_acute")
analysis_dataset <- well_number_of_bursts(data = analysis_dataset, 12722.5004, 12842.5004, recording_identifier = "3_hippocampal_30min")
analysis_dataset <- well_number_of_bursts(data = analysis_dataset, 14522.11672, 14642.11672, recording_identifier = "4_hippocampal_1h")
analysis_dataset <- well_number_of_bursts(data = analysis_dataset, 0, 120, recording_identifier = "5_hippocampal_24h")

# burst duration
analysis_dataset <- well_burst_duration(data = analysis_dataset, 10802.57616, 10922.57616, recording_identifier = "1_hippocampal_baseline")
analysis_dataset <- well_burst_duration(data = analysis_dataset, 11042.57616, 11162.57616, recording_identifier = "2_hippocampal_acute")
analysis_dataset <- well_burst_duration(data = analysis_dataset, 12722.5004, 12842.5004, recording_identifier = "3_hippocampal_30min")
analysis_dataset <- well_burst_duration(data = analysis_dataset, 14522.11672, 14642.11672, recording_identifier = "4_hippocampal_1h")
analysis_dataset <- well_burst_duration(data = analysis_dataset, 0, 120, recording_identifier = "5_hippocampal_24h")

# number of spikes per burst
analysis_dataset <- well_spikes_per_burst(data = analysis_dataset, 10802.57616, 10922.57616, recording_identifier = "1_hippocampal_baseline")
analysis_dataset <- well_spikes_per_burst(data = analysis_dataset, 11042.57616, 11162.57616, recording_identifier = "2_hippocampal_acute")
analysis_dataset <- well_spikes_per_burst(data = analysis_dataset, 12722.5004, 12842.5004, recording_identifier = "3_hippocampal_30min")
analysis_dataset <- well_spikes_per_burst(data = analysis_dataset, 14522.11672, 14642.11672, recording_identifier = "4_hippocampal_1h")
analysis_dataset <- well_spikes_per_burst(data = analysis_dataset, 0, 120, recording_identifier = "5_hippocampal_24h")

# mean burst ISI
analysis_dataset <- well_mean_burst_ISI(data = analysis_dataset, 10802.57616, 10922.57616, recording_identifier = "1_hippocampal_baseline")
analysis_dataset <- well_mean_burst_ISI(data = analysis_dataset, 11042.57616, 11162.57616, recording_identifier = "2_hippocampal_acute")
analysis_dataset <- well_mean_burst_ISI(data = analysis_dataset, 12722.5004, 12842.5004, recording_identifier = "3_hippocampal_30min")
analysis_dataset <- well_mean_burst_ISI(data = analysis_dataset, 14522.11672, 14642.11672, recording_identifier = "4_hippocampal_1h")
analysis_dataset <- well_mean_burst_ISI(data = analysis_dataset, 0, 120, recording_identifier = "5_hippocampal_24h")

# assign analysis_dataset to well_barchart_data
well_barchart_data <- analysis_dataset

# Use MEAanalysis package to generate burst parameters for each electrode
# refresh analysis_dataset 
analysis_dataset <- output_table

# number of bursts
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 10802.57616, 10922.57616, recording_identifier = "1_hippocampal_baseline")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 11042.57616, 11162.57616, recording_identifier = "2_hippocampal_acute")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 12722.5004, 12842.5004, recording_identifier = "3_hippocampal_30min")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 14522.11672, 14642.11672, recording_identifier = "4_hippocampal_1h")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 0, 120, recording_identifier = "5_hippocampal_24h")

# burst duration
analysis_dataset <- electrode_burst_duration(data = analysis_dataset, 10802.57616, 10922.57616, recording_identifier = "1_hippocampal_baseline")
analysis_dataset <- electrode_burst_duration(data = analysis_dataset, 11042.57616, 11162.57616, recording_identifier = "2_hippocampal_acute")
analysis_dataset <- electrode_burst_duration(data = analysis_dataset, 12722.5004, 12842.5004, recording_identifier = "3_hippocampal_30min")
analysis_dataset <- electrode_burst_duration(data = analysis_dataset, 14522.11672, 14642.11672, recording_identifier = "4_hippocampal_1h")
analysis_dataset <- electrode_burst_duration(data = analysis_dataset, 0, 120, recording_identifier = "5_hippocampal_24h")

# number of spikes per burst
analysis_dataset <- electrode_spikes_per_burst(data = analysis_dataset, 10802.57616, 10922.57616, recording_identifier = "1_hippocampal_baseline")
analysis_dataset <- electrode_spikes_per_burst(data = analysis_dataset, 11042.57616, 11162.57616, recording_identifier = "2_hippocampal_acute")
analysis_dataset <- electrode_spikes_per_burst(data = analysis_dataset, 12722.5004, 12842.5004, recording_identifier = "3_hippocampal_30min")
analysis_dataset <- electrode_spikes_per_burst(data = analysis_dataset, 14522.11672, 14642.11672, recording_identifier = "4_hippocampal_1h")
analysis_dataset <- electrode_spikes_per_burst(data = analysis_dataset, 0, 120, recording_identifier = "5_hippocampal_24h")

# mean burst ISI
analysis_dataset <- electrode_mean_burst_ISI(data = analysis_dataset, 10802.57616, 10922.57616, recording_identifier = "1_hippocampal_baseline")
analysis_dataset <- electrode_mean_burst_ISI(data = analysis_dataset, 11042.57616, 11162.57616, recording_identifier = "2_hippocampal_acute")
analysis_dataset <- electrode_mean_burst_ISI(data = analysis_dataset, 12722.5004, 12842.5004, recording_identifier = "3_hippocampal_30min")
analysis_dataset <- electrode_mean_burst_ISI(data = analysis_dataset, 14522.11672, 14642.11672, recording_identifier = "4_hippocampal_1h")
analysis_dataset <- electrode_mean_burst_ISI(data = analysis_dataset, 0, 120, recording_identifier = "5_hippocampal_24h")

# assign analysis_dataset to electrode_barchart_data
electrode_barchart_data <- analysis_dataset

# Process neural_metric data ###################################################################################

agonist_challenge_22DIV_25052023_0_120 <- create_synchrony_dataset(data_path = "neural_metric_files/SI_agonist_challenge/agonist_challenge_22DIV_25052023_neuralMetrics_0-120.csv",
                                                                   heatmap_condition = "Baseline")
agonist_challenge_22DIV_25052023_240_360 <- create_synchrony_dataset(data_path = "neural_metric_files/SI_agonist_challenge/agonist_challenge_22DIV_25052023_neuralMetrics_240-360.csv",
                                                                     heatmap_condition = "Acute Incubation")
agonist_challenge_22DIV_25052023_30min <- create_synchrony_dataset(data_path = "neural_metric_files/SI_agonist_challenge/agonist_challenge_22DIV_25052023_30min_neuralMetrics.csv",
                                                                   heatmap_condition = "30 min Incubation")
agonist_challenge_22DIV_25052023_1h <- create_synchrony_dataset(data_path = "neural_metric_files/SI_agonist_challenge/agonist_challenge_22DIV_25052023_1h_neuralMetrics.csv",
                                                                heatmap_condition = "1 hr Incubation")
agonist_challenge_23DIV_26052023_24h <- create_synchrony_dataset(data_path = "neural_metric_files/SI_agonist_challenge/agonist_challenge_23DIV_26052023_24h_neuralMetrics.csv",
                                                                 heatmap_condition = "24 hr Incubation")

# merge neuralMetric datasets

df_list <- list(agonist_challenge_22DIV_25052023_0_120, 
                agonist_challenge_22DIV_25052023_240_360,
                agonist_challenge_22DIV_25052023_30min,
                agonist_challenge_22DIV_25052023_1h,
                agonist_challenge_23DIV_26052023_24h)
heatmap_data <- df_list %>%
  reduce(full_join, by = 'Well')

# update well to show experimental condition
heatmap_data$Well <- str_replace_all(heatmap_data$Well,"A1","A1 100 nM Capsaicin")
heatmap_data$Well <- str_replace_all(heatmap_data$Well,"A2","A2 100 nM Capsaicin")
heatmap_data$Well <- str_replace_all(heatmap_data$Well,"A3","A3 1 µM AITC")
heatmap_data$Well <- str_replace_all(heatmap_data$Well,"A4","A4 1 µM AITC")
heatmap_data$Well <- str_replace_all(heatmap_data$Well,"A5","A5 1 mM KCl")
heatmap_data$Well <- str_replace_all(heatmap_data$Well,"A6","A6 1 mM KCl")





