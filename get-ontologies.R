# process ontologies
#  - get information from BioPortals to prep annotation md files

library(tidyverse)
library(R.utils)

# Pathway Ontology
pw.url <- "https://data.bioontology.org/ontologies/PW/download?apikey=8b5b7825-538d-40e0-9e9e-5ab9274a9aeb&download_format=csv"
con <- gzcon(url(pw.url))
txt <- readLines(con)
close(con)
pw.df <- read.csv(textConnection(txt))

pw.df <- select(pw.df, c(Class.ID, Definitions, Obsolete, Parents))
pw.df2 <- pw.df %>%
  rename(ID = Class.ID) %>%
  mutate(ID = gsub("_",":",gsub("http://purl.obolibrary.org/obo/","",ID))) %>%
  mutate(Parents = gsub("_",":",gsub("http://purl.obolibrary.org/obo/","",Parents))) %>%
  mutate(ParentsXref = gsub("PW:","",Parents)) %>%
  mutate(ParentsXref = gsub("|",",",ParentsXref, fixed = T)) %>%
  mutate(Definitions = gsub("[\r\n]", "", Definitions)) %>%
  mutate(Definitions = gsub('"', '\\\\"', Definitions)) %>%
  filter(Obsolete == "false") 

l0 <- "PW:0000001"
l1 <- as.list(pw.df2 %>%
  filter(Parents == l0| ID == l0) %>%
  select(ID))$ID
l2 <- as.list(pw.df2 %>%
                filter(map_lgl(strsplit(Parents, "|", fixed=T), ~ any(.x %in% l1))) %>%
                select(ID))$ID
l3 <- as.list(pw.df2 %>%
                filter(map_lgl(strsplit(Parents, "|", fixed=T), ~ any(.x %in% l2))) %>%
                select(ID))$ID

pw.df3 <- pw.df2 %>%
  mutate(Level = if_else(ID %in% l1, "", 
                         if_else(ID %in% l2, "Level 2",
                                 if_else(ID %in% l3, "Level 3", "Level 4+"))))

update_md_annotations(pw.df3)

## CELL TYPE
cl.url <- "https://data.bioontology.org/ontologies/CL/download?apikey=8b5b7825-538d-40e0-9e9e-5ab9274a9aeb&download_format=csv"
con <- gzcon(url(cl.url))
txt <- readLines(con)
close(con)
cl.df <- read.csv(textConnection(txt))

cl.df <- select(cl.df, c(Class.ID, Definitions, Obsolete, Parents))
cl.df2 <- cl.df %>%
  rename(ID = Class.ID) %>%
  mutate(ID = gsub("_",":",gsub("http://purl.obolibrary.org/obo/","",ID))) %>%
  mutate(Parents = gsub("_",":",gsub("http://purl.obolibrary.org/obo/","",Parents))) %>%
  mutate(ParentsXref = gsub("CL:","",Parents)) %>%
  mutate(ParentsXref = gsub("|",",",ParentsXref, fixed = T)) %>%
  mutate(Definitions = gsub("[\r\n]", "", Definitions)) %>%
  mutate(Definitions = gsub('"', '\\\\"', Definitions)) %>%
  filter(Obsolete == "false") %>%
  filter(str_detect(ID, "^CL:"))

l0 <- "CL:0000000"
l1 <- as.list(cl.df2 %>%
                filter(Parents == l0| ID == l0) %>%
                select(ID))$ID
l2 <- as.list(cl.df2 %>%
                filter(map_lgl(strsplit(Parents, "|", fixed=T), ~ any(.x %in% l1))) %>%
                select(ID))$ID
l3 <- as.list(cl.df2 %>%
                filter(map_lgl(strsplit(Parents, "|", fixed=T), ~ any(.x %in% l2))) %>%
                select(ID))$ID

cl.df3 <- cl.df2 %>%
  mutate(Level = if_else(ID %in% l1, "", 
                         if_else(ID %in% l2, "Level 2",
                                 if_else(ID %in% l3, "Level 3", "Level 4+"))))

update_md_annotations(cl.df3)

## DISEASE
di.url <- "https://data.bioontology.org/ontologies/DOID/download?apikey=8b5b7825-538d-40e0-9e9e-5ab9274a9aeb&download_format=csv"
con <- gzcon(url(di.url))
txt <- readLines(con)
close(con)
di.df <- read.csv(textConnection(txt))

di.df <- select(di.df, c(Class.ID, Definitions, Obsolete, Parents))
di.df2 <- di.df %>%
  rename(ID = Class.ID) %>%
  mutate(ID = gsub("_",":",gsub("http://purl.obolibrary.org/obo/","",ID))) %>%
  mutate(Parents = gsub("_",":",gsub("http://purl.obolibrary.org/obo/","",Parents))) %>%
  mutate(ParentsXref = gsub("DOID:","",Parents)) %>%
  mutate(ParentsXref = gsub("|",",",ParentsXref, fixed = T)) %>%
  mutate(Definitions = gsub("[\r\n]", "", Definitions)) %>%
  mutate(Definitions = gsub('"', '\\\\"', Definitions)) %>%
  filter(Obsolete == "false") %>%
  filter(str_detect(ID, "^DOID:"))

l0 <- "DOID:4"
l1 <- as.list(di.df2 %>%
                filter(Parents == l0 | ID == l0) %>%
                select(ID))$ID
l2 <- as.list(di.df2 %>%
                filter(map_lgl(strsplit(Parents, "|", fixed=T), ~ any(.x %in% l1))) %>%
                select(ID))$ID
l3 <- as.list(di.df2 %>%
                filter(map_lgl(strsplit(Parents, "|", fixed=T), ~ any(.x %in% l2))) %>%
                select(ID))$ID

di.df3 <- di.df2 %>%
  mutate(Level = if_else(ID %in% l1, "", 
                         if_else(ID %in% l2, "Level 2",
                                 if_else(ID %in% l3, "Level 3", "Level 4+"))))

update_md_annotations(di.df3)

#### FUNCTIONS ####
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
    parents<-p["ParentsXref"]
    #clean parents
    par.split <- strsplit(parents, ",")[[1]]
    par.sub <- par.split[grepl("^\\d+$", par.split)]
    parents <- toString(shQuote(par.sub))
    filename <- file.path('_annotations', paste(fn,'md', sep = "."))
    if(file.exists(filename)){
      print(fn)
      con <- file(filename)
      on.exit(close(con))
      dat <- readLines(con, warn=FALSE)
      if(length(dat)>6){
        # new.line <- paste0('level: "',level,'"')
        # dat <- insert_line_at(dat, new.line, insert_after=5)
        # new.line <- paste0('definition: "',def,'"')
        # dat <- insert_line_at(dat, new.line, insert_after=5)
        dat <- dat[1:5]
        new.line <- paste0('definition: "',def,'"')
        dat[6] <- new.line
        new.line <- paste0('level: "',level,'"')
        dat[7] <- new.line
        new.line <- paste0('parents: [',parents,']')
        dat[8] <- new.line
        dat[9] <- '---'
        write(dat, file = filename, append = F)
      }
    }
  })
}

# set_obsolete md annotations
for (fn in list.files("_annotations")){
  filename <- file.path('_annotations', fn)
  con <- file(filename)
  on.exit(close(con))
  dat <- readLines(con, warn=FALSE)
  if(length(dat)==6){
    print(fn)
    new.line <- paste0('level: "Obsolete"')
    dat[6] <- new.line
    dat[7] <- '---'
    write(dat, file = filename, append = F)
  }
  close(con)
}




  
