# This is the install script for a good R setup

packagelist <- c('devtools',
                 'ggplot2',
                 'dplyr',
                 'xtable',
                 'ggthemes',
                 'tufte')
newpackages <- packagelist[!(packagelist %in% installed.packages()[,'Package'])]
if (length(newpackages)) {
    install.packages(newpackages,
                     type = 'source',
                     repos = 'https://cloud.r-project.org/')
}
# install.packages('tufte', type = 'source', repos='https://cran.cnr.berkeley.edu/')

# Installs colorout
# install.packages('devtools', repos='https://cran.cnr.berkeley.edu/')
library(devtools)
devtools::install_github("jalvesaq/colorout")
devtools::install_github("rstudio/rmarkdown")
devtools::install_github("IRkernel/IRkernel")
IRkernel::installspec(user = FALSE)
# install.packages('ggplot2', repos='https://cran.cnr.berkeley.edu/')
# install.packages('dplyr', repos='https://cran.cnr.berkeley.edu/')
# install.packages('xtable', repos='https://cran.cnr.berkeley.edu/')
# install.packages('ggthemes', repos='https://cran.cnr.berkeley.edu/')
