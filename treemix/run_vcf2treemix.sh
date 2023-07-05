#!/bin/bash
#SBATCH -p small,amdsmall
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=62gb
#SBATCH -t 12:00:00
#SBATCH -J vcf2treemix 

cd /home/mcgaughs/rmoran/cavefish/treemix

VCF="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/filtered_snps/SNPs_filtered_PASS_concat_267indvds_thinned1kb.vcf"

#VCF="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/filtered_snps/thinned/HardFiltered_250Indv_SurfaceRef_biallelicSNPS_rmv0.4missing_thinned1kbp.recode.Am_Ag.RepRemoved.recode.vcf"

#src=/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/biallelicSNPs_wInvar_noIndels_phased_masked_ExcludeHet/MAF01

#Chica_subset2_samples_SNPs_thin1kb.RenamedChrOnly.vcf
#VCF="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/biallelicSNPs_wInvar_noIndels_phased_masked_ExcludeHet/MAF01/"

./vcf2treemix.py -vcf ${VCF} -pop Pop_file_Subter_subset_nicara.txt

#PopFile_Subset3.txt

#-pop pop_file.Am_Ag.txt

mv /home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/filtered_snps/*.tmix .


