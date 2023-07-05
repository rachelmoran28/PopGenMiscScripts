#!/bin/bash
#PBS -q cavefish
#PBS -l walltime=200:00:00,nodes=1:ppn=1
#PBS -N discoal
#PBS -k oe

#generating training data
cd /home/mcgaughs/shared/Software/diploSHIC
discoal="/home/mcgaughs/shared/Software/discoal/discoal"

#$discoal 100 2000 55000 -Pt 28.000000 280.000000 -Pre 770.000000 2310.000000 > train/Neut.msOut
i=0
for x in 0.045454545454545456 0.13636363636363635 0.22727272727272727 0.3181818181818182 0.4090909090909091 0.5 0.5909090909090909 0.6818181818181818 0.7727272727272727 0.8636363636363636 0.9545454545454546;
do
    $discoal 100 2000 55000 -Pt 28.000000 280.000000 -Pre 770.000000 2310.000000 -ws 0 -Pa 40.000000 2000.000000 -Pu 0 0.050000 -x $x > train/Hard_$i.msOut
    $discoal 100 2000 55000 -Pt 28.000000 280.000000 -Pre 770.000000 2310.000000 -ws 0 -Pa 40.000000 2000.000000 -Pu 0 0.050000 -Pf 0 0.100000 -x $x > train/Soft_$i.msOut
    i=$((i + 1))
done


#generating test data

$discoal 100 1000 55000 -Pt 28.000000 280.000000 -Pre 770.000000 2310.000000 > test/Neut.msOut
i=0
for x in 0.045454545454545456 0.13636363636363635 0.22727272727272727 0.3181818181818182 0.4090909090909091 0.5 0.5909090909090909 0.6818181818181818 0.7727272727272727 0.8636363636363636 0.9545454545454546;
do
    $discoal 100 1000 55000 -Pt 28.000000 280.000000 -Pre 770.000000 2310.000000 -ws 0 -Pa 40.000000 2000.000000 -Pu 0 0.050000 -x $x > test/Hard_$i.msOut
    $discoal 100 1000 55000 -Pt 28.000000 280.000000 -Pre 770.000000 2310.000000 -ws 0 -Pa 40.000000 2000.000000 -Pu 0 0.050000 -Pf 0 0.100000 -x $x > test/Soft_$i.msOut
    i=$((i + 1))
done

