#!/bin/bash
#SBATCH -p small,amdsmall
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=60gb
#SBATCH -t 12:00:00
#SBATCH -J discoal

#generating feature vector stats
cd /home/mcgaughs/shared/Software/diploSHIC

#python diploSHIC.py makeTrainingSets rawFVFiles/Neut.msOut.gz.diploid.fvec rawFVFiles/Soft rawFVFiles/Hard 5 0,1,2,3,4,6,7,8,9,10 trainingSets/

#python diploSHIC.py makeTrainingSets rawFVFiles_Pachon_model/Neut.msOut.gz.diploid.fvec rawFVFiles_Pachon_model/Soft rawFVFiles_Pachon_model/Hard 5 0,1,2,3,4,6,7,8,9,10 trainingSets_Pachon_model/                                                                

python diploSHIC.py makeTrainingSets rawFVFiles_Pachon_train/Neut.msOut.gz.diploid.fvec rawFVFiles_Pachon_train/Soft rawFVFiles_Pachon_train/Hard 5 0,1,2,3,4,6,7,8,9,10 trainingSets_Pachon/           

python diploSHIC.py makeTrainingSets rawFVFiles_Surface_train/Neut.msOut.gz.diploid.fvec rawFVFiles_Surface_train/Soft rawFVFiles_Surface_train/Hard 5 0,1,2,3,4,6,7,8,9,10 trainingSets_Surface/                                                                
                                                     
 
