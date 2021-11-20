# grab wp thumbnails for wikipathways.github.io

library(rWikiPathways)
library(dplyr)
BiocManager::install("EBImage")
library(EBImage)

### Collect data
approved_wpid <- getPathwayIdsByCurationTag("Curation:AnalysisCollection")
all_wpid <- approved_wpid
# all_wpid <- sample(all_wpid, 2)

sapply(all_wpid, function(p){
  p.url <- paste0("https://www.wikipathways.org//wpi/wpi.php?action=downloadFile&type=png&pwTitle=Pathway:",p)
  p.dir <- file.path('assets/img', p)
  dir.create(p.dir, showWarnings = FALSE)
  p.file <- file.path(p.dir,paste0(p,'-thumb.png'))
  x <- readImage(p.url, type="png")
  y <- resize(x, w = 480) # 3 x display at 160px width
  writeImage(y,p.file)
})
