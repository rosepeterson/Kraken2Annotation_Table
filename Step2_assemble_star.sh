#!/bin/bash
#Step2 Assemble Extracted Reads with Star
for f in S*/*R1_Human_herpes4type2.fastq;
do
 
find S* -size 0 -print -delete

in2=${f%R1_Human_herpes4type2.fastq}"R2_Human_herpes4type2.fastq"
out=${f%R1_Human_herpes4type2.fastq}"HH42"
echo "module load STAR/2.7.11b &&  STAR --genomeDir /data/petersonrod/Samples/ref_genome_star/HH42 --sjdbOverhang 99 --readFilesIn $f $in2 --twopassMode Basic  --outFileNamePrefix $out" >> Run_star_2.swarm
done
