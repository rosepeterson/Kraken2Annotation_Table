#!/bin/bash
for f in */*R1_paired.fastq.gz;
do
in=${f%R1_paired.fastq.gz}"R[1-2]_paired.fastq.gz"
out=${f%R1_paired.fastq.gz}".txt"
rep=${f%R1_paired.fastq.gz}".report"
echo "module load kraken/2.1.2 && kraken2 --db /fdb/kraken/20220803_standard_kraken2  --output $out   --report $rep --use-names   --gzip-compressed   $in" >> Step2_run_Kraken2_report.swarm
done
