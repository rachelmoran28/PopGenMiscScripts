#!/bin/bash
#SBATCH -p cavefish
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=62gb
#SBATCH -t 1:00:00
#SBATCH -J twisst_chr3


cd /home/mcgaughs/shared/Software/twisst 

python twisst.py -t Chr3_NL_OL_subset.output.phyml_bionj.w50.trees.gz -w Chr3.NL_OL.weights.w50.csv.gz --outputTopos Chr3.NL_OL.topos -g Molino -g Mante -g Rascon -g Pachon -g Tinaja --method complete --groupsFile NL_OL_sample_pop_list_MEcombined.txt
