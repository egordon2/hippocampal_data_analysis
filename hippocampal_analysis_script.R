
####################################################################################################################
# R script to perform single electrode analysis of hippocampal neuronal cultures
# AGONIST CHALLENGE: 10 mM KCl
# 90K cells seeded per well
####################################################################################################################

# load packages
library(MEAanalysis)

# data processing
source("hippocampal_data_processing.R")

####################################################
######## create well bar charts for well B6 ########
####################################################

# Define the list of well parameters to iterate over
parameters <- c("number_of_bursts", "burst_duration", "spikes_per_burst", "mean_burst_ISI")

# Loop through each parameter and filter combination
for (param in parameters) {
    p <- well_barchart(data = well_barchart_data, 
                                   well_parameter = param, 
                                   well_filter = "B6") +
      scale_fill_discrete(name = "Agonist Challenge", 
                          labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
      theme(legend.position="none") +
      theme(axis.title.x = element_blank(),
            axis.title.y = element_blank())
    
    print(p)  # Display the plot
}

####################################################
## create single electrode bar charts for well B6 ##
####################################################

# Define the list of well parameters to iterate over
parameters <- c("number_of_bursts", "burst_duration", "spikes_per_burst", "mean_burst_ISI")

# Loop through each parameter and filter combination
for (param in parameters) {
  p <- single_electrode_barchart(data = electrode_barchart_data, 
                                 electrode_parameter = param, 
                                 electrode_filter = "B6") +
    scale_fill_discrete(name = "Agonist Challenge", 
                        labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
    theme(legend.position="none") +
    theme(axis.title.x = element_blank(),
          axis.title.y = element_blank())
  
  print(p)  # Display the plot
}


####################################################
############ create synchrony heatmap ##############
####################################################
p <- MEA_heatmap(data = heatmap_data) 
print(p)



