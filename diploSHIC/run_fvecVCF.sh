#!/bin/bash
#PBS -q cavefish
#PBS -l walltime=2:00:00,nodes=1:ppn=1,mem=62gb
#PBS -N fvecSimVCF
#PBS -k oe


#generating feature vector stats
cd /home/mcgaughs/shared/Software/diploSHIC

#vcf="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/biallelicSNPs_wInvar_noIndels_phased_masked_ExcludeHet/MAF01/Concat_HardFilt_246Indv_biSNPs_wInvar_noIndels3bpBuffer.AllRepsRemoved.Phased.ExcludeHet.MAF01.Miss02.FIXED.vcf.gz"

#python diploSHIC.py fvecVcf diploid $vcf NW_019170535.1 26953843 $vcf.diploid.fvec --targetPop Molino --sampleToPopFileName PopFile.txt --winSize 1100000 --numSubWins 11 --maskFileName GCA_000372685.2_Astyanax_mexicanus-2.0_genomic.HardMasked.WM.RM.fa.gz

#vcf="/panfs/roc/groups/14/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/biallelicSNPs_wInvar_noIndels_phased_masked_ExcludeHet/Chr_1_HardFiltered_246Indv_biallelicSNPs_wInvar_noIndels_rmv0.4missing.RepsRemoved.phased.masked.ExcludeHet.vcf.gz"


#python diploSHIC.py fvecVcf diploid $vcf NW_019170535.1 26953843 ./rawFVFiles/Chr1_Pachon.big.diploid.fvec --targetPop Pachon --sampleToPopFileName PopFile.txt --winSize 1100000 --numSubWins 11 --unmaskedFracCutoff 0.01 --maskFileName GCA_000372685.2_Astyanax_mexicanus-2.0_genomic.HardMasked.WM.RM.fa.gz 


#vcf="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/Split_All_Scafolds_VCFs"
vcf="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/biallelicSNPs_wInvar_noIndels_phased_masked_ExcludeHet"
Pop="Chica1"

python diploSHIC.py fvecVcf diploid  $vcf/Chr_6_HardFiltered_246Indv_biallelicSNPs_wInvar_noIndels_rmv0.4missing.RepsRemoved.phased.masked.ExcludeHet.vcf.gz NW_019170540.1 52532229 ./rawFVFiles/${Pop}/Chr6_${Pop}.big.diploid.fvec --targetPop ${Pop} --sampleToPopFileName ChicaPopFile.txt --winSize 1100000 --numSubWins 11 --unmaskedFracCutoff 0.001 --unmaskedGenoFracCutoff 0.1 --maskFileName GCA_000372685.2_Astyanax_mexicanus-2.0_genomic.HardMasked.WM.RM.fa.gz
#--unmaskedFracCutoff 0.001 --unmaskedGenoFracCutoff 0.1
