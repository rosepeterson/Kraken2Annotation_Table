#!/bin/bash
for f in S*/*{HH42,PTVL1}Aligned.out.sorted.bam; 
do
out=${f%.bam}".bed"
    echo "module load bedtools && bedtools bamtobed -i $f > $out" >> Bam2Bed_2.swarm
done
