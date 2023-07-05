#!/bin/bash
#SBATCH -p small,amdsmall
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=62gb
#SBATCH -t 1:00:00
#SBATCH -J run_treemix

cd /home/mcgaughs/rmoran/cavefish/treemix

src=/home/mcgaughs/shared/Software/treemix-1.13/bin
#input=/home/mcgaughs/rmoran/cavefish/treemix/Chica_subset2_samples_SNPs_thin1kb.RenamedChrOnly.tmix.gz
input="Subter_subset.tmix.gz"

$src/treemix -i $input -o Subter_subset_ML -root Aeneus -k 500
#-root Aeneus

for M in {1..15}
do
    $src/treemix -i $input -m ${M} -o m${M}_Subter_subset -root Aeneus -k 500 
done
