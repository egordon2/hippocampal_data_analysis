
####################################################################################################################
# R script to perform single electrode analysis of hippocampal neuronal cultures
# BLOCKER CHALLENGE (see plate map for conditions)
####################################################################################################################

# load MEA analysis package
library(MEAanalysis)

# load electrode burst csv files
baseline_31DIV_04052023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_31DIV_04-05-2023(000)(000)_electrode_burst_list.csv",
                                                    recording_identifier = "baseline_31DIV_04052023")
blocker_challenge_31DIV_04052023_acute <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_31DIV_04-05-2023_BlockersChallenge(000)_electrode_burst_list.csv",
                                                                   recording_identifier = "blocker_challenge_31DIV_04052023_acute")
blocker_challenge_31DIV_04052023_30min <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_31DIV_04-05-2023_BlockersChallenge-30min(000)_electrode_burst_list.csv",
                                                                   recording_identifier = "blocker_challenge_31DIV_04052023_30min")
blocker_challenge_31DIV_04052023_1h <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_31DIV_04-05-2023_BlockersChallenge-1h(000)_electrode_burst_list.csv",
                                                                recording_identifier = "blocker_challenge_31DIV_04052023_1h")
blocker_challenge_32DIV_04052023_24h <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_32DIV_05-05-2023_BlockersChallenge-24h(000)_electrode_burst_list.csv",
                                                                 recording_identifier = "blocker_challenge_32DIV_04052023_24h")


# merge electrode burst datasets
output_table <- rbind(baseline_31DIV_04052023, 
                      blocker_challenge_31DIV_04052023_acute,
                      blocker_challenge_31DIV_04052023_30min,
                      blocker_challenge_31DIV_04052023_1h,
                      blocker_challenge_32DIV_04052023_24h)

# assign output_table to analysis_dataset
analysis_dataset <- output_table

# calculate burst parameters
# note time intervals updates based on start of electrode_burst_recording
# number of bursts
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 4634.327, 4754.327, recording_identifier = "blocker_challenge_31DIV_04052023_acute")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 4874.327, 4994.327, recording_identifier = "blocker_challenge_31DIV_04052023_acute")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 6602.703, 6722.703, recording_identifier = "blocker_challenge_31DIV_04052023_30min")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 8403.371, 8523.371, recording_identifier = "blocker_challenge_31DIV_04052023_1h")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 122.3172, 242.3172, recording_identifier = "blocker_challenge_32DIV_04052023_24h")

# burst duration
analysis_dataset <- electrode_burst_duration(data = analysis_dataset, 4634.327, 4754.327, recording_identifier = "blocker_challenge_31DIV_04052023_acute")
analysis_dataset <- electrode_burst_duration(data = analysis_dataset, 4874.327, 4994.327, recording_identifier = "blocker_challenge_31DIV_04052023_acute")
analysis_dataset <- electrode_burst_duration(data = analysis_dataset, 6602.703, 6722.703, recording_identifier = "blocker_challenge_31DIV_04052023_30min")
analysis_dataset <- electrode_burst_duration(data = analysis_dataset, 8403.371, 8523.371, recording_identifier = "blocker_challenge_31DIV_04052023_1h")
analysis_dataset <- electrode_burst_duration(data = analysis_dataset, 122.3172, 242.3172, recording_identifier = "blocker_challenge_32DIV_04052023_24h")

# number of spikes per burst
analysis_dataset <- electrode_spikes_per_burst(data = analysis_dataset, 4634.327, 4754.327, recording_identifier = "blocker_challenge_31DIV_04052023_acute")
analysis_dataset <- electrode_spikes_per_burst(data = analysis_dataset, 4874.327, 4994.327, recording_identifier = "blocker_challenge_31DIV_04052023_acute")
analysis_dataset <- electrode_spikes_per_burst(data = analysis_dataset, 6602.703, 6722.703, recording_identifier = "blocker_challenge_31DIV_04052023_30min")
analysis_dataset <- electrode_spikes_per_burst(data = analysis_dataset, 8403.371, 8523.371, recording_identifier = "blocker_challenge_31DIV_04052023_1h")
analysis_dataset <- electrode_spikes_per_burst(data = analysis_dataset, 122.3172, 242.3172, recording_identifier = "blocker_challenge_32DIV_04052023_24h")

# mean burst ISI
analysis_dataset <- electrode_mean_burst_ISI(data = analysis_dataset, 4634.327, 4754.327, recording_identifier = "blocker_challenge_31DIV_04052023_acute")
analysis_dataset <- electrode_mean_burst_ISI(data = analysis_dataset, 4874.327, 4994.327, recording_identifier = "blocker_challenge_31DIV_04052023_acute")
analysis_dataset <- electrode_mean_burst_ISI(data = analysis_dataset, 6602.703, 6722.703, recording_identifier = "blocker_challenge_31DIV_04052023_30min")
analysis_dataset <- electrode_mean_burst_ISI(data = analysis_dataset, 8403.371, 8523.371, recording_identifier = "blocker_challenge_31DIV_04052023_1h")
analysis_dataset <- electrode_mean_burst_ISI(data = analysis_dataset, 122.3172, 242.3172, recording_identifier = "blocker_challenge_32DIV_04052023_24h")

# create single electrode bar chart
single_electrode_barchart(data = analysis_dataset, electrode_parameter = "number_of_bursts", electrode_filter = "A1_1|A1_2", statistic = se)
single_electrode_barchart(data = analysis_dataset, electrode_parameter = "burst_duration", electrode_filter = "A1_1|A1_2", statistic = se)
single_electrode_barchart(data = analysis_dataset, electrode_parameter = "spikes_per_burst", electrode_filter = "A1_1|A1_2", statistic = se)
single_electrode_barchart(data = analysis_dataset, electrode_parameter = "mean_burst_ISI", electrode_filter = "A1_1|A1_2", statistic = se)














