#!/usr/bin/env bash

# pathways in cluster:
DATADIRECTORY_ITS=/scratch_vol1/fungi/Jaunet/05_QIIME2/ITS/
DATADIRECTORY_16S=/scratch_vol1/fungi/Jaunet/05_QIIME2/16S/

METADATA_ITS=/scratch_vol1/fungi/Jaunet/98_database_files/ITS/
METADATA_16S=/scratch_vol1/fungi/Jaunet/98_database_files/16S/

# pathways in local:
#DATADIRECTORY_ITS=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/19_Jaunet/Jaunet/05_QIIME2/ITS/
#DATADIRECTORY_16S=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/19_Jaunet/Jaunet/05_QIIME2/16S/

#METADATA_ITS=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/19_Jaunet/Jaunet/98_database_files/ITS/
#METADATA_16S=/Users/pierre-louisstenger/Documents/PostDoc_02_MetaBarcoding_IAC/02_Data/19_Jaunet/Jaunet/98_database_files/16S/


###############################################################
### For Fungi
###############################################################

cd $DATADIRECTORY_ITS

eval "$(conda shell.bash hook)"
conda activate qiime2-2021.4

# Aim: Filter sample from table based on a feature table or metadata

qiime feature-table filter-samples \
        --i-table core/RarTable.qza \
        --m-metadata-file $METADATA_ITS/sample-metadata.tsv \
        --p-where "[#SampleID] IN ('B1-P-0-T11', 'B1-P-0-T3', 'B1-P-0-T8', 'B1-PC-0-T11', 'B1-PC-0-T3', 'B1-PC-0-T8', 'B1-PC-D1-T11', 'B1-PC-D1-T3', 'B1-PC-D1-T8', 'B1-PC-D2-T11', 'B1-PC-D2-T3', 'B1-PC-D2-T8', 'B1-PC-FM-T11', 'B1-PC-FM-T3', 'B1-PC-FM-T8', 'B1-P-D1-T11', 'B1-P-D1-T3', 'B1-P-D1-T8', 'B1-P-D2-T11', 'B1-P-D2-T3', 'B1-P-D2-T8', 'B1-P-FM-T11', 'B1-P-FM-T3', 'B1-P-FM-T8', 'B2-P-0-T11', 'B2-P-0-T3', 'B2-P-0-T8', 'B2-PC-0-T11', 'B2-PC-0-T3', 'B2-PC-0-T8', 'B2-PC-D1-T11', 'B2-PC-D1-T3', 'B2-PC-D1-T8', 'B2-PC-D2-T11', 'B2-PC-D2-T3', 'B2-PC-D2-T8', 'B2-PC-FM-T11', 'B2-PC-FM-T3', 'B2-PC-FM-T8', 'B2-P-D1-T11', 'B2-P-D1-T3', 'B2-P-D1-T8', 'B2-P-D2-T11', 'B2-P-D2-T3', 'B2-P-D2-T8', 'B2-P-FM-T11', 'B2-P-FM-T3', 'B2-P-FM-T8', 'B3-P-0-T11', 'B3-P-0-T3', 'B3-P-0-T8', 'B3-PC-0-T11', 'B3-PC-0-T3', 'B3-PC-0-T8', 'B3-PC-D1-T11', 'B3-PC-D1-T3', 'B3-PC-D1-T8', 'B3-PC-D2-T11', 'B3-PC-D2-T3', 'B3-PC-D2-T8', 'B3-PC-FM-T11', 'B3-PC-FM-T3', 'B3-PC-FM-T8', 'B3-P-D1-T11', 'B3-P-D1-T3', 'B3-P-D1-T8', 'B3-P-D2-T11', 'B3-P-D2-T3', 'B3-P-D2-T8', 'B3-P-FM-T11', 'B3-P-FM-T3', 'B3-P-FM-T8')"  \
        --o-filtered-table core/RarTable-all.qza

        
# Aim: Identify "core" features, which are features observed,
     # in a user-defined fraction of the samples

        
qiime feature-table core-features \
        --i-table core/RarTable-all.qza \
        --p-min-fraction 0.1 \
        --p-max-fraction 1.0 \
        --p-steps 10 \
        --o-visualization visual/CoreBiom-all.qzv  

qiime tools export --input-path core/RarTable-all.qza --output-path export/core/RarTable-all    
        
#qiime tools export --input-path visual/CoreBiomAll.qzv --output-path export/visual/CoreBiomAll
qiime tools export --input-path visual/CoreBiom-all.qzv --output-path export/visual/CoreBiom-all



###### Biom convert

# Aim: Convert to/from the BIOM table format

biom convert -i export/core/RarTable-all/feature-table.biom -o export/core/RarTable-all/table-from-biom.tsv --to-tsv

 # Aim: Remove first line and rename '#OTU ID' into 'ASV'

 sed '1d ; s/\#OTU ID/ASV_ID/' export/core/RarTable-all/table-from-biom.tsv > export/core/RarTable-all/ASV.tsv


###############################################################
### For Bacteria
###############################################################

cd $DATADIRECTORY_16S

eval "$(conda shell.bash hook)"
conda activate qiime2-2021.4

# Aim: Filter sample from table based on a feature table or metadata

 qiime feature-table filter-samples \
        --i-table core/RarTable.qza \
        --m-metadata-file $METADATA_ITS/sample-metadata.tsv \
        --p-where "[#SampleID] IN ('B1-P-0-T11', 'B1-P-0-T3', 'B1-P-0-T8', 'B1-PC-0-T11', 'B1-PC-0-T3', 'B1-PC-0-T8', 'B1-PC-D1-T11', 'B1-PC-D1-T3', 'B1-PC-D1-T8', 'B1-PC-D2-T11', 'B1-PC-D2-T3', 'B1-PC-D2-T8', 'B1-PC-FM-T11', 'B1-PC-FM-T3', 'B1-PC-FM-T8', 'B1-P-D1-T11', 'B1-P-D1-T3', 'B1-P-D1-T8', 'B1-P-D2-T11', 'B1-P-D2-T3', 'B1-P-D2-T8', 'B1-P-FM-T11', 'B1-P-FM-T3', 'B1-P-FM-T8', 'B2-P-0-T11', 'B2-P-0-T3', 'B2-P-0-T8', 'B2-PC-0-T11', 'B2-PC-0-T3', 'B2-PC-0-T8', 'B2-PC-D1-T11', 'B2-PC-D1-T3', 'B2-PC-D1-T8', 'B2-PC-D2-T11', 'B2-PC-D2-T3', 'B2-PC-D2-T8', 'B2-PC-FM-T11', 'B2-PC-FM-T3', 'B2-PC-FM-T8', 'B2-P-D1-T11', 'B2-P-D1-T3', 'B2-P-D1-T8', 'B2-P-D2-T11', 'B2-P-D2-T3', 'B2-P-D2-T8', 'B2-P-FM-T11', 'B2-P-FM-T3', 'B2-P-FM-T8', 'B3-P-0-T11', 'B3-P-0-T3', 'B3-P-0-T8', 'B3-PC-0-T11', 'B3-PC-0-T3', 'B3-PC-0-T8', 'B3-PC-D1-T11', 'B3-PC-D1-T3', 'B3-PC-D1-T8', 'B3-PC-D2-T11', 'B3-PC-D2-T3', 'B3-PC-D2-T8', 'B3-PC-FM-T11', 'B3-PC-FM-T3', 'B3-PC-FM-T8', 'B3-P-D1-T11', 'B3-P-D1-T3', 'B3-P-D1-T8', 'B3-P-D2-T11', 'B3-P-D2-T3', 'B3-P-D2-T8', 'B3-P-FM-T11', 'B3-P-FM-T3', 'B3-P-FM-T8')"  \
        --o-filtered-table core/RarTable-all.qza
           
           
# Aim: Identify "core" features, which are features observed,
     # in a user-defined fraction of the samples

qiime feature-table core-features \
        --i-table core/RarTable-all.qza \
        --p-min-fraction 0.1 \
        --p-max-fraction 1.0 \
        --p-steps 10 \
        --o-visualization visual/CoreBiom-all.qzv
        
qiime tools export --input-path core/RarTable-all.qza --output-path export/core/RarTable-all    
        
#qiime tools export --input-path visual/CoreBiomAll.qzv --output-path export/visual/CoreBiomAll
qiime tools export --input-path visual/CoreBiom-all.qzv --output-path export/visual/CoreBiom-all


###### Biom convert

# Aim: Convert to/from the BIOM table format

biom convert -i export/core/RarTable-all/feature-table.biom -o export/core/RarTable-all/table-from-biom.tsv --to-tsv

 # Aim: Remove first line and rename '#OTU ID' into 'ASV'
 
 sed '1d ; s/\#OTU ID/ASV_ID/' export/subtables/RarTable-all/table-from-biom.tsv > export/subtables/RarTable-all/ASV.tsv
