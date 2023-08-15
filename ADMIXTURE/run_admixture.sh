#!/bin/bash
#PBS -q cavefish
#PBS -l mem=62gb,walltime=6:00:00,nodes=1:ppn=8
#PBS -N admixture_allchr
#PBS -k oe
#PBS -M rmoran@umn.edu 
#PBS -m abe 



#plnk=/panfs/roc/msisoft/plink/1.90b6.10/bin

cd /home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/raw_surfacefish/all_sites

src=/home/mcgaughs/shared/Software/admixture_linux-1.3.0
#inpt="HardFiltered_250Indv_SurfaceRef_biallelicSNPS_rmv0.4missing_thinned50kb.renamechr.ChrOnly.RepRemoved.AmAg.bed"
inpt="Chica_subset6pops_SNPs_thin1kb_ADMIXTURE.bed"


#for K in {1..8};
#do
#    $src/admixture -j12 $inpt $K 
#done


for K in {2..9};
do 
    $src/admixture --cv -j8 $inpt $K | tee log_subset6pops_${K}.out
done

#$src/admixture -j12 $inpt 2
#$src/admixture -j12 $inpt 3
#$src/admixture -j12 $inpt 4
#$src/admixture -j12 $inpt 5
#$src/admixture -j12 $inpt 6
#$src/admixture -j12 $inpt 7
#$src/admixture -j12 $inpt 8
#$src/admixture -j12 $inpt 9
#$src/admixture -j12 $inpt 10
#$src/admixture -j12 $inpt 11
#$src/admixture -j12 $inpt 12
#$src/admixture -j12 $inpt 13
#$src/admixture -j12 $inpt 14
#$src/admixture -j12 $inpt 15


















