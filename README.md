##  scCADpipe - Data processing pipeline for exploring single cell gene expression dynamics in coronary artery disease (CAD).
Here we provide the entire processing pipeline for reproducing the results in the manuscript. Single-cell transcriptomic analysis revealed four endothelial cell (EC) subclusters in both CAD patients and controls, with notable alterations in a specific subcluster in CAD. This subpopulation was significantly reduced in severe CAD cases and exhibited distinct functional properties, including involvement in inflammatory responses and metabolic processes. These findings highlight the heterogeneity of endothelial cells and their differential roles in CAD progression.

### Execution requirements
- [R (recommend >=4.2)](https://cran.r-project.org/)
- [Python (recommend >=3.9)](https://www.python.org/)
- [Jupyter Notebook (Optional but recommend) ](https://jupyter.org/)
- Other packages (see session info at the end of each notebook)

### Pipelines and data
- #### scRNA-seq data preprocessing
1. Quality control and clustering of each sample: [DCM1](https://github.com/ventson/scCADpipe/blob/main/1_Preprocessing/DCM1.ipynb), [DCM2](https://github.com/ventson/scCADpipe/blob/main/1_Preprocessing/DCM2.ipynb), [DCM3](https://github.com/ventson/scCADpipe/blob/main/1_Preprocessing/DCM3.ipynb), [CAD1](https://github.com/ventson/scCADpipe/blob/main/1_Preprocessing/CAD1.ipynb), [CAD2](https://github.com/ventson/scCADpipe/blob/main/1_Preprocessing/CAD2.ipynb), [CAD3](https://github.com/ventson/scCADpipe/blob/main/1_Preprocessing/CAD3.ipynb) | [Source data](https://bis.zju.edu.cn/hscTE/download/TE_landscape.tar.gz)
- #### Intra-group integration and annotation
1. Control group integration: [DCM](https://github.com/ventson/scCADpipe/blob/main/2_Integration_and_Annotation/DCM_integration_annotation.ipynb) | [Source data](https://bis.zju.edu.cn/hscTE/download/human_data_processing/1_EHT_RNA_Preprocessing.tar.gz)
2. Patient group integration: [CAD](https://github.com/ventson/scCADpipe/blob/main/2_Integration_and_Annotation/CAD_integration_annotation.ipynb) | [Source data](https://bis.zju.edu.cn/hscTE/download/human_data_processing/2_EHT_Trajectory_Reconstruction.tar.gz)
- #### Inter-group integration
1. Control and patient samples integration: [DCM & CAD](https://github.com/ventson/scCADpipe/blob/main/3_DCM_CAD_Integration/DCM_CAD_integration.ipynb) | [Source data](https://bis.zju.edu.cn/hscTE/download/human_data_processing/4_EHT_TE_hdWGCNA.tar.gz)
- #### EC subcluster analysis
1. Re-clustering and annotation of EC: [DCM_EC](https://github.com/ventson/scCADpipe/blob/main/4_EC_Subcluster/EC_subcluster_DCM.ipynb), [CAD_EC](https://github.com/ventson/scCADpipe/blob/main/4_EC_Subcluster/EC_subcluster_CAD.ipynb) | [Source data](https://bis.zju.edu.cn/hscTE/download/TE_landscape.tar.gz)
2. RNA velocity of DCM EC: [DCM_EC_velo](https://github.com/ventson/scCADpipe/blob/main/4_EC_Subcluster/EC_subcluster_velocity_DCM.ipynb) | [Source data](https://bis.zju.edu.cn/hscTE/download/TE_landscape.tar.gz)
3. Map EC from CAD to DCM: [EC_ref_map](https://github.com/ventson/scCADpipe/blob/main/4_EC_Subcluster/EC_subcluster_ref_map.ipynb) | [Source data](https://bis.zju.edu.cn/hscTE/download/TE_landscape.tar.gz)
4. Merge EC subclusters: [DCM_CAD_EC](https://github.com/ventson/scCADpipe/blob/main/4_EC_Subcluster/EC_subcluster_DCM_CAD_merge.ipynb) | [Source data](https://bis.zju.edu.cn/hscTE/download/TE_landscape.tar.gz)
- #### Bulk RNA-seq of HT1080
1. Differential expression and enrichment analysis: [Bulk_HT1080](https://github.com/ventson/scCADpipe/blob/main/5_Bulk_RNA_HT1080/HT1080_DEG_DESeq2.ipynb) | [Source data](https://bis.zju.edu.cn/hscTE/download/TE_landscape.tar.gz)
