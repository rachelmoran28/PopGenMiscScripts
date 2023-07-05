#!/bin/bash
#SBATCH -p  cavefish
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=62gb
#SBATCH -t 2:00:00
#SBATCH -J fvecVCF
#SBATCH -e Choy.oca2.fvecVCF.err
#SBATCH -o Choy.oca2.fvecVCF.out



source /home/mcgaughs/rmoran/miniconda3/etc/profile.d/conda.sh
conda activate diplo

#generating feature vector stats
cd /home/mcgaughs/shared/Software/diploSHIC

#vcf="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/Split_All_Scafolds_VCFs"

#vcf="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/biallelicSNPs_wInvar_noIndels_phased_masked_ExcludeHet"


#HardFiltered SNPs
#vcf="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/filtered_snps/HardFilteredSNPs_250Samples"
vcf="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/250_samples"

Pop="Choy"

python diploSHIC.py fvecVcf diploid  $vcf/Chr_13_HardFiltered_250Indv_SurfaceRef_wInvar.vcf.gz NW_019170547.1 44161018 ./rawFVFiles/${Pop}/NW_019170547.1_${Pop}.HardFiltered.fvec --targetPop ${Pop} --sampleToPopFileName PopFile.txt --winSize 1100000 --numSubWins 11 --unmaskedFracCutoff 0.001 --unmaskedGenoFracCutoff 0.1 --maskFileName GCA_000372685.2_Astyanax_mexicanus-2.0_genomic.HardMasked.WM.RM.fa.gz

