# Structure and Geometry Optimization of Al

For Unit Cell

file: POSCAR
```
New structure
1.0
        4.0000000000         0.0000000000         0.0000000000
        0.0000000000         4.0000000000         0.0000000000
        0.0000000000         0.0000000000         4.0000000000
   Al
    4
Direct
     0.000000000         0.000000000         0.000000000
     0.000000000         0.500000000         0.500000000
     0.500000000         0.000000000         0.500000000
     0.500000000         0.500000000         0.000000000
```

For Primitve Cell

file: POSCAR
```
New structure
1.0
        0.0000000000         1.9999999658         1.9999999658
        1.9999999658         0.0000000000         1.9999999658
        1.9999999658         1.9999999658         0.0000000000
   Al
    1
Direct
     0.000000000         0.000000000         0.000000000
```

file: INCAR
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
ISIF   = 3
DOS related values:
ISMEAR = 1
SIGMA  = 0.2
Write flags
LWAVE  = F
LCHARG = F
```

file: KPOINTS
```
Auto
0
M
10 10 10
0 0 0
```
