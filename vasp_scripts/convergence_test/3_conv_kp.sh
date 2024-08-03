#!/bin/bash
A=`pwd`
# set the converged value of ENCUT from previous run
ENCUT=700
for ((  n=1;  n<=10;  n++  ))
do
        KP=`head -$n $A/kpts | tail -1`
        mkdir $A/k_$KP
        cp $A/INCAR $A/KPOINTS $A/POSCAR $A/POTCAR $A/job.sh $A/k_$KP
# replacing the ENCUT value with our converged value
        sed -i "/ENCUT/c\   ENCUT  = $ENCUT" $A/k_$KP/INCAR
# setting k-points
        cd $A/k_$KP
        KP1=`echo $KP | awk -F 'x' '{print $1" "$2" "$3}'`
        sed -i "4 s/.*/ $KP1/g" KPOINTS
        qsub job.sh
        cd $A
done
