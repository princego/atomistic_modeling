#!/bin/bash
#PBS -o out
#PBS -e error
#PBS -l walltime=47:59:59
#PBS -l select=1:ncpus=8
tpdir=`echo $PBS_JOBID | cut -f 1 -d .`
tempdir=$HOME/scratch/job$tpdir
mkdir -p $tempdir
cd $tempdir
cp -R $PBS_O_WORKDIR/* .
mpirun -n 8 vasp_std > log
mv ../job$tpdir $PBS_O_WORKDIR/.
