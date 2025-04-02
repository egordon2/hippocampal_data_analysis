# load packages
library(MEAanalysis)

# data processing
source("hippocampal_data_processing.R")

####################################################################################################################
# Single electrode analysis - Hippocampal Neuronal Cultures
# well A6: 1 mM KCl agonist challenge, 45k cells seeded per well
# well C6: 50 mM KCl agonist challenge, 130k cells seeded per well
# well A5: 1 mM KCl agonist challenge, 45k cells seeded per well
# well B5: 10 mM KCl agonist challenge, 90k cells seeded per well
# well C5: 50 mM KCl agonist challenge, 130k cells seeded per well
####################################################################################################################


# Define the list of electrode parameters and filters to iterate over
parameters <- c("number_of_bursts", "burst_duration", "spikes_per_burst", "mean_burst_ISI")
electrode_filters <- c("A6", "C6", "A5", "B5", "C5")

# Loop through each parameter and filter combination
for (param in parameters) {
  for (filter in electrode_filters) {
    p <- single_electrode_barchart(data = electrode_barchart_data, 
                                   electrode_parameter = param, 
                                   electrode_filter = filter) +
      scale_fill_discrete(name = "Agonist Challenge", 
                          labels = c("Baseline", "Acute Incubation", "30 min Incubation", "1 hr Incubation", "24 hr Incubation")) +
      theme(legend.position="none") +
      theme(axis.title.x = element_blank(),
            axis.title.y = element_blank())
    
    print(p)  # Display the plot
  }
}

