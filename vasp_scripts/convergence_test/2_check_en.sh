#!/bin/bash
A=`pwd`
rm -f conv_en.csv
for ((  n=1;  n<=6;  n++  ))
do
    EN=`head -$n $A/enrgs | tail -1`
#check whether reached required accuracy
        reached=$(grep "reached" $A/e_$EN/log)
        echo "$EN: $reached"
#checking total energy and energy per atom
        totE=$(grep "free  energy   TOTEN" $A/e_$EN/OUTCAR|awk END{print}|awk '{print $5}')
        nions=$(grep NIONS $A/e_$EN/OUTCAR | awk '{print $12}')
        epa=$(echo "$totE / $nions" | bc -l)
        echo "TOTEN:" $totE '|' "Energy_per_atom:" $epa
        echo $EN,$totE,$epa >> conv_en
done

#calculating energy difference
awk -F ',' 'NR==1{s=$3;next}{print $3-s;s=$3}' conv_en > conv_en_diff
paste -d ',' conv_en conv_en_diff > conv_en.csv
#adding header
sed -i '1 i energy,toten_econv,epa_econv,epa_diff_econv' conv_en.csv
#remove temporary files
rm conv_en conv_en_diff
#display on screen
echo "---------"
cat conv_en.csv

#plotting energy convergence
gnuplot plot_en.gpl
