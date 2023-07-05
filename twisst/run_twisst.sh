#!/bin/bash
#PBS -l mem=62gb,nodes=1:ppn=4,walltime=10:00:00
#PBS -m abe
#PBS -M rmoran@umn.edu
#PBS -q cavefish
#PBS -N twisst_chr1


cd /home/mcgaughs/shared/Software/twisst 

for i in Chr_{2..25}
do
    python twisst.py -t ${i}.output.phyml_bionj.w50.trees.gz -w ${i}.CM.weights.w50.csv.gz --outputTopos ${i}.CM.topos -g CabMoroSurface -g CabMoroCaveEyed -g CabMoroCave -g Japlin -g Chica --method complete --groupsFile testGroups.txt
done
