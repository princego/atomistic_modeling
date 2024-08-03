# Automated Energy and KPOINT convergence test
The directory needs the following files:
- VASP input files: `INCAR`, `KPOINTS`, `POSCAR`, `POTCAR`, `job.sh` (submission script)
- Scripts given in this directory: `1_conv_en.sh`, `2_check_en.sh`, `3_conv_kp.sh`, `4_check_kp.sh`, `enrgs`, `kpts`, `plot_en.gpl`, `plot_kp.gpl`

## Energy convergence
1. Enter the energies you want to check for convergence in a file named `enrgs`, one value of energy in each row. <br>
2. Enter `bash 1_conv_en.sh` in the terminal. The script will automatically create directories with energies from `enrgs` file you have, and submits jobs. <br>
3. After all calculations finishes enter `bash 2_check_en.sh`. This script will read total energies, calculates energy per atom, and energy difference between the consecutive energies, and writes to a `conv_en.csv` file, and also plots using the GNU plot.

## KPOINT convergence
1. Enter the kpoints you want to check for convergence in a file named `kpts`, one value of kpoint in each row, seperated by `x` (example 3x3x3). <br>
2. Go to the line 4 of `3_conv_kp.sh` file and set your converged ENCUT value from the energy convergence test above. <br>
3. Enter `bash 3_conv_kp.sh` in the terminal. The script will automatically create directories with kpoints from `kpts` file you have, and submits jobs. <br>
4. After all calculations finishes enter `bash 4_check_kp.sh`. This script will read total energies, calculates energy per atom, and energy difference between the consecutive energies, and writes to a `conv_kp.csv` file, and also plots using the GNU plot.

### Additional tips:
- If you are checking energy convergence for 5 energies, then in the `1_conv_en.sh` file line 3, the loop should run from 1 to 5. <br>
- After performing energy convergence for 5 energies, but still didn't reach convergence, then add the 6th energy to the 6th row in `enrgs` file, then in the `1_conv_en.sh` file line 3, the loop should run from 6 to 6. This will submit just one job.
- Depending on the number of times the loop is run in `1_conv_en.sh`, the same number of loops should be in `2_check_en.sh` (If total 6 calculations were done for energy convergence, then the loop in line 4 of `2_check_en.sh` should run from 1 to 6). The same applies to kpoint convergence also.
