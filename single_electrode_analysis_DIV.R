
####################################################################################################################
# R script to perform single electrode analysis of hippocampal neuronal cultures
# DIV SPONTANOEUS ACTIVITY (see plate map for conditions)
####################################################################################################################

# load MEA analysis package
library(MEAanalysis)

# load electrode burst csv files
baseline_8DIV_11042023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_8DIV_11-04-2023(000)(000)_electrode_burst_list.csv",
                                                    recording_identifier = "baseline_8DIV_11042023")
baseline_9DIV_12042023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_9DIV_12-04-2023(000)(000)_electrode_burst_list.csv",
                                                   recording_identifier = "baseline_9DIV_12042023")
baseline_10DIV_13042023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_10DIV_13-04-2023(000)(000)_electrode_burst_list.csv",
                                                   recording_identifier = "baseline_10DIV_13042023")
baseline_11DIV_14042023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_11DIV_14-04-2023(000)(000)_electrode_burst_list.csv",
                                                   recording_identifier = "baseline_11DIV_14042023")
baseline_12DIV_15042023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_12DIV_15-04-2023(000)_electrode_burst_list.csv",
                                                   recording_identifier = "baseline_12DIV_15042023")
baseline_13DIV_16042023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_13DIV_16-04-2023(000)_electrode_burst_list.csv",
                                                   recording_identifier = "baseline_13DIV_16042023")
baseline_14DIV_17042023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_14DIV_17-04-2023(000)_electrode_burst_list.csv",
                                                   recording_identifier = "baseline_14DIV_17042023")
baseline_15DIV_18042023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_15DIV_18-04-2023(000)_electrode_burst_list.csv",
                                                   recording_identifier = "baseline_15DIV_18042023")
baseline_16DIV_19042023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_16DIV_19-04-2023(000)_electrode_burst_list.csv",
                                                   recording_identifier = "baseline_16DIV_19042023")
baseline_17DIV_20042023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_17DIV_20-04-2023(000)_electrode_burst_list.csv",
                                                   recording_identifier = "baseline_17DIV_20042023")
baseline_18DIV_21042023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_18DIV_21-04-2023(000)_electrode_burst_list.csv",
                                                   recording_identifier = "baseline_18DIV_21042023")
baseline_21DIV_24042023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_21DIV_24-04-2023(000)_electrode_burst_list.csv",
                                                   recording_identifier = "baseline_21DIV_24042023")
baseline_22DIV_25042023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_22DIV_25-04-2023(000)_electrode_burst_list.csv",
                                                   recording_identifier = "baseline_22DIV_25042023")
baseline_31DIV_04052023 <- create_electrode_dataset(data_path = "electrode_burst_files/Baseline_WT hippocampal culture_31DIV_04-05-2023(000)(000)_electrode_burst_list.csv",
                                                   recording_identifier = "baseline_31DIV_04052023")


# merge electrode burst datasets
output_table <- rbind(baseline_8DIV_11042023, 
                      baseline_9DIV_12042023,
                      baseline_10DIV_13042023,
                      baseline_11DIV_14042023,
                      baseline_12DIV_15042023,
                      baseline_13DIV_16042023,
                      baseline_14DIV_17042023,
                      baseline_15DIV_18042023,
                      baseline_16DIV_19042023,
                      baseline_17DIV_20042023,
                      baseline_18DIV_21042023,
                      baseline_21DIV_24042023,
                      baseline_22DIV_25042023,
                      baseline_31DIV_04052023)


# assign output_table to analysis_dataset
analysis_dataset <- output_table

# calculate burst parameters
# note time intervals updates based on start of electrode_burst_recording
# number of bursts
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 0, 120, recording_identifier = "baseline_8DIV_11042023")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 0, 120, recording_identifier = "baseline_9DIV_12042023")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 0, 120, recording_identifier = "baseline_10DIV_13042023")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 0, 120, recording_identifier = "baseline_11DIV_14042023")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 120, 240, recording_identifier = "baseline_12DIV_15042023")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 120, 240, recording_identifier = "baseline_13DIV_16042023")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 120, 240, recording_identifier = "baseline_14DIV_17042023")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 120, 240, recording_identifier = "baseline_15DIV_18042023")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 120, 240, recording_identifier = "baseline_16DIV_19042023")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 120, 240, recording_identifier = "baseline_17DIV_20042023")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 120, 240, recording_identifier = "baseline_18DIV_21042023")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 120, 240, recording_identifier = "baseline_21DIV_24042023")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 120, 240, recording_identifier = "baseline_22DIV_25042023")
analysis_dataset <- electrode_number_of_bursts(data = analysis_dataset, 0, 120, recording_identifier = "baseline_31DIV_04052023")


# create single electrode bar chart
single_electrode_barchart(data = analysis_dataset, electrode_parameter = "number_of_bursts", electrode_filter = "A1_1|A1_2", statistic = se)
single_electrode_barchart(data = analysis_dataset, electrode_parameter = "burst_duration", electrode_filter = "A1_1|A1_2", statistic = se)
single_electrode_barchart(data = analysis_dataset, electrode_parameter = "spikes_per_burst", electrode_filter = "A1_1|A1_2", statistic = se)
single_electrode_barchart(data = analysis_dataset, electrode_parameter = "mean_burst_ISI", electrode_filter = "A1_1|A1_2", statistic = se)



