sessionInfo()

# Install pacakages --------------------------------------------------------
r <- getOption("repos")
r["CRAN"] <- "http://cran.rstudio.com"
options(repos = r)

# install.packages("dplyr") # part of docker image
# install.packages("readr") # part of docker image
# install.packages("knitr") # part of docker image
# install.packages("purrr") # part of docker image

# read from google sheets
install.packages("googlesheets")


# Nice tables
install.packages("DT")
install.packages("kableExtra")
install.packages("tikzDevice")
install.packages("webshot") # screenshot for datatables (not used)
webshot::install_phantomjs()


# Network graph
install.packages(c("fastmap", "miniCRAN","igraph","magrittr","networkD3",
                   "visNetwork","magrittr")
                 )

# Webshot and dependencies
install.packages(c("fastmap", "later", "promises", "remotes"))
remotes::install_github("rstudio/websocket", upgrade = "always")
remotes::install_github("rstudio/webshot2", upgrade = "always")


# To read dependencies from DESCRIPTION file
remotes::install_github("r-lib/desc", upgrade = "always")


## Appendix 4
install.packages("miniCRAN")
