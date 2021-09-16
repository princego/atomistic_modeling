# Vibrational Frequency of CO molecule
<img src="https://render.githubusercontent.com/render/math?math=\omega=\sqrt{ \alpha \left(\frac{m_C \plus m_O}{m_C m_O}\right)}">

file: POSCAR
```
New structure
1.0
       10.0000000000         0.0000000000         0.0000000000
        0.0000000000        10.0000000000         0.0000000000
        0.0000000000         0.0000000000        10.0000000000
    C O
    1 1
Direct
     0.0000000000         0.000000000         0.000000000
     0.1100000000         0.000000000         0.000000000
```

file: INCAR
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

file: KPOINTS
```
Auto
0
M
1 1 1
0 0 0
```

