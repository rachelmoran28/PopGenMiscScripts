#!/bin/bash
#PBS -q mangi
#PBS -l walltime=48:00:00,nodes=1:ppn=4,mem=62gb
#PBS -N fvecSimVCF
#PBS -k oe


#generating feature vector stats
cd /home/mcgaughs/shared/Software/diploSHIC

#vcf="/home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/biallelicSNPs_wInvar_noIndels_phased_masked_ExcludeHet/MAF01/Concat_HardFilt_246Indv_biSNPs_wInvar_noIndels3bpBuffer.AllRepsRemoved.Phased.ExcludeHet.MAF01.Miss02.FIXED.vcf.gz"

#python diploSHIC.py fvecVcf diploid $vcf NW_019170535.1 26953843 $vcf.diploid.fvec --targetPop Molino --sampleToPopFileName PopFile.txt --winSize 1100000 --numSubWins 11 --maskFileName GCA_000372685.2_Astyanax_mexicanus-2.0_genomic.HardMasked.WM.RM.fa.gz
#vcf="/panfs/roc/groups/14/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/combined_filtered/246Indvs_RepsMasked/phased_masked/biallelicSNPs_wInvar_noIndels_phased_masked_ExcludeHet/Chr_11_HardFiltered_246Indv_biallelicSNPs_wInvar_noIndels_rmv0.4missing.RepsRemoved.phased.masked.ExcludeHet.vcf.gz"

#python diploSHIC.py fvecVcf diploid $vcf NW_019170545.1 11650534 $vcf.diploid.fvec --targetPop Molino --sampleToPopFileName PopFile.txt --winSize 1100000 --numSubWins 11 --unmaskedFracCutoff 0.01 --maskFileName GCA_000372685.2_Astyanax_mexicanus-2.0_genomic.HardMasked.WM.RM.fa.gz

python diploSHIC_edited2.py predict cavefishModel.json cavefishModel.weights.hdf5 ./rawFVFiles/Chica1/Chr6_tail120.fvec ./Predictions/Chica1/Chr6.tail120.preds
