#!/bin/bash
#SBATCH -p small,amdsmall
#SBATCH --nodes=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=62gb
#SBATCH -t 96:00:00
#SBATCH -J SVDQuartets


#This is just a variable called "PAUP" that gives the location of the PAUP software - change to where your install of PAUP is located:
PAUP="/home/mcgaughs/shared/Software/paup"

${PAUP} -n ~/cavefish/PAUP/run_no_arroyo.nex







