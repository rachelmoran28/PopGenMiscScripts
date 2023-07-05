#!/bin/bash
#PBS -l mem=62gb,nodes=1:ppn=24,walltime=10:00:00
#PBS -m abe
#PBS -M rmoran@umn.edu
#PBS -q mangi
#PBS -N run_treemix_rootAeneus

cd /home/mcgaughs/rmoran/cavefish/treemix

src=/home/mcgaughs/shared/Software/treemix-1.13/bin
input=/home/mcgaughs/rmoran/cavefish/treemix/HardFiltered_250Indv_SurfaceRef_biallelicSNPS_rmv0.4missing_thinned50kb.renamechr.ChrOnly.Am_Ag.tmix.gz


$src/treemix -i $input -m 10 -o m10_AeneusRoot -root Aeneus  -k 500


#for i in {0..5}
#do
#    $src/treemix -i $input -m $i -o Chr1-2.$i -root White_Long_Fin -bootstrap -k 500
#done 
