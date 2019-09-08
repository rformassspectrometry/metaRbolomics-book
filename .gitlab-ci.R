sessionInfo()

# Install blogdown --------------------------------------------------------
r <- getOption("repos")
  r["CRAN"] <- "http://cran.rstudio.com"
  options(repos = r)

# install.packages("dplyr") # part of docker image
# install.packages("readr") # part of docker image
install.packages("DT")

install.packages("webshot")
webshot::install_phantomjs()
