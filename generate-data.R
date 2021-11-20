# Generate md and csv for wikipathways.github.io

library(rWikiPathways)
library(dplyr)
library(lubridate)


### Collect data
# getPathwayIdsByCurationTag()
# all_wpid<-listPathwayIds()
# reactome_wpid <- getPathwayIdsByCurationTag("Curation:Reactome_approved")
# all_wpid<-setdiff(all_wpid, reactome_wpid)
approved_wpid <- getPathwayIdsByCurationTag("Curation:AnalysisCollection")
all_wpid <- approved_wpid
all_wpid_200 <- sample(all_wpid, 200)
all_wpid_20 <- sample(all_wpid, 20)

## pathway info
df_info<-lapply(all_wpid, getPathwayInfo) %>% bind_rows()

## description
# df_desc<-getPathway(all_wpid_20[1])

## pathway history: authors and last edit
df_hist<-lapply(all_wpid, function(p){
  ph<- getPathwayHistory(p, "20000000000000")
  auth <- paste(unique(sapply(ph, function(a){a$user})), collapse = ", ")
  last <- ph[length(ph)][[1]]$timestamp
  last <- ymd(substr(last,1,8))
  data.frame(id=p, authors=auth, last=last)
})  %>% bind_rows()

## curation tags: communities
df_tags<-lapply(all_wpid, function(p){
  ph<- getCurationTags(p)
  tags <- sapply(ph, function(t){
    tdn<-t$displayName
    tn<-t$name
    if(startsWith(tdn, "Community"))
      sub("Curation:","", tn)
    else
      NA
    })
  tags <- tags[!is.na(tags)]
  tags <- paste(tags, collapse = ", ")
  data.frame(id=p, communities=tags)
})  %>% bind_rows()

## ontologies
df_ont<-lapply(all_wpid, function(p){
  ph<- getOntologyTerms(p)
  ont <- sapply(ph, function(o){
    oid<-paste('- id:',o$id)
    on<-paste('  value:',o$name)
    oo<-paste('  type:',o$ontology)
    paste(list(oid, on, oo), collapse = "|,|")
  })
  ont <- paste(ont, collapse = "|;|")
  data.frame(id=p, ontologies=ont)
})  %>% bind_rows()

# Process further for Annotation files
df_annot <-  df_ont[!df_ont$ontologies =="", ]
dl_annot <- unname(unlist(as.list(df_annot %>%
  separate_rows(ontologies, sep= "\\|;\\|") %>%
  distinct(ontologies))))

write_md_annotations(dl_annot)

### Merge dataframes
df_all <- df_info %>%
  left_join(df_hist, by="id") %>%
  left_join(df_tags, by="id") %>%
  left_join(df_ont, by="id")

# write.table(df_all, "pathway_table_approved.tsv", row.names = F, sep = "\t")
df_all <- read.table("pathway_table_approved.tsv", header = T, sep = "\t")

### Write Organism files
orgs <- unique(df_all$species)
df_orgs <- read.table("https://raw.githubusercontent.com/bridgedb/datasources/main/organisms.tsv", 
                   header = T, sep = "\t")
df_orgs <- df_orgs %>%
  mutate(latin = paste(generic_name, specific_name)) %>%
  mutate(short_name = tolower(short_name)) %>%
  mutate(link_name = gsub(" ","_",short_name)) %>%
  filter(latin %in% orgs)

write_md_organisms(df_orgs)

## Write stubs for Community files
coms <- unique(unlist(strsplit(df_all$communities, split = ", ")))
comtags <- read.table("community_tags.tsv", header = T, sep = "\t")
df_coms <- comtags %>%
  mutate(name = sub("Curation:","",name)) %>%
  mutate(displayName = sub("Community: ","",displayName)) 

write_md_communities(df_coms)

### Write MD files
write_md_pathways(df_all)


###########################
## FUNCTIONS
###########################

write_md_pathways<-function(df){
  apply(df, 1, function(p){
    filename <- file.path('_pathways', paste(p['id'],'md', sep = "."))
    if(!file.exists(filename)){
      write("---", file = filename, append = F)
      write("# GPML DATA", file = filename, append = T)
      write(paste0('title: "',p['name'],'"'), file = filename, append = T)
      ## TODO: Add real description
      write(paste0('description: "This is a temporary description for ',p['name'],'"'), file = filename, append = T) 
      write(paste0("authors: [",p['authors'],"]"), file = filename, append = T)
      write(paste0("organisms: [",p['species'],"]"), file = filename, append = T)      
      write(paste0("annotations:"), file = filename, append = T)
      annots <- p['ontologies']
      annot.list <- unlist(as.list(str_split(annots, "(\\|;\\||\\|,\\|)", simplify = T)))
      lapply(annot.list, function(x){
        write(paste0("  ",x), file = filename, append = T)
      })
      write("# ADDITIONAL DATA", file = filename, append = T)
      write(paste0("last-edited: ",p['last']), file = filename, append = T)
      write(paste0("communities: [",p['communities'],"]"), file = filename, append = T)
      write(paste0('wpid: "',p['id'],'"'), file = filename, append = T)
      ## TODO: Add GitHub authors
      #write(paste0("github-authors: [",paste(github-authors, collapse=","),"]"), file = filename, append = T)
      write("# STRUCTURED METADATA FOR SEO", file = filename, append = T)
      write("seo:", file = filename, append = T)
      write("  type: CreativeWork", file = filename, append = T)
      write("schema-jsonld:", file = filename, append = T)
      write('  - "@context": https://schema.org/', file = filename, append = T)
      write('    "@id": https://wikipathways.github.io/pathways/WP554.html', file = filename, append = T)
      write('    "@type": Dataset', file = filename, append = T)
      write(paste0('    "name": "',p['name'],'"'), file = filename, append = T)
      ## TODO: Add real description
      write(paste0('    "description": "This is a temporary description for the pathway entitled: ',p['name'],'"'), file = filename, append = T)
      write(paste0('    "url": "',p['url'],'"'), file = filename, append = T)
      write('    "license": CC0', file = filename, append = T)
      write('    "creator":', file = filename, append = T)
      write('    - "@type": Organization', file = filename, append = T)
      write('      "name": "WikiPathways"', file = filename, append = T)
      write('    "keywords": [', file = filename, append = T)
      value.list <- lapply(annot.list, function(x){
        x2<-gsub("  value: ", "", x)
        if(nchar(x2) < nchar(x))
          x2
      })
      value.list <- unlist(value.list[!sapply(value.list,is.null)])
      write(paste0('      "',paste(value.list, collapse = '", "'),'",'), file = filename, append = T)
      ## TODO: Add textLabels from datanodes and labels
      # write(paste0('      "',paste(textLabel.list, collapse = '", "'),'"'), file = filename, append = T)
      write('      ]', file = filename, append = T)
      
      write("---", file = filename, append = T)
    }
  })
}

write_md_organisms<-function(df){
  apply(df, 1, function(p){
    filename <- file.path('_organisms', paste(p['link_name'],'md', sep = "."))
    if(!file.exists(filename)){
      write("---", file = filename, append = F)
      write(paste0('common: "',p['short_name'],'"'), file = filename, append = T)
      write(paste0('latin: "',p['latin'],'"'), file = filename, append = T)
      write(paste0('ncbi: "',p['ncbi'],'"'), file = filename, append = T)
      capName <- paste(toupper(substring(p['short_name'], 1, 1)), substring(p['short_name'], 2), sep = "")
      write(paste0('title: "',capName,' pathways"'), file = filename, append = T)
      write("---", file = filename, append = T)
    }
  })
}

write_md_communities<-function(df){
  apply(df, 1, function(p){
    filename <- file.path('_communities', paste(tolower(p['name']),'md', sep = "."))
    if(!file.exists(filename)){
      write("---", file = filename, append = F)
      write(paste0('display-name: "',p['displayName'],'"'), file = filename, append = T)
      write(paste0('title: "',p['displayName'],'"'), file = filename, append = T)
      write(paste0('description: "',p['description'],'"'), file = filename, append = T)
      write(paste0('logo: '), file = filename, append = T)
      write(paste0('logo-link: '), file = filename, append = T)
      write(paste0('community-tag: "',p['name'],'"'), file = filename, append = T)
      write("---", file = filename, append = T)
    }
  })
}

write_md_annotations<-function(dl){
  blah<- lapply(dl, function(p){
    parts <- unlist(str_split(p, "\\|,\\|"))
    xds<-sub(".* ([A-Z]+):[0-9]+[\\s]*$", "\\1",  parts[1],perl=TRUE)
    xid<-sub(".*:([0-9]+)[\\s]*$", "\\1",  parts[1],perl=TRUE)
    value<-sub("^ value: ", "",  parts[2],perl=TRUE)
    type<-sub("^ type: ", "",  parts[3],perl=TRUE)
    fn<-paste(xds,xid, sep = ":")
    filename <- file.path('_annotations', paste(fn,'md', sep = "."))
    if(!file.exists(filename)){
      write("---", file = filename, append = F)
      write(paste0('value: "',value,'"'), file = filename, append = T)
      write(paste0('type: "',type,'"'), file = filename, append = T)
      write(paste0('xref-identifier: "',xid,'"'), file = filename, append = T)
      write(paste0('xref-dataSource: "',xds,'"'), file = filename, append = T)
      write("---", file = filename, append = T)
    }
  })
}

