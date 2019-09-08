sessionInfo()

# Install blogdown --------------------------------------------------------
r <- getOption("repos")
  r["CRAN"] <- "http://cran.rstudio.com"
  options(repos = r)

install.packages("dplyr")
install.packages("readr")
install.packages("DT")

install.packages("webshot")
webshot::install_phantomjs()
