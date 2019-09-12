pagebreak <- function() {
  if(knitr::is_latex_output())
    return("\\newpage")
  else
    return('<div style="page-break-before: always;" />')
}

breakline <- function(n) {
  if(knitr::is_latex_output())
    return(paste(rep("\\leavevmode\\newline", n), sep="", collapse=""))
  else
    return(paste(rep('<br/>', n), sep="", collapse=""))
}


sanitizeTexString_V <- function(x) if(is.na(x)) return(as.character(NA)) else return(sanitizeTexString(x))

metaRbolomics_show_table <- function(table_text = "Table 1:"){
    require(DT)
    require(dplyr)
    require(knitr)
    require(kableExtra)
    require(purrr)
    require(tikzDevice) # for sanitizeTexString
    
    caption <- pack_list$Table %>% 
                    unique() %>% 
                    grep(table_text, ., value = TRUE)
    
    table_dat <- pack_list %>% 
                    filter(grepl(table_text, Table))
    
                   
    
    if (format=="html") {
        table_dat <- table_dat %>% 
            mutate(Package = paste0('<a target=_blank href=', Code_link, '>', Package,'</a>' )) %>%
            select(-Table, -Code_link)
            
            
    out <- datatable(table_dat,
                      extensions = "RowGroup", 
                      options = list(rowGroup=list(dataSrc=0),
                                     ordering=FALSE,
                                     columnDefs = list(list(visible=FALSE, targets=c(0))), # hide rownames
                                     pageLength = -1, # show all entries
                                     dom = 'ft' # remove nagivation
                                     ),
                      rownames= FALSE, 
                      escape = FALSE,
                      fillContainer=FALSE,
                      caption = caption
                    )
    
    return(out)
    }
    
    
    
    if (format %in% c("pdf", "latex", "epub3")) {
        
        Section_labels <- unique(table_dat$Section)
        pos_start <- match(Section_labels, table_dat$Section)
        pos_end <- c(pmin(pos_start[-1]+1, length(table_dat$Section)), length(table_dat$Section))
        
        
        if (format %in% c("pdf", "latex")) {
            table_dat <- table_dat %>% 
                mutate_all(~map_chr(., sanitizeTexString_V)) %>% # need to sanitize because we have to use escape = FALSE later
                mutate(Package = paste0('\\href{',Code_link,'}{',Package,'}')) %>% 
                select(-Table, -Code_link)
            

           out <- table_dat %>% 
               select(-Section) %>% 
               kable("latex", 
                     booktabs = TRUE, 
                     escape = FALSE, 
                     longtable = TRUE,
                     caption = caption %>% gsub(".*: ","",.)
                     ) %>%
                column_spec(1, width = "30em") %>%
                column_spec(2, width = "10em") %>%
                column_spec(3, width = "3em") %>% 
                kable_styling(latex_options = c("repeat_header")) %>% kable_styling(latex_options = "striped")
        }
        
        
        if (format %in% c("epub3")) {
            
            table_dat <- table_dat %>% 
                mutate(Package = paste0('<a target=_blank href=', Code_link, '>', Package,'</a>' )) %>%
                select(-Table, -Code_link)
            
           out <- table_dat %>% 
               select(-Section) %>% 
               kable(escape=FALSE, 
                     caption = caption %>% gsub(".*: ","",.)
                     )
                }
        
        if(!all(is.na(Section_labels))){
            for(i in seq_along(Section_labels)){
                out <- out %>% 
                    group_rows(Section_labels[i], 
                               pos_start[i], 
                               pos_end[i], 
                               indent=FALSE
                               )
            }
        }
        return(out)
    }
}
