# Kpoint convergence

In the `KPOINTS` file, line no.4, change `3 3 3` to `6 6 6`, `9 9 9`, and `12 12 12` and check for convergence

INCAR
```
Startparameter for this run:
PREC = Normal
Electronic relaxation
ENCUT = 520
NELM  = 100
EDIFF = 1E-5
Ionic relaxation
EDIFFG = 1E-4
NSW    = 60
IBRION = 2
ISIF   = 2
DOS related values:
ISMEAR = 1
SIGMA  = 0.5
Write flags
LWAVE  = F
LCHARG = F
```

KPOINTS
```
Auto
0
M
3 3 3
0 0 0
```

POSCAR
```
New structure
   1.00000000000000
     0.0000000000000000    2.0365025465317288    2.0365025465317288
     2.0365025465317288    0.0000000000000000    2.0365025465317288
     2.0365025465317288    2.0365025465317288    0.0000000000000000
   Al
     1
Direct
0.0000000000000000 0.0000000000000000 0.0000000000000000
```

job.sh
```
#!/bin/bash
#PBS -o out
#PBS -e error
#PBS -l walltime=01:59:59
#PBS -l select=1:ncpus=1
tpdir=`echo $PBS_JOBID | cut -f 1 -d .`
tempdir=$HOME/scratch/job$tpdir
mkdir -p $tempdir
cd $tempdir
cp -R $PBS_O_WORKDIR/* .
mpirun -np 1 vasp_std > log
mv ../job$tpdir $PBS_O_WORKDIR/.
```
