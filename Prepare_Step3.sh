#!/bin/bash
#writes Step1 to extract reads from Kraken2 file based on taxid
for f in S*/*_.txt;
do
in=${f%_.txt}"_R1_paired.fastq.gz"
in1=${f%_.txt}"_R2_paired.fastq.gz"
out=${f%_.txt}"_R1_paired_HTLV.fastq"
out1=${f%_.txt}"_R2_paired_HTLV.fastq"
echo "module load kraken/2.1.2 && python ./extract_kraken_reads.py -s $in -s2 $in1 -k $f --taxid 11908 -o $out -o2 $out1" >> Step3_extract_reads_kraken2.swarm
done

for f in S*/*_.txt;
do
in=${f%_.txt}"_R1_paired.fastq.gz"
in1=${f%_.txt}"_R2_paired.fastq.gz"
out=${f%_.txt}"_R1_paired_EBV.fastq"
out1=${f%_.txt}"_R2_paired_EBV.fastq"
echo "module load kraken/2.1.2 && python ./extract_kraken_reads.py -s $in -s2 $in1 -k $f --taxid 10376 -o $out -o2 $out1" >> Step3_extract_reads_kraken2.swarm
done

for f in S*/*_.txt;
do
in=${f%_.txt}"_R1_paired.fastq.gz"
in1=${f%_.txt}"_R2_paired.fastq.gz"
out=${f%_.txt}"_R1_paired_HH42.fastq"
out1=${f%_.txt}"_R2_paired_HH42.fastq"
echo "module load kraken/2.1.2 && python ./extract_kraken_reads.py -s $in -s2 $in1 -k $f --taxid 12509 -o $out -o2 $out1" >> Step3_extract_reads_kraken2.swarm
done

for f in S*/*_.txt;
do
in=${f%_.txt}"_R1_paired.fastq.gz"
in1=${f%_.txt}"_R2_paired.fastq.gz"
out=${f%_.txt}"_R1_paired_PTLV.fastq"
out1=${f%_.txt}"_R2_paired_PTLV.fastq"
echo "module load kraken/2.1.2 && python ./extract_kraken_reads.py -s $in -s2 $in1 -k $f --taxid 194440 -o $out -o2 $out1" >> Step3_extract_reads_kraken2.swarm
done
