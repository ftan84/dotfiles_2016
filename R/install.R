# This is the install script for a good R setup

# Installs colorout
install.packages('devtools', repos='https://cran.cnr.berkeley.edu/')
library(devtools)
devtools::install_github("jalvesaq/colorout")
devtools::install_github("rstudio/rmarkdown")
# install.packages('rmarkdown', repos='https://cran.cnr.berkeley.edu/')
install.packages('ggplot2', repos='https://cran.cnr.berkeley.edu/')
install.packages('dplyr', repos='https://cran.cnr.berkeley.edu/')
install.packages('xtable', repos='https://cran.cnr.berkeley.edu/')
install.packages('tufte', type = 'source', repos='https://cran.cnr.berkeley.edu/')
install.packages('ggthemes', repos='https://cran.cnr.berkeley.edu/')
