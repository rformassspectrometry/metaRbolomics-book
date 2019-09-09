sessionInfo()

# Install blogdown --------------------------------------------------------
r <- getOption("repos")
  r["CRAN"] <- "http://cran.rstudio.com"
  options(repos = r)

# install.packages("dplyr") # part of docker image
# install.packages("readr") # part of docker image
# install.packages("knitr") # part of docker image
# install.packages("purrr") # part of docker image

install.packages("DT")

install.packages("remotes")
# install.packages("kableExtra")
haozhu233/kableExtra

install.packages("tikzDevice")




install.packages("webshot")
webshot::install_phantomjs()
