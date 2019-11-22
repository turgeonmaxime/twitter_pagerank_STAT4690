library(readr)
library(tidyverse)

set.seed(4690)

# Import data
node_data <- read_csv("twitter_combined.txt-nodes.csv")
edge_data <- read_csv("twitter_combined.txt-edges.csv")

# Randomly select 10,000 nodes
node_sub <- node_data %>% 
  sample_n(10000) %>% 
  pull()

# Only keep the edges that connect two nodes in the subset
edge_sub <- edge_data %>% 
  filter(Node_Id_1 %in% node_sub,
         Node_Id_2 %in% node_sub) %>% 
  mutate(Node_Id_1 = as.character(Node_Id_1),
         Node_Id_2 = as.character(Node_Id_2))

# Save results
write_csv(edge_sub, "edge_list_subset.csv")
