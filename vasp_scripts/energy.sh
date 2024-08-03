#!/bin/bash
## Before running this, check the log file whether required accuracy is reached
totE=$(grep "free  energy   TOTEN" OUTCAR|awk END{print}|awk '{print $5}')
nions=$(grep NIONS OUTCAR | awk '{print $12}')
echo "Total energy:" $totE
echo "Energy per atom:"
echo  $totE/$nions | bc -l
