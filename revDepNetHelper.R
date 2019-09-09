get_git_deps <- function(package_link){
  
  require(dplyr)
  require(desc)
  
  # Function to ignore error when file doesn't exist
  download.file_p <- possibly(download.file, TRUE)
  
  # get link to DESCRIPTION file if GitHub or GitLab
  if(!grepl("github.com/|gitlab.com/",package_link)) return(tibble())
  
  if(grepl("github.com/",package_link)) {
    url <- package_link %>% 
      gsub("github.com/", "raw.githubusercontent.com/", .) %>% 
      paste0("/master/DESCRIPTION")
  }
  
  if(grepl("gitlab.com/",package_link)) {
    url <- package_link %>% 
      paste0("/raw/master/DESCRIPTION")
  }
  
  # download file
  file <- tempfile()
  downfail <- suppressWarnings(download.file_p(url, file, quiet =TRUE))
  
  if(downfail) return(tibble())
  
  # get dependencies from downloaded file
  package <- sub("^.+/", "", package_link)
  
  deps <- 
    desc_get_deps(file = file) %>% 
    as_tibble() %>% 
    filter(type %in% c("Depends", "Imports", "LinkingTo")) %>% 
    select(Dep = package) %>% 
    mutate(Package = package)
  
  unlink(file)
  
  return(deps)
}
