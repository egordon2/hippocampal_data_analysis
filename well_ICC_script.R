# load packages
library(MEAanalysis)
library(psych)

####################################################################################################################
# Script to calculate well ICC for baseline time period
####################################################################################################################

# load electrode burst csv files
baseline <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_22DIV_Agonists Challenge_25-04-2023(000)_electrode_burst_list.csv", 
                                     recording_identifier = "hippocampal_baseline")

# calculate burst parameters for single electrodes (time period is whole 10 minutes of baseline recording)

data_1 <- baseline %>% electrode_number_of_bursts(recording_identifier = "hippocampal_baseline")
data_1 <- data_1 %>% electrode_burst_duration(recording_identifier = "hippocampal_baseline")
data_1 <- data_1 %>% electrode_spikes_per_burst(recording_identifier = "hippocampal_baseline")
data_1 <- data_1 %>% electrode_mean_burst_ISI(recording_identifier = "hippocampal_baseline")

# select columns containing burst parameter mean for each electrode and remove non-distinct rows

data_2 <- select(data_1, "Electrode"|contains("electrode_number_of_bursts")|contains("electrode_duration_mean")|contains("electrode_spikes_mean")|contains("electrode_avg_mean_burst_ISI")) %>% 
  distinct()

# create list of all possible electrodes

well_row <- LETTERS[1:4]
well_column <- as.character(1:6)
wells <- as.vector(outer(well_row, well_column, paste0))
electrode_number <- c("_11", "_12", "_13", "_14", "_21", "_22", "_23", "_24", "_31", "_32", "_33", "_34", "_41", "_42", "_43", "_44")

electrode_list <- data.table(as.vector(outer(wells, electrode_number, paste0)))
colnames(electrode_list)[1] <- "Electrode"

# merge list of electrodes to data_2 to input missing values to zero for number of bursts

data_3 <- merge(electrode_list, data_2, by = c("Electrode"), all.x = TRUE)
data_3[[2]][is.na(data_3[[2]])] <- 0
data_4 <- data_3[, well := str_sub(Electrode, start = 1L, end = 2L)]


# create data frames for each burst parameter where have the results for each single electrode grouped by well

icc_number_of_bursts <- data_4 %>% 
                        select("well"|contains("electrode_number_of_bursts"))
colnames(icc_number_of_bursts)[2] <- "electrode_number_of_bursts"
icc_number_of_bursts <- icc_number_of_bursts %>% 
  group_by(well) %>% 
  mutate(row = row_number()) %>%
  pivot_wider(names_from = well, values_from = electrode_number_of_bursts) %>%
  select(-row)
icc_number_of_bursts = t(icc_number_of_bursts)

icc_duration <- data_4 %>% 
  select("well"|contains("electrode_duration_mean"))
colnames(icc_duration)[2] <- "electrode_duration_mean"
icc_duration <- icc_duration %>% 
  group_by(well) %>% 
  mutate(row = row_number()) %>%
  pivot_wider(names_from = well, values_from = electrode_duration_mean) %>%
  select(-row)
icc_duration = t(icc_duration)

icc_spikes <- data_4 %>% 
  select("well"|contains("electrode_spikes_mean"))
colnames(icc_spikes)[2] <- "electrode_spikes_mean"
icc_spikes <- icc_spikes %>% 
  group_by(well) %>% 
  mutate(row = row_number()) %>%
  pivot_wider(names_from = well, values_from = electrode_spikes_mean) %>%
  select(-row)
icc_spikes = t(icc_spikes)

icc_mean_burst_ISI <- data_4 %>% 
  select("well"|contains("electrode_avg_mean_burst_ISI"))
colnames(icc_mean_burst_ISI)[2] <- "electrode_avg_mean_burst_ISI"
icc_mean_burst_ISI <- icc_mean_burst_ISI %>% 
  group_by(well) %>% 
  mutate(row = row_number()) %>%
  pivot_wider(names_from = well, values_from = electrode_avg_mean_burst_ISI) %>%
  select(-row)
icc_mean_burst_ISI = t(icc_mean_burst_ISI)

# calculate intracorrelation coefficient for each well (two-way random effects modelling, ICC2k)

icc_number_of_bursts_result <- ICC(icc_number_of_bursts)
print(icc_number_of_bursts_result)       

icc_duration_result <- ICC(icc_duration)
print(icc_duration_result)  

icc_spikes_result <- ICC(icc_spikes)
print(icc_spikes_result)  

icc_mean_burst_ISI_result <- ICC(icc_mean_burst_ISI)
print(icc_mean_burst_ISI_result)  


