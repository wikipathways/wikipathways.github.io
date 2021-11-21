# process ontologies
#  - get information from BioPortals to prep annotation md files

library(tidyverse)
library(R.utils)

# Pathway Ontology
pw.url <- "https://data.bioontology.org/ontologies/PW/download?apikey=8b5b7825-538d-40e0-9e9e-5ab9274a9aeb&download_format=csv"
con <- gzcon(url(pw.url))
txt <- readLines(con)
pw.df <- read.csv(textConnection(txt))

pw.df <- select(pw.df, c(Class.ID, Definitions, Obsolete, Parents))
pw.df2 <- pw.df %>%
  rename(ID = Class.ID) %>%
  mutate(ID = gsub("_",":",gsub("http://purl.obolibrary.org/obo/","",ID))) %>%
  mutate(Parents = gsub("_",":",gsub("http://purl.obolibrary.org/obo/","",Parents))) %>%
  filter(Obsolete == "false") 

l0 <- "PW:0000001"
l1 <- as.list(pw.df2 %>%
  filter(Parents == l0) %>%
  select(ID))$ID
l2 <- as.list(pw.df2 %>%
                filter(map_lgl(strsplit(Parents, "|", fixed=T), ~ any(.x %in% l1))) %>%
                select(ID))$ID
l3 <- as.list(pw.df2 %>%
                filter(map_lgl(strsplit(Parents, "|", fixed=T), ~ any(.x %in% l2))) %>%
                select(ID))$ID

pw.df3 <- pw.df2 %>%
  mutate(Level = if_else(Parents == l0, 1, 
                         if_else(Parents %in% l1, 2,
                                 if_else(Parents %in% l2, 3, 4))))

insert_line_at <- function(dat, to_insert, insert_after){
  pre <- dat[1:insert_after]
  post <- dat[(insert_after+1):length(dat)]
  return(c(pre, to_insert, post))
}

update_md_annotations<-function(dl){
  blah<- apply(dl, 1,function(p){
    fn<-p["ID"]
    def<-p["Definitions"]
    level<-p["Level"]
    filename <- file.path('_annotations', paste(fn,'md', sep = "."))
    if(file.exists(filename)){
      print(fn)
      con <- file(filename)
      on.exit(close(con))
      dat <- readLines(con, warn=FALSE)
      if(length(dat)==6){
        new.line <- paste0('level: "',level,'"')
        dat <- insert_line_at(dat, new.line, insert_after=5)
        new.line <- paste0('definition: "',def,'"')
        dat <- insert_line_at(dat, new.line, insert_after=5)
        write(dat, file = filename, append = F)
      }
    }
  })
}

update_md_annotations(pw.df3)


  
