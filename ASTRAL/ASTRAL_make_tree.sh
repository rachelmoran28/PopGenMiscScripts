#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=62gb
#SBATCH -t 48:00:00
#SBATCH -J astral
#SBATCH --out astral.out
#SBATCH --err astral.err


#Step 1: Generate a tree for each gene and save in newick format
#Step 2: Concantenate all newick trees (one line per tree; in exmaple below this file is called AllTreesCombined.treefile)
#Step 3: Run ASTRAL 

module load Java/16.0.1

#java -D"java.library.path=AstralMP/lib/" -jar AstralMP/astral.5.15.5.jar -i all_genes.tre -t 3 -T 24 -o ASTRALMP_tree_out
java -D"java.library.path=Astral/lib/" -jar Astral/astral.5.7.8.jar -i poster_genes.tre -t 3 -o ASTRAL_tree_out
