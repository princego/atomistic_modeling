# Calculating Bond Length of N<sub>2</sub> molecule

## Input files
We need 5 input files to get started with `VASP` calculation.
- `POSCAR` file contains information of initial lattice parameters and atomic positions.
- `INCAR` file has the tags which tells the code, how to run a calculation.
- `KPOINTS` file has information on kpoints.
- `POTCAR` file has pseudo potential information. 
- `job.sh` requests the computer for number of cores required and time.

_File 1: POSCAR_
```
New structure
1.0
       10.0000000000         0.0000000000         0.0000000000
        0.0000000000        10.0000000000         0.0000000000
        0.0000000000         0.0000000000        10.0000000000
    N
    2
Direct
     0.0000000000         0.000000000         0.000000000
     0.1000000000         0.000000000         0.000000000
```

![N2 Structure](N2_structure.png)

_File 2: INCAR_
```
Startparameter for this run:
PREC = Normal
Electronic relaxation
NELM  = 100
EDIFF = 1E-4
Ionic relaxation
EDIFFG = 1E-3
NSW    = 60
IBRION = 2
ISIF   = 2
DOS related values:
ISMEAR = 0
SIGMA  = 0.2
Write flags
LWAVE  = F
LCHARG = F
```

_File 3: KPOINTS_
```
Auto
0
M
1 1 1
0 0 0
```


_File 4: POTCAR_

Use POTCAR file of `N`. POTCAR file is not given here because VASP is a commercial code.

_File 5: job.sh_
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
mpirun -n 1 path_to_vasp_executable > log
mv ../job$tpdir $PBS_O_WORKDIR/.
```


## Job submission
To submit a job
```
qsub job.sh
```

To see the status of job
```
qstat
```

## Output files
After the calculation finishes, you'll see a folder named `jobxx` containing all the input and output files, where xx is the job id. Change the directory to jobxx by entering

```
cd jobxx
```

Download `CONTCAR` file to your computer and open the structure in **VESTA** and measure the bond length between 2 N atoms by double clicking on the bond.

Now, note down the total energy corresponding to the bond length from CONTCAR

Open `OUTCAR` file by typing
```
vi OUTCAR
```

Go to end of the file by typing `shift+g` and note down the value displayed in `free  energy   TOTEN`.
