library(tidyverse)
library(TCGA2STAT)

# Cancer types for which to download data from TCGA (as in Kim et al.)
cancers <- c('BLCA', 'BRCA', 'CESC', 'CHOL', 'COAD', 'ESCA', 'GBM', 'HNSC', 
             'KICH', 'KIRC', 'KIRP', 'LIHC', 'LUAD', 'LUSC', 'PAAD', 'PCPG',
             'PRAD', 'READ', 'SARC', 'SKCM', 'STAD')

# Download and save the relevant data
for (cancer in cancers) {
  data <- getTCGA(disease = cancer, data.type = "RNASeq2")
  file_name <- str_glue('data/raw/{cancer}.tsv')
  formatted_data <- as_tibble(data$dat, rownames = 'gene')
  write_tsv(formatted_data, file_name)
}
