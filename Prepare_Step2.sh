#!/bin/bash
for f in */*R1.paired.fastq.gz;
do
in=${f%R1.paired.fastq.gz}"R[1-2].paired.fastq.gz"
out=${f%R1.paired.fastq.gz}".txt"
echo "module load kraken/2.1.2 && kraken2 --db /fdb/kraken/20220803_standard_kraken2     --output $out  --use-names   --gzip-compressed   $in" >> Step2_run_Kraken2.swarm
done
