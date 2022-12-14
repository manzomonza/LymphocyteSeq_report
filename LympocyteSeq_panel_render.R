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
## List clone summaries
clonesummaries = only_clonesummaries(opt$dir)

panel_df = panel_dataframe(clonesummaries)
panel_df = lapply(panel_df, check_panel_dataframe)

for(e in panel_df){
  if(!is.null(e)){
    if(panel_decision(e) == 'BCR'){
      panel_specific_rmarkdown = bcr_rmarkdown
      print(panel_specific_rmarkdown)
    }else if(panel_decision(e) == 'TCR'){
      panel_specific_rmarkdown = tcr_rmarkdown
      print(panel_specific_rmarkdown)
    }else{
      return("unsupported panel")
    }
    rmarkdown::render(panel_specific_rmarkdown,
                      params = list(files = e$filepath,
                                    panel = e$panel,
                                    sample_ID = filename_extract(e$filepath[1], e$filepath[2]),
                                    output_file = paste0(opt$dir,"/", sample_ID, '.html'))) 
  }
}
