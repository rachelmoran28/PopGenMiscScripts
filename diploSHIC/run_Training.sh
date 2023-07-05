#!/bin/bash
#SBATCH -p small,amdsmall,cavefish,astyanax
#SBATCH --nodes=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=62gb
#SBATCH -t 3:00:00
#SBATCH -J training

source /home/mcgaughs/rmoran/miniconda3/etc/profile.d/conda.sh
conda activate diplo

#generating feature vector stats
cd /home/mcgaughs/shared/Software/diploSHIC


#python diploSHIC_edited.py train trainingSets/ trainingSets/ bfsModel2

#working model
#python diploSHIC_edited_valacc.py train trainingSets/ trainingSets/ bfsModelTest2

#best cave model
#python diploSHIC_edited_valacc.py train trainingSets_Pachon/ trainingSets_Pachon/ PachonModel_3popsizechanges
python diploSHIC_edited_valacc.py train trainingSets_Surface/ trainingSets_Surface/ SurfaceModel_3popsizechanges               
