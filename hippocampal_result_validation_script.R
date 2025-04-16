
####################################################################################################################
# R script to compare outputs between MEAanalysis results and Axis Navigator
####################################################################################################################

#############################
# MEAanalysis
#############################

library(MEAanalysis)

# load electrode burst csv file using MEAanalysis create_electrode_dataset function
baseline_22DIV_25042023 <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_22DIV_Agonists Challenge_25-04-2023(000)_electrode_burst_list.csv", 
                                                    recording_identifier = "1_hippocampal_baseline")


# calculate electrode parameters using MEAanalysis functions (whole recording, no filter for time window)
data <- electrode_number_of_bursts(data = baseline_22DIV_25042023, recording_identifier = "1_hippocampal_baseline")
data <- electrode_burst_duration(data = data, recording_identifier = "1_hippocampal_baseline")
data <- electrode_spikes_per_burst(data = data, recording_identifier = "1_hippocampal_baseline")
data <- electrode_mean_burst_ISI(data = data, recording_identifier = "1_hippocampal_baseline")

electrode_data <- data

# Filter data for well B6 and select columns of interest

electrode_data_2 <- electrode_data %>%
  select(-c(Time_s, Duration_s, Size_spikes, Recording_identifier)) %>%
  distinct() %>%
  filter(., str_detect(Electrode, "B6")) %>% 
  select("Electrode"|contains("electrode_number_of_bursts")|
           contains("electrode_duration_mean")|contains("electrode_spikes_mean")|
           contains("electrode_avg_mean_burst_ISI")) %>% 
  distinct()

