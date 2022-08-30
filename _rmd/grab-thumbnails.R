# grab wp thumbnails for wikipathways.github.io

BiocManager::install(c("rWikiPathways","EBImage"), ask=F, quiet=T)
library(rWikiPathways)
library(EBImage)

### Collect data
approved.wpid <- getPathwayIdsByCurationTag("Curation:AnalysisCollection")
# approved.wpid <- sample(approved.wpid, 2)

sapply(approved.wpid, function(p){
  p.url <- paste0("https://www.wikipathways.org//wpi/wpi.php?action=downloadFile&type=png&pwTitle=Pathway:",p)
  p.dir <- file.path('../../wikipathways-downstream/pathways', p)
  dir.create(p.dir, showWarnings = FALSE)
  p.file <- file.path(p.dir,paste0(p,'-thumb.png'))
  x <- EBImage::readImage(p.url, type="png")
  y <- EBImage::resize(x, w = 480) # 3 x display at 160px width
  EBImage::writeImage(y,p.file)
})


## Resize PNGs
# e.g., downsize all PNGs for storage efficiency
setwd("~/git/wikipathways/wikipathways-assets/pathways")

dir.ls = list.dirs(full.names = F, recursive = F)

sapply(dir.ls, function(p){
  sprintf("working on %s",p)
  p.file = file.path(p,paste(p,"png", sep = "."))
  x = EBImage::readImage(p.file, type="png")
  y = EBImage::resize(x, w = 2400)
  EBImage::writeImage(y,p.file)
})
