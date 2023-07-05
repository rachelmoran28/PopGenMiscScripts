#!/bin/bash                                                                                                                                                                            ##SBATCH -p cavefish,small,amdsmall
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=50gb
#SBATCH -t 2:00:00
#SBATCH -J dsuite


cd /home/mcgaughs/rmoran/software/Dsuite/Build


#inpt="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/biallelicSNPs_wInvar_noIndels_phased_masked_ExcludeHet/MAF01/Chica_subset2_samples_SNPs_thin1kb.RenamedChrOnly.vcf"

#inpt="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/filtered_snps/thinned/HardFiltered_250Indv_SurfaceRef_biallelicSNPS_rmv0.4missing_thinned1kbp.recode.Am_Ag.RepRemoved.recode.vcf"

inpt="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/filtered_snps/SNPs_filtered_PASS_concat_267indvds_thinned1kb.vcf"

#inpt="Concat_HardFilt_246Indv_biSNPs_wInvar_noIndels3bpBuffer.AllRepsRemoved.Phased.ExcludeHet.MAF01.Miss02.vcf_FIXED.gz"
#inpt="FullSet_biallelicSNPs_thin1kb.recode.vcf"

./Dsuite Dtrios $inpt Subter_PopGroups_Nicara.txt --out-prefix=SUBTER_NicaraOG
