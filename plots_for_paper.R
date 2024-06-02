
####################################################################################################################
# AGONIST CHALLENGE (see plate map for conditions)
####################################################################################################################

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

# Use MEAanalysis package to generate the well average for each parameter
# burst duration
analysis_dataset <- well_burst_duration(data = analysis_dataset, 10802.57616, 10922.57616, recording_identifier = "agonist_challenge_22DIV_25052023_acute")
analysis_dataset <- well_burst_duration(data = analysis_dataset, 11042.57616, 11162.57616, recording_identifier = "agonist_challenge_22DIV_25052023_acute")
analysis_dataset <- well_burst_duration(data = analysis_dataset, 12722.5004, 12842.5004, recording_identifier = "agonist_challenge_22DIV_25052023_30min")
analysis_dataset <- well_burst_duration(data = analysis_dataset, 14522.11672, 14642.11672, recording_identifier = "agonist_challenge_22DIV_25052023_1h")
analysis_dataset <- well_burst_duration(data = analysis_dataset, 0, 120, recording_identifier = "agonist_challenge_23DIV_25052023_24h")

# number of spikes per burst
analysis_dataset <- well_spikes_per_burst(data = analysis_dataset, 10802.57616, 10922.57616, recording_identifier = "agonist_challenge_22DIV_25052023_acute")
analysis_dataset <- well_spikes_per_burst(data = analysis_dataset, 11042.57616, 11162.57616, recording_identifier = "agonist_challenge_22DIV_25052023_acute")
analysis_dataset <- well_spikes_per_burst(data = analysis_dataset, 12722.5004, 12842.5004, recording_identifier = "agonist_challenge_22DIV_25052023_30min")
analysis_dataset <- well_spikes_per_burst(data = analysis_dataset, 14522.11672, 14642.11672, recording_identifier = "agonist_challenge_22DIV_25052023_1h")
analysis_dataset <- well_spikes_per_burst(data = analysis_dataset, 0, 120, recording_identifier = "agonist_challenge_23DIV_25052023_24h")

# mean burst ISI
analysis_dataset <- well_mean_burst_ISI(data = analysis_dataset, 10802.57616, 10922.57616, recording_identifier = "agonist_challenge_22DIV_25052023_acute")
analysis_dataset <- well_mean_burst_ISI(data = analysis_dataset, 11042.57616, 11162.57616, recording_identifier = "agonist_challenge_22DIV_25052023_acute")
analysis_dataset <- well_mean_burst_ISI(data = analysis_dataset, 12722.5004, 12842.5004, recording_identifier = "agonist_challenge_22DIV_25052023_30min")
analysis_dataset <- well_mean_burst_ISI(data = analysis_dataset, 14522.11672, 14642.11672, recording_identifier = "agonist_challenge_22DIV_25052023_1h")
analysis_dataset <- well_mean_burst_ISI(data = analysis_dataset, 0, 120, recording_identifier = "agonist_challenge_23DIV_25052023_24h")

# create single electrode bar chart
well_barchart(data = analysis_dataset, well_parameter = "burst_duration", well_filter = "A3", statistic = se)
well_barchart(data = analysis_dataset, well_parameter = "spikes_per_burst", well_filter = "A3", statistic = se)
well_barchart(data = analysis_dataset, well_parameter = "mean_burst_ISI", well_filter = "A3", statistic = se)

# Use MEAanalysis package to generate burst parameters for each electrode
# refresh analysis_dataset 
analysis_dataset <- output_table

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
single_electrode_barchart(data = analysis_dataset, electrode_parameter = "burst_duration", electrode_filter = "A3", statistic = se)
single_electrode_barchart(data = analysis_dataset, electrode_parameter = "spikes_per_burst", electrode_filter = "A3", statistic = se)
single_electrode_barchart(data = analysis_dataset, electrode_parameter = "mean_burst_ISI", electrode_filter = "A3", statistic = se)

# Use MEAanalysis package to create heatmap of synchrony index data

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

# update well to show experimental condition
heatmap_data$Well <- str_replace_all(heatmap_data$Well,"A1","A1 100 nM Capsaicin")
heatmap_data$Well <- str_replace_all(heatmap_data$Well,"A2","A2 100 nM Capsaicin")
heatmap_data$Well <- str_replace_all(heatmap_data$Well,"A3","A3 1 µM AITC")
heatmap_data$Well <- str_replace_all(heatmap_data$Well,"A4","A4 1 µM AITC")
heatmap_data$Well <- str_replace_all(heatmap_data$Well,"A5","A5 1 mM KCl")
heatmap_data$Well <- str_replace_all(heatmap_data$Well,"A6","A6 1 mM KCl")

# create synchrony heatmap
MEA_heatmap(data = heatmap_data, well_filter = "B1")


MEA_heatmap(data = heatmap_data, well_filter = "A1 100 nM Capsaicin|A2 100 nM Capsaicin|A3 1 µM AITC|A4 1 µM AITC|A5 1 mM KCl|A6 1 mM KCl")


