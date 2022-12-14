#!/usr/bin/R

### Decides on Lymphocyte-sequencing panel  
################
### OPTPARSE ###
################
library(optparse)

option_list = list(
  make_option(c("-d", "--dir"), type="character", default=NULL,
              help="directory containing clone summaries", metavar="character"))

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser)

## 
panel_df = panel_dataframe(opt$dir)
if(panel_decision(panel_df)
rmarkdown::render('/home/ionadmin/watchdog/TCR_PanClonality/TCR_Pan_Clonality.Rmd',
params = list(filedir =  opt$dir,
output_file = filename,
sample_ID = sampleID),
output_file = filename)
