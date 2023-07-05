#!/bin/bash
#SBATCH -p small,amdsmall,astyanax,cavefish,ram256g,ram1t,amd2tb,amdlarge,large
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=60gb
#SBATCH -t 5:00:00
#SBATCH -J twisst
#SBATCH --array=1-7


cd /home/mcgaughs/shared/Software/twisst 


CMD_LIST="run_twisst_commnads_7.txt"
CMD="$(sed "${SLURM_ARRAY_TASK_ID}q;d" ${CMD_LIST})"
eval ${CMD}
