# load packages
library(MEAanalysis)

# data processing
source("hippocampal_data_processing.R")

####################################################################################################################
# Single electrode analysis of well A6
# Hippocampal neuronal cultures
# Agonist challenge: 1 mM KCl
# 45K cells seeded per well
####################################################################################################################

p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "number_of_bursts", electrode_filter = "A6") +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "burst_duration", electrode_filter = "A6", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank()) 
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "spikes_per_burst", electrode_filter = "A6", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "mean_burst_ISI", electrode_filter = "A6", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)

####################################################################################################################
# Single electrode analysis of well C6
# Hippocampal neuronal cultures
# Agonist challenge: 50 mM KCl
# 130K cells seeded per well
####################################################################################################################

p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "number_of_bursts", electrode_filter = "C6") +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "burst_duration", electrode_filter = "C6", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank()) 
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "spikes_per_burst", electrode_filter = "C6", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "mean_burst_ISI", electrode_filter = "C6", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)

####################################################################################################################
# Single electrode analysis of well A5
# Hippocampal neuronal cultures
# Agonist challenge: 1 mM KCl
# 45K cells seeded per well
####################################################################################################################

p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "number_of_bursts", electrode_filter = "A5") +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "burst_duration", electrode_filter = "A5", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank()) 
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "spikes_per_burst", electrode_filter = "A5", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "mean_burst_ISI", electrode_filter = "A5", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)

####################################################################################################################
# Single electrode analysis of well B5
# Hippocampal neuronal cultures
# Agonist challenge: 10 mM KCl
# 90K cells seeded per well
####################################################################################################################

p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "number_of_bursts", electrode_filter = "B5") +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "burst_duration", electrode_filter = "B5", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank()) 
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "spikes_per_burst", electrode_filter = "B5", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "mean_burst_ISI", electrode_filter = "B5", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)

####################################################################################################################
# Single electrode analysis of well C5
# Hippocampal neuronal cultures
# Agonist challenge: 50 mM KCl
# 130K cells seeded per well
####################################################################################################################

p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "number_of_bursts", electrode_filter = "C5") +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "burst_duration", electrode_filter = "C5", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank()) 
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "spikes_per_burst", electrode_filter = "C5", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)
p <- single_electrode_barchart(data = electrode_barchart_data, electrode_parameter = "mean_burst_ISI", electrode_filter = "C5", statistic = se) +
  scale_fill_discrete(name = "Agonist Challenge", labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
  theme(legend.position="none") +
  theme(axis.title.x=element_blank(),
        axis.title.y = element_blank())
print(p)

