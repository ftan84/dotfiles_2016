# This is the install script for a good R setup

# Installs colorout
install.packages('devtools', repos='https://cran.cnr.berkeley.edu/')
library(devtools)
devtools::install_github("jalvesaq/colorout")
