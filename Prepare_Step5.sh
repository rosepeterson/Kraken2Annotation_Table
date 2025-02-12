#!/bin/bash
#step 5  sorted bam files
for f in S*/*{HH42,PTLV1,HTLV1,EBV}Aligned.out.sam; do
    in="${f%.sam}.bam"
    out="${f%.sam}.sorted.bam"
    echo "module load samtools && samtools view -bS $f > $in && samtools sort -o $out $in && samtools index $out" >> Step5_sort_sam.swarm
done
