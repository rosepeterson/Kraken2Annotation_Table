#!/bin/bash
for f in S*/*{HH42,PTLV1,HTLV1,EBV}Aligned.out.sorted.bam; 
do
out=${f%.bam}".bed"
    echo "module load bedtools && bedtools bamtobed -i $f > $out" >> Step6_Bam2Bed.swarm
done
