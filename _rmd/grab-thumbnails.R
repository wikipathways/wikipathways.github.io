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
