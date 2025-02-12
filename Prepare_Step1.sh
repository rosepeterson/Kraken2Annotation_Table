#!/bin/bash
#creates swarm file to run trimmomatic for paired end samples organized in different directories
for f in */*R1_001.fastq.gz;
do
in2=${f%R1_001.fastq.gz}"R2_001.fastq.gz"
out=${f%R1_001.fastq.gz}"R1_paired.fastq.gz"
out2=${f%R1_001.fastq.gz}"R2_paired.fastq.gz"
outu=${f%R1_001.fastq.gz}"R1_unpaired.fastq.gz"
outu2=${f%R1_001.fastq.gz}"R2_unpaired.fastq.gz"
echo "module load trimmomatic/0.39 && java -jar \$TRIMMOJAR PE -phred33 $f $in2 $out $outu $out2 $outu2 ILLUMINACLIP:/usr/local/apps/trimmomatic/0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36" >> Step1_filter_trimm.swarm
done

