#!/bin/bash
#PBS -l walltime=24:00:00,nodes=1:ppn=12
#PBS -m abe
#PBS -M rmoran@umn.edu
#PBS -q mangi
#PBS -N dsuite
#PBS -j oe


cd /home/mcgaughs/rmoran/software/Dsuite/Build


#inpt="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/biallelicSNPs_wInvar_noIndels_phased_masked_ExcludeHet/MAF01/Chica_subset2_samples_SNPs_thin1kb.RenamedChrOnly.vcf"


#inpt="Concat_HardFilt_246Indv_biSNPs_wInvar_noIndels3bpBuffer.AllRepsRemoved.Phased.ExcludeHet.MAF01.Miss02.vcf_FIXED.gz"
inpt="FullSet_biallelicSNPs_thin1kb.recode.vcf"
./Dsuite Dtrios $inpt Subset3_PopGroups_NoHybs.txt
