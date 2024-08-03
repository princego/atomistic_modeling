#!/bin/bash
grep 'executed on' OUTCAR | awk '{print $5,$6}'
grep 'running on' OUTCAR | awk '{print $3, $5}'
echo "Total CPU time used (hr):"; sed -n '/CPU/,+p' OUTCAR | awk '{print $6/3600}'
echo "Total CPU time used (min):"; sed -n '/CPU/,+p' OUTCAR | awk '{print $6/60}'
sed -n '/CPU/,+3p' OUTCAR
