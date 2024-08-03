#!/bin/bash
# To submit multiple jobs at once using a single script
for i in job1 job2 job3 ; do # directories are named job1, job2, and job3. You can also use job* for multiple jobs 
    cd $i
    qsub ~/bin/vasp_job.sh # path to vasp submission script
sleep 1 # sleep for 1 sec, then submits next job
done
wait
