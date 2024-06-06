
####################################################################################################################
# R script to perform single electrode analysis of hippocampal neuronal cultures
# AGONIST CHALLENGE 
####################################################################################################################

# load packages
library(MEAanalysis)

# data processing
source("hippocampal_data_processing.R")

# create well bar chart
p <- well_barchart(data = well_barchart_data, well_parameter = "number_of_bursts", well_filter = "A3", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation"))
print(p)
p <- well_barchart(data = well_barchart_data, well_parameter = "burst_duration", well_filter = "A3", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation"))
print(p)
p <- well_barchart(data = well_barchart_data, well_parameter = "spikes_per_burst", well_filter = "A3", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation"))
print(p)
p <- well_barchart(data = well_barchart_data, well_parameter = "mean_burst_ISI", well_filter = "A3", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation"))
print(p)

# create single electrode bar chart
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "number_of_bursts", electrode_filter = "A3") +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation"))
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "burst_duration", electrode_filter = "A3", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation"))
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "spikes_per_burst", electrode_filter = "A3", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation"))
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "mean_burst_ISI", electrode_filter = "A3", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation"))
print(p)

# create synchrony heatmap
p <- MEA_heatmap(data = heatmap_data, well_filter = "A1|A2|A3|A4|A5|A6")
print(p)



