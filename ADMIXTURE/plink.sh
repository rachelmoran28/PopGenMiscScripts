#!/bin/bash
#PBS -q mangi
#PBS -l mem=62gb,walltime=36:00:00,nodes=1:ppn=4
#PBS -N plink
#PBS -k oe
#PBS -M rmoran@umn.edu 
#PBS -m abe 

module load plink

#plnk=/panfs/roc/msisoft/plink/1.90b6.10/bin

cd /home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/filtered_snps/thinned

plink --vcf HardFiltered_250Indv_SurfaceRef_biallelicSNPS_rmv0.4missing_thinned50kb.renamechr.ChrOnly.RepRemoved.AmAg.vcf --make-bed --out HardFiltered_250Indv_SurfaceRef_biallelicSNPS_rmv0.4missing_thinned50kb.renamechr.ChrOnly.RepRemoved.AmAg --double-id --allow-extra-chr --geno 0.1

