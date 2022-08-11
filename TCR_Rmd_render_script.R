#!/usr/bin/R

### Renders TCR_Pan_Clonality.Rmd with specified filedir

################
### OPTPARSE ###
################
library(optparse)

option_list = list(
  make_option(c("-d", "--dir"), type="character", default=NULL,
              help="directory with clone summaries", metavar="character"))

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser)

rmarkdown::render('/home/ionadmin/ngs_variant_annotation/variantAnnotation/scripts/TCR_Pan_Clonality.Rmd',
params = list(filedir =  opt$dir))