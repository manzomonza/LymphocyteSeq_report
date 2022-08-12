#!/usr/bin/R

### Renders TCR_Pan_Clonality.Rmd with specified filedir
################
### OPTPARSE ###
################
library(optparse)

option_list = list(
  make_option(c("-d", "--dir"), type="character", default=NULL,
              help="directory with clone summaries", metavar="character"),
  make_option(c("-f", "--file"), type="character", default=NULL,
              help="filename of clone summary", metavar="character"))

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser)

filename <- gsub(".clone_summary.csv",'', opt$file)
sampleID = filename
sampleID = rev(unlist(stringr::str_split(sampleID, pattern = '/', simplify = FALSE)))[1]
date_string = gsub("-",'',Sys.Date())
filename <- paste0(filename, date_string, "_Pan_TCR_report.html")




rmarkdown::render('TCR_Pan_Clonality.Rmd',
params = list(filedir =  opt$dir,
output_file = filename,
sample_ID = sampleID),
output_file = filename)