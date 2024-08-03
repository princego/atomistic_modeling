#!/bin/bash
A=`pwd`
rm -f conv_kp.csv
for ((  n=1;  n<=10;  n++  ))
do
    KP=`head -$n $A/kpts | tail -1`
#check whether reached required accuracy
        reached=$(grep "reached" $A/k_$KP/log)
        echo "$KP: $reached"
#checking total energy and energy per atom
        totE=$(grep "free  energy   TOTEN" $A/k_$KP/OUTCAR|awk END{print}|awk '{print $5}')
        nions=$(grep NIONS $A/k_$KP/OUTCAR | awk '{print $12}')
        epa=$(echo "$totE / $nions" | bc -l)
        echo "TOTEN:" $totE '|' "Energy_per_atom:" $epa
        echo $KP,$totE,$epa >> conv_kp
done

#calculating energy difference
awk -F ',' 'NR==1{s=$3;next}{print $3-s;s=$3}' conv_kp > conv_kp_diff
paste -d ',' conv_kp conv_kp_diff > conv_kp.csv
#adding header
sed -i '1 i kpts,toten_kconv,epa_kconv,epa_diff_kconv' conv_kp.csv
#remove temporary files
rm conv_kp conv_kp_diff
#display on screen
echo "---------"
cat conv_kp.csv

#plotting KPOINT convergence
gnuplot plot_kp.gpl
