#!/usr/bin/R

### Decides on Lymphocyte-sequencing panel  
################
### OPTPARSE ###
################
library(optparse)

bcr_rmarkdown = '/home/ionadmin/watchdog/LymphocyteSeq_report/BCR_report.Rmd'
tcr_rmarkdown = '/home/ionadmin/watchdog/LymphocyteSeq_report/TCR_report.Rmd'

option_list = list(
  make_option(c("-d", "--dir"), type="character", default=NULL,
              help="directory containing clone summaries", metavar="character"))

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser)

## 
panel_df = panel_dataframe(opt$dir)
if(panel_decision(panel_df) == 'BCR'){
  panel_specific_rmarkdown == bcr_rmarkdown
}else if(panel_decision(panel_df) == 'TCR'){
  panel_specific_rmarkdown == tcr_rmarkdown
  
  
}
rmarkdown::render(panel_specific_rmarkdown,
params = list(filedir =  opt$dir,
output_file = filename,
sample_ID = sampleID),
output_file = filename)
