#!/bin/bash
#PBS -q mangi
#PBS -l mem=62gb,walltime=6:00:00,nodes=1:ppn=2
#PBS -N rename
#PBS -k oe
#PBS -M rmoran@umn.edu 
#PBS -m abe 

cd /home/mcgaughs/shared/Datasets/all_sites_LARGE_vcfs/filtered_surfacefish/filtered_snps

cat HardFiltered_250Indv_SurfaceRef_biallelicSNPS_rmv0.4missing.Am_Ag.vcf | sed -f Rename_Chr.sed > HardFiltered_250Indv_SurfaceRef_biallelicSNPS_rmv0.4missing.Am_Ag.renamechr.vcf

cat HardFiltered_250Indv_SurfaceRef_biallelicSNPS_rmv0.4missing.Am_Ag.renamechr.vcf | grep -v NW_ >  HardFiltered_250Indv_SurfaceRef_biallelicSNPS_rmv0.4missin\
g.Am_Ag.renamechr.ChrOnly.vcf
