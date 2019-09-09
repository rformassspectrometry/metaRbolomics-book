index <- function(url, type = "source", filters = NULL) {
  contribUrl <- contrib.url(url, type = type)
  p <- available.packages(contribUrl, type = type, filters = filters)
  p
}

biocAndCranPackages <- function(bioc_url) {
#  bioc <- index(BiocManager::repositories()["BioCsoft"])
  bioc <- index(bioc_url)
  cran <- available.packages()
  apkgs <- rbind(bioc, cran)
}

allPackagesInViews <- function(url) {
  ## From:
  ## https://github.com/phnmnl/bioc_docker/blob/master/out/devel_metabolomics/installFromBiocViews.R
  
  t <- tempfile()
  download.file(paste(url, "VIEWS", sep=""), t)
  dcf <- as.data.frame(read.dcf(t), stringsAsFactors = FALSE)
  
  return (dcf)
}


packagesInView <- function(wantedBiocViews, packagesAndViews) {

  pkgs_matching_views <- c()
  
  for (i in 1:nrow(packagesAndViews))
  {
    row <- packagesAndViews[i, ]
    if ((!is.na(row$biocViews)) && (!is.null(row$biocViews)))
    {
      views <- strsplit(gsub("\\s", "", row$biocViews), ",")[[1]]
      if (any(wantedBiocViews %in% views))
        pkgs_matching_views <-
          append(pkgs_matching_views, row$Package)
    }
  }
  
  ap.db <- available.packages(contrib.url(BiocManager::repositories()))
  ap <- rownames(ap.db)
  
  pkgs_to_install <-
    pkgs_matching_views[pkgs_matching_views %in% ap]
  pkgs_to_install
}
