#!/usr/bin/R

### Decides on Lymphocyte-sequencing panel  
################
### OPTPARSE ###
################
library(optparse)

option_list = list(
  make_option(c("-f", "--file"), type="character", default=NULL,
              help="filename of clone summary", metavar="character"))

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser)

## 



## 
rmarkdown::render('/home/ionadmin/watchdog/TCR_PanClonality/TCR_Pan_Clonality.Rmd',
params = list(filedir =  opt$dir,
output_file = filename,
sample_ID = sampleID),
output_file = filename)
