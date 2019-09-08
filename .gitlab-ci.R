sessionInfo()

# Install blogdown --------------------------------------------------------
r <- getOption("repos")
  r["CRAN"] <- "http://cran.rstudio.com"
  options(repos = r)

# install.packages("dplyr") # r-cran-dplyr
# install.packages("readr") # r-cran-readr
# install.packages("DT") # r-cran-dt

# install.packages("webshot") # r-cran-webshot
webshot::install_phantomjs()
