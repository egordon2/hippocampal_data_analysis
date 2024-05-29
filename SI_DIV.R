
####################################################################################################################
# R script to produce heatmap of hippocampal neuronal cultures synchrony index
# DIV SPONTENOUS ACTIVITY (see plate map for conditions)
####################################################################################################################

# load MEA analysis package
library(MEAanalysis)

# load neuralMetric csv files

baseline_8DIV_11042023_neuralMetrics <- create_synchrony_dataset(data_path = "neural_metric_files/SI_DIV/baseline_8DIV_11042023_neuralMetrics.csv",
                                                                   heatmap_condition = "8 Days In Vitro")
baseline_9DIV_12042023_neuralMetrics <- create_synchrony_dataset(data_path = "neural_metric_files/SI_DIV/baseline_9DIV_12042023_neuralMetrics.csv",
                                                                 heatmap_condition = "9 Days In Vitro")
baseline_10DIV_13042023_neuralMetrics <- create_synchrony_dataset(data_path = "neural_metric_files/SI_DIV/baseline_10DIV_13042023_neuralMetrics.csv",
                                                                 heatmap_condition = "10 Days In Vitro")
baseline_11DIV_14042023_neuralMetrics <- create_synchrony_dataset(data_path = "neural_metric_files/SI_DIV/baseline_11DIV_14042023_neuralMetrics.csv",
                                                                 heatmap_condition = "11 Days In Vitro")
baseline_12DIV_15042023_neuralMetrics <- create_synchrony_dataset(data_path = "neural_metric_files/SI_DIV/baseline_12DIV_15042023_neuralMetrics.csv",
                                                                 heatmap_condition = "12 Days In Vitro")
baseline_13DIV_16042023_neuralMetrics <- create_synchrony_dataset(data_path = "neural_metric_files/SI_DIV/baseline_13DIV_16042023_neuralMetrics.csv",
                                                                 heatmap_condition = "13 Days In Vitro")
baseline_14DIV_17042023_neuralMetrics <- create_synchrony_dataset(data_path = "neural_metric_files/SI_DIV/baseline_14DIV_17042023_neuralMetrics.csv",
                                                                 heatmap_condition = "14 Days In Vitro")
baseline_15DIV_18042023_neuralMetrics <- create_synchrony_dataset(data_path = "neural_metric_files/SI_DIV/baseline_15DIV_18042023_neuralMetrics.csv",
                                                                 heatmap_condition = "15 Days In Vitro")
baseline_16DIV_19042023_neuralMetrics <- create_synchrony_dataset(data_path = "neural_metric_files/SI_DIV/baseline_16DIV_19042023_neuralMetrics.csv",
                                                                 heatmap_condition = "16 Days In Vitro")
baseline_17DIV_20042023_neuralMetrics <- create_synchrony_dataset(data_path = "neural_metric_files/SI_DIV/baseline_17DIV_20042023_neuralMetrics.csv",
                                                                 heatmap_condition = "17 Days In Vitro")
baseline_18DIV_21042023_neuralMetrics <- create_synchrony_dataset(data_path = "neural_metric_files/SI_DIV/baseline_18DIV_21042023_neuralMetrics.csv",
                                                                 heatmap_condition = "18 Days In Vitro")
baseline_21DIV_24042023_neuralMetrics <- create_synchrony_dataset(data_path = "neural_metric_files/SI_DIV/baseline_21DIV_24042023_neuralMetrics.csv",
                                                                 heatmap_condition = "21 Days In Vitro")
baseline_22DIV_25042023_neuralMetrics <- create_synchrony_dataset(data_path = "neural_metric_files/SI_DIV/baseline_22DIV_25042023_neuralMetrics.csv",
                                                                 heatmap_condition = "22 Days In Vitro")
baseline_31DIV_04052023_neuralMetrics <- create_synchrony_dataset(data_path = "neural_metric_files/SI_DIV/baseline_31DIV_04052023_neuralMetrics.csv",
                                                                 heatmap_condition = "31 Days In Vitro")


# merge neuralMetric datasets

df_list <- list(baseline_8DIV_11042023_neuralMetrics,
                baseline_9DIV_12042023_neuralMetrics,
                baseline_10DIV_13042023_neuralMetrics,
                baseline_11DIV_14042023_neuralMetrics,
                baseline_12DIV_15042023_neuralMetrics,
                baseline_13DIV_16042023_neuralMetrics,
                baseline_14DIV_17042023_neuralMetrics,
                baseline_15DIV_18042023_neuralMetrics,
                baseline_16DIV_19042023_neuralMetrics,
                baseline_17DIV_20042023_neuralMetrics,
                baseline_18DIV_21042023_neuralMetrics,
                baseline_21DIV_24042023_neuralMetrics,
                baseline_22DIV_25042023_neuralMetrics,
                baseline_31DIV_04052023_neuralMetrics)
heatmap_data <- df_list %>%
  reduce(full_join, by = 'Well')

# create synchrony heatmap

MEA_heatmap(data = heatmap_data, well_filter = "A1|A2|A3|A4|A5|A6|B1|B2|B3|B4|B5|B6|C1|C2|C3|C4|C5|C6|D1|D2|D3|D4|D5|D6")



