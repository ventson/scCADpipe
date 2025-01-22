dedoublet <- function(sample, rate=NULL){
if(nrow(sample@meta.data) < 500){
    return(sample)
}else{
sample_raw <- sample
# load required libraries
library(DoubletFinder)
library(tidyverse)
library(Seurat)
library(patchwork)

# preprocessing
sample <- NormalizeData(sample)
sample <- FindVariableFeatures(sample, verbose = F)
sample = ScaleData(sample, verbose = F)
sample <- RunPCA(sample, verbose = F)
pc.num = 1:30
sample <- RunUMAP(sample, dims = pc.num)
sample <- FindNeighbors(sample, dims = pc.num) %>% FindClusters(resolution = 0.5)
    
# search for best pK value
pc.num=1:30
sweep.res.list <- paramSweep_v3(sample, PCs =pc.num, sct = F)
sweep.stats <- summarizeSweep(sweep.res.list, GT = FALSE)  
bcmvn <- find.pK(sweep.stats)
pK_bcmvn <- bcmvn$pK[which.max(bcmvn$BCmetric)] %>% as.character() %>% as.numeric()

# exclude homologous doublets and optimize the expected number of doublets
if (!is.null(rate)) {
    DoubletRate <- rate
} else {
    index <- as.character(floor(nrow(sample@meta.data)/500))
    index <- if(index > 20) 20 else index
    DoubletRate <- switch(index, '0'={0.002}, '1'={0.004}, '2'={0.008}, '3'={0.012}, '4'={0.016}, '5'={0.019}, '6'={0.023}, '7'={0.027}, '8'={0.031}, '9'={0.035}, '10'={0.039}, '11'={0.042}, '12'={0.046}, '13'={0.050}, '14'={0.054}, '15'={0.057}, '16'={0.061}, '17'={0.065}, '18'={0.069}, '19'={0.072}, '20'={0.076})
}

homotypic.prop <- modelHomotypic(sample$seurat_clusters) 
nExp_poi <- round(DoubletRate*ncol(sample)) 
nExp_poi.adj <- round(nExp_poi*(1-homotypic.prop))

# identify doublets using defined parameters
sample <- doubletFinder_v3(sample, PCs = pc.num, pN = 0.25, pK = pK_bcmvn, nExp = nExp_poi.adj, reuse.pANN = F, sct = F)
DF.name = colnames(sample@meta.data)[grepl("DF.classification", colnames(sample@meta.data))]
sample <- subset(sample_raw, cells = colnames(sample)[sample@meta.data[, DF.name] == "Singlet"])

return(sample)
}
}