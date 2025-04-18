# load packages
library(MEAanalysis)
library(psych)

####################################################################################################################
# Script to calculate well ICC for baseline time period
####################################################################################################################

# load electrode burst csv files
baseline <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_22DIV_Agonists Challenge_25-04-2023(000)_electrode_burst_list.csv", 
                                     recording_identifier = "hippocampal_baseline")

# calculate burst parameters for single electrodes for baseline time period

data_1 <- baseline %>% electrode_number_of_bursts(10802.57616, 10922.57616, recording_identifier = "hippocampal_baseline")
data_1 <- data_1 %>% electrode_burst_duration(10802.57616, 10922.57616, recording_identifier = "hippocampal_baseline")
data_1 <- data_1 %>% electrode_spikes_per_burst(10802.57616, 10922.57616, recording_identifier = "hippocampal_baseline")
data_1 <- data_1 %>% electrode_mean_burst_ISI(10802.57616, 10922.57616, recording_identifier = "hippocampal_baseline")

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


####################################################################################################################
# Script to calculate well ICC for acute time period of KCl incubation
####################################################################################################################

# load electrode burst csv files
acute <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_22DIV_Agonists Challenge_25-04-2023(000)_electrode_burst_list.csv", 
                                     recording_identifier = "hippocampal_acute")

# calculate burst parameters for single electrodes (time period is first 2 minutes of acute recording)

data_1 <- acute %>% electrode_number_of_bursts(11042.57616, 11162.57616, recording_identifier = "hippocampal_acute")
data_1 <- data_1 %>% electrode_burst_duration(11042.57616, 11162.57616, recording_identifier = "hippocampal_acute")
data_1 <- data_1 %>% electrode_spikes_per_burst(11042.57616, 11162.57616, recording_identifier = "hippocampal_acute")
data_1 <- data_1 %>% electrode_mean_burst_ISI(11042.57616, 11162.57616, recording_identifier = "hippocampal_acute")

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





####################################################################################################################
# Script to calculate well ICC for 30 min time period of KCl incubation
####################################################################################################################

# load electrode burst csv files
hippocampal_30min <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_22DIV_Agonists Challenge_30min after_25-04-2023(000)_electrode_burst_list.csv", 
                                  recording_identifier = "hippocampal_30min")

# calculate burst parameters for single electrodes (time period is first 2 minutes of acute recording)

data_1 <- hippocampal_30min %>% electrode_number_of_bursts(12722.5004, 12842.5004, recording_identifier = "hippocampal_30min")
data_1 <- data_1 %>% electrode_burst_duration(12722.5004, 12842.5004, recording_identifier = "hippocampal_30min")
data_1 <- data_1 %>% electrode_spikes_per_burst(12722.5004, 12842.5004, recording_identifier = "hippocampal_30min")
data_1 <- data_1 %>% electrode_mean_burst_ISI(12722.5004, 12842.5004, recording_identifier = "hippocampal_30min")

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






####################################################################################################################
# Script to calculate well ICC for 1 hr time period of KCl incubation
####################################################################################################################

# load electrode burst csv files
hippocampal_1hr <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_22DIV_Agonists Challenge_1h after_25-04-2023(000)_electrode_burst_list.csv", 
                                              recording_identifier = "hippocampal_1hr")

# calculate burst parameters for single electrodes (time period is first 2 minutes of acute recording)

data_1 <- hippocampal_1hr %>% electrode_number_of_bursts(14522.11672, 14642.11672, recording_identifier = "hippocampal_1hr")
data_1 <- data_1 %>% electrode_burst_duration(14522.11672, 14642.11672, recording_identifier = "hippocampal_1hr")
data_1 <- data_1 %>% electrode_spikes_per_burst(14522.11672, 14642.11672, recording_identifier = "hippocampal_1hr")
data_1 <- data_1 %>% electrode_mean_burst_ISI(14522.11672, 14642.11672, recording_identifier = "hippocampal_1hr")

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





####################################################################################################################
# Script to calculate well ICC for 24 hr time period of KCl incubation
####################################################################################################################

# load electrode burst csv files
hippocampal_24hr <- create_electrode_dataset(data_path = "electrode_burst_files/WT hippocampal culture_23DIV_Agonists Challenge_24h after_26-04-2023(000)(000)_electrode_burst_list.csv", 
                                            recording_identifier = "hippocampal_24hr")

# calculate burst parameters for single electrodes (time period is first 2 minutes of acute recording)

data_1 <- hippocampal_24hr %>% electrode_number_of_bursts(0, 120,  recording_identifier = "hippocampal_24hr")
data_1 <- data_1 %>% electrode_burst_duration(0, 120, recording_identifier = "hippocampal_24hr")
data_1 <- data_1 %>% electrode_spikes_per_burst(0, 120, recording_identifier = "hippocampal_24hr")
data_1 <- data_1 %>% electrode_mean_burst_ISI(0, 120, recording_identifier = "hippocampal_24hr")

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


