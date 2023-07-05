#DiploSHIC Notes (using diploshic version downloaded Nov 17 2020)
#################
Ran train and predict with  Python 3.7.3, keras 2.3.1, and tensorflow 1.13.1.

Had to make two small edits to the diploSHIC.py script.

First, I got this error with the train step:
/home/mcgaughs/rmoran/miniconda3/envs/diplo/lib/python3.7/site-packages/keras/callbacks/callbacks.py:846: RuntimeWarning: Early stopping conditioned on metric `val_acc` which is not available. Available metrics are: val_loss,val_accuracy,loss,accuracy
/home/mcgaughs/rmoran/miniconda3/envs/diplo/lib/python3.7/site-packages/keras/callbacks/callbacks.py:707: RuntimeWarning: Can save best model only with val_acc available, skipping. 

I changed val_acc to val_accuracy and it seemed to have addressed the issue.

Second, I got the following pandas-related error when I ran train:
df.as_matrix() was depreciated after the version 0.23.0 

I changed as_matrix() to to_numpy() and it worked.

###########################
Other notes:
SFS staircase plot Ne median:
Pachon: 189,942
Choy: 5,263,992


#Make simulated data set
array_discoal.sh
array_fvecSim.sh

#train diploS/HIC CNN and generate model
run_makeTrainingSets.sh
run_Training.sh
**check model accuracy at this point**

#run diploS/HIC on empirical data
 array_run_fvecVCF.sh
 array_run_predictions.sh

-Pre 0.0000016 0.000003
-Pre 122.260600 366.781800 

-Pa 6.351200 6351.200000
-Pa 6.351200 317.560000

-Pu 0 1.0
-Pu 0 0.100000

Mante_5kb got through first 467 jobs
0.0000000035


Pachon pop size history:
0       31756
126984  1200
527516  66645

Rascon, Subter, Mante, Yerbaniz
NW_019170537.1
NW_019170540.1
NW_019170543.1
NW_019170558.1
NW_019170559.1

NW_019170547.1 ?


Did fvecVCF for:
Chica (all done)
Pachon (931-2361 in progress; 175 didn’t run? - 2186 out of 2361)
Choy (Un in progress)
Tinaja (done through 2000)
Molino (all done)


Need to do fvecVCF:
Rascon
Mante



source /home/mcgaughs/rmoran/miniconda3/etc/profile.d/conda.sh
conda activate diplo


#wasn't getting weights.hd5 file bc of error with diploSHIC.py - had to change val_acc to val_accuracy
cat diploSHIC.py | sed 's/val_acc/val_accuracy/g' > diploSHIC_edited.py

#df.as_matrix() was depriciated after the version 0.23.0 
#cat diploSHIC.py | sed 's/as_matrix()/values()/g' > diploSHIC_edited.py #Didn't work
cat diploSHIC.py | sed 's/as_matrix()/to_numpy()/g' > diploSHIC_edited2.py


Pop=“Pachon”

python diploSHIC_edited2.py predict bfsModelTest2.json bfsModelTest2.weights.hdf5 ./rawFVFiles/${Pop}/NW_019170545.1_${Pop}.HardFiltered.fvec   ./Predictions/${Pop}/NW_019170545.1_${Pop}.preds


Linux (CentOS)

Keras                  2.4.3


tensorflow             2.3.1



