#!/bin/bash
#SBATCH -p ram256g,ram1t,amd2tb,amdlarge
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=200gb
#SBATCH -t 24:00:00
#SBATCH -J fvecVCF
#SBATCH -e Mante..redo.fvecVCF.err
#SBATCH -o Mante..redo.fvecVCF.out
#SBATCH --array=1367,1588


source /home/mcgaughs/rmoran/miniconda3/etc/profile.d/conda.sh
conda activate diplo

#generating feature vector stats
cd /home/mcgaughs/shared/Software/diploSHIC

#vcf="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/Split_All_Scafolds_VCFs"

#vcf="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/biallelicSNPs_wInvar_noIndels_phased_masked_ExcludeHet"


#HardFiltered SNPs
#vcf="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/filtered_snps/HardFilteredSNPs_250Samples"
vcf="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/250_samples"

Pop="Mante"

CMD_LIST="HardFiltered_All_wInvar_Commands_fvecVCF_5kb.txt"
#CMD_LIST="HardFiltered_All_wInvar_Commands_82_SCAFS_W_DATS_fvecVCF.txt"
#CMD_LIST="HardFiltered_All_Commands_fvecVCF.txt"

CMD="$(sed "${SLURM_ARRAY_TASK_ID}q;d" ${CMD_LIST})"
eval ${CMD}

