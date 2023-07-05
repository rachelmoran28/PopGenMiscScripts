#!/bin/bash
#SBATCH -p amdsmall,small
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=62gb
#SBATCH -t 01:00:00
#SBATCH -J Choy5kb.Pred
#SBATCH --array=1-803


source /home/mcgaughs/rmoran/miniconda3/etc/profile.d/conda.sh
conda activate diplo

#generating feature vector stats
cd /home/mcgaughs/shared/Software/diploSHIC

Pop="Tinaja"

CMD_LIST="803_5kb_Predict_Commnads_CaveModel.txt"
#"redo_5_chrs_predictions.txt"
#"Choy_scafs_w_data_predictions.txt"
#HardFiltered_Chr_Commands_Predictions_diploEnv.txt
#"Predictions_Commands.txt"

CMD="$(sed "${SLURM_ARRAY_TASK_ID}q;d" ${CMD_LIST})"
eval ${CMD}
