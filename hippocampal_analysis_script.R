
####################################################################################################################
# R script to perform single electrode analysis of hippocampal neuronal cultures
# AGONIST CHALLENGE 
####################################################################################################################

# load packages
library(MEAanalysis)

# data processing
source("hippocampal_data_processing.R")

# create well bar chart
p <- well_barchart(data = well_barchart_data, well_parameter = "number_of_bursts", well_filter = "B6", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)
p <- well_barchart(data = well_barchart_data, well_parameter = "burst_duration", well_filter = "B6", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)
p <- well_barchart(data = well_barchart_data, well_parameter = "spikes_per_burst", well_filter = "B6", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)
p <- well_barchart(data = well_barchart_data, well_parameter = "mean_burst_ISI", well_filter = "B6", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)

# create single electrode bar chart
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "number_of_bursts", electrode_filter = "B6") +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "burst_duration", electrode_filter = "B6", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank()) 
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "spikes_per_burst", electrode_filter = "B6", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "mean_burst_ISI", electrode_filter = "B6", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)

# create synchrony heatmap
p <- MEA_heatmap(data = heatmap_data) 
print(p)



