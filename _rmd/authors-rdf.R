# Generate wikipathways-YYYYMMDD-rdf-authors.zip for data.wikipathways.org

library(tidyr)
library(dplyr)
library(magrittr)
library(yaml)
library(WikidataQueryServiceR)

rel.date <- format(Sys.Date(),'%Y%m%d')

######################
## Prepare Author Data
######################

# All authors
author.mds <- list.files("_authors",".md")
df <- lapply(author.mds, function(md){
  dat <- yaml::read_yaml(file.path("_authors",md))
  data.frame(username=dat$username,
                   realname=dat$realname,
                   orcid=ifelse(is.null(dat$orcid),NA,dat$orcid),
                   wikidata=ifelse(is.null(dat$wikidata),NA,dat$wikidata))
  
})
authors.df <- do.call(rbind, df)

# Only orcid authors
orcid.df <- dplyr::filter(authors.df, !is.na(orcid))
nowd.df <- orcid.df %>%
  dplyr::filter(is.na(wikidata)) %>%
  dplyr::select(-wikidata)
## use SPARQL to get Wikidata ID
query <- 'SELECT DISTINCT ?person ?personLabel WHERE {\n  ?person wdt:P496 "XXX" .\n  SERVICE wikibase:label {\n    bd:serviceParam wikibase:language "[AUTO_LANGUAGE],en" .\n  }\n}'
res.ls<-apply(nowd.df, 1, function(x){
  wdq <- gsub("XXX",x['orcid'],query)
  res <- WikidataQueryServiceR::query_wikidata(wdq)
  if(nrow(res)==1){
    c(gsub("http://www.wikidata.org/entity/","",res$person),  res$personLabel)
  } else {
    c(NA, NA)
  }
})
res.df <- data.frame(matrix(unlist(res.ls), nrow = length(res.ls)/2, byrow = T ),stringsAsFactors = F)
colnames(res.df)<-c("wikidata","fullName")
orcid_wd.df <- nowd.df %>%
  dplyr::bind_cols(res.df) %>%
  dplyr::select(-fullName) %>%
  rbind(orcid.df) %>%
  tidyr::drop_na() %>%
  #dplyr::mutate(username=gsub(" ","_",username)) %>%
  distinct(username, orcid, wikidata) 

# Authors per pathway
pathway.mds <- list.files("_pathways",".md")
df <- lapply(pathway.mds, function(md){
  dat <- yaml::read_yaml(file.path("_pathways",md))
  data.frame(wpid=dat$wpid,
             username=dat$authors)
  
})
wpa.df <- do.call(rbind, df) 
wpa.df <- as.data.frame(wpa.df  %>%
  dplyr::filter(username != "MaintBot" & username != "TestUser" ) %>%
  dplyr::add_count(wpid) %>%
  dplyr::group_by(wpid) %>% 
  dplyr::mutate(ordinalRank=1:n()) %>% 
  #dplyr::mutate(username=gsub(" ","_",username)) %>%
  dplyr::arrange(wpid, ordinalRank)
)
## Add realnames
wpa.df <- left_join(wpa.df, authors.df[,c("username","realname")], "username")

############################
## WRITE TTL FILES
############################

## dplyr::mutate author data for RDF
wpa.ttl <- wpa.df %>% dplyr::ungroup() %>%
  dplyr::mutate(s1 = paste0("https://identifiers.org/wikipathways/",wpid)) %>%
  dplyr::mutate(p1 = "dc:creator") %>%
  dplyr::mutate(o1 = paste0('<http://rdf.wikipathways.org/User/',username,'>')) %>%
  dplyr::mutate(p2a = "a") %>%
  dplyr::mutate(o2a = paste0('foaf:Person')) %>%
  dplyr::mutate(p2b = "foaf:name") %>%
  dplyr::mutate(o2b = paste0('"',realname,'"')) %>%
  dplyr::mutate(p2c = "foaf:homepage") %>%
  dplyr::mutate(o2c = paste0('<https://new.wikipathways.org/authors/',username,'>')) %>%
  dplyr::mutate(p2d = "pq:series_ordinal") %>%
  dplyr::mutate(o2d = paste0('"',ordinalRank,'"')) %>%
  dplyr::select(s1,p1,o1,p2a,o2a,p2b,o2b,p2c,o2c,p2d,o2d)

wpa.ttl2 <- wpa.ttl %>%
  dplyr::group_by(s1,p1) %>% 
  dplyr::summarise(o1 = paste(gsub("\"","\\\\\"",unique(o1)), sep = "", collapse = ' , '))

## dplyr::mutate orcid data for RDF
orcid.ttl <- orcid_wd.df %>%
  dplyr::mutate(o1 = paste0('<http://rdf.wikipathways.org/User/',username,'>')) %>%
  dplyr::mutate(p2a = "owl:sameAs") %>%
  dplyr::mutate(o2a = paste0('<http://www.wikidata.org/entity/',wikidata,'>')) %>%
  dplyr::mutate(p2b = "dc:identifier") %>%
  dplyr::mutate(o2b = paste0('<https://orcid.org/',orcid,'>')) %>%
  dplyr::select(o1,p2a,o2a,p2b,o2b)

## write out files
dir.create("authors", FALSE)
sapply(wpa.ttl2$s1, function(x){
  wpid <- gsub("https://identifiers.org/wikipathways/","",x)
  filename <- paste0("authors/",wpid, ".ttl")
  writeLines(c("@prefix xsd:   <http://www.w3.org/2001/XMLSchema#> .",
               "@prefix gpml:  <http://vocabularies.wikipathways.org/gpml#> .",
               "@prefix dc:    <http://purl.org/dc/elements/1.1/> .",
               "@prefix owl: <http://www.w3.org/2002/07/owl#> .",
               "@prefix foaf:  <http://xmlns.com/foaf/0.1/> .",
               "@prefix pq: <http://www.wikidata.org/prop/qualifier/> .",
               "",
               paste0("<",x,">")
  ),filename)
  apply(wpa.ttl2[which(wpa.ttl2$s1==x),], 1, function(y){
    write(paste0("        ",y['p1'],"            ",y['o1'], " ."), filename, append = TRUE)
  })
  apply(wpa.ttl[which(wpa.ttl$s1==x),], 1, function(z){
    write("\n", filename, append = TRUE)
    write(z['o1'], filename, append = TRUE)
    write(paste0("        ",z['p2a'],"                    ",z['o2a']," ;"), filename, append = TRUE)
    write(paste0("        ",z['p2b'],"            ",z['o2b']," ;"), filename, append = TRUE)
    write(paste0("        ",z['p2d'],"            ",z['o2d']," ;"), filename, append = TRUE)
    apply(orcid.ttl[which(orcid.ttl$o1==z['o1']),], 1, function(w){
      if (!is.na(w['p2a'])){
        write(paste0("        ",w['p2a'],"           ",w['o2a']," ;"), filename, append = TRUE)
        write(paste0("        ",w['p2b'],"        ",w['o2b']," ;"), filename, append = TRUE)
      }
    })
    write(paste0("        ",z['p2c'],"        ",z['o2c']," ."), filename, append = TRUE)
  })

})

## zip authors folder
files2zip <- dir('authors', full.names = TRUE)
zip(zipfile = paste0('wikipathways-',rel.date,'-rdf-authors'), files = files2zip)
