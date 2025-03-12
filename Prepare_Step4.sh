#!/bin/bash
#Step4 Assemble Extracted Reads with Star

for f in S*/*R1_paired_HH42.fastq;
do
in2=${f%R1_paired_HH42.fastq}"R2_paired_HH42.fastq"
out=${f%R1_paired_HH42.fastq}"HH42"
echo "module load STAR/2.7.11b &&  STAR --genomeDir /data/petersonrod/Michelle_Pleet/Samples/ref_genome_star/HH42   --genomeFastaFiles  /data/petersonrod/Michelle_Pleet/Samples/ref_genome_star/HH42/GCF_000872045.1_ViralProj20959_genomic_HH42.fna --sjdbGTFfile /data/petersonrod/Michelle_Pleet/Samples/ref_genome_star/HH42/GCF_000872045.1_ViralProj20959_genomic_HH42.gff --sjdbOverhang 99 --readFilesIn $f $in2 --twopassMode Basic  --outFileNamePrefix $out" >> Step4_run_star_2.swarm
done

for f in S*/*R1_paired_PTLV.fastq;
do
in2=${f%R1_paired_PTLV.fastq}"R2_paired_PTLV.fastq"
out=${f%R1_paired_PTLV.fastq}"PTLV1"
echo "module load STAR/2.7.11b && STAR --genomeDir /data/petersonrod/Michelle_Pleet/Samples/ref_genome_star/PTVL1   --genomeFastaFiles  /data/petersonrod/Michelle_Pleet/Samples/ref_genome_star/PTVL1/GCF_000861125.1_ViralProj15439_genomic_PTVL1.fna --sjdbGTFfile /data/petersonrod/Michelle_Pleet/Samples/ref_genome_star/PTVL1/GCF_000861125.1_ViralProj15439_genomic_PTVL1.rename.gff --sjdbOverhang 99 --readFilesIn $f $in2 --twopassMode Basic --outFileNamePrefix $out" >> Step4_run_star_2.swarm
done

for f in S*/*R1_paired_HTLV.fastq;
do
in2=${f%R1_paired_HTLV.fastq}"R2_paired_HTLV.fastq"
out=${f%R1_paired_HTLV.fastq}"HTLV1"
echo "module load STAR/2.7.11b &&  STAR --genomeDir /data/petersonrod/Michelle_Pleet/Samples/ref_genome_star/HTVL1 --genomeFastaFiles /data/petersonrod/Michelle_Pleet/Samples/ref_genome_star/HTVL1/NC_001436.1_HTVL1.fna --sjdbGTFfile /data/petersonrod/Michelle_Pleet/Samples/ref_genome_star/HTVL1/NC_001436.1_HTVL1.gtf --sjdbOverhang 99 --readFilesIn $f $in2 --twopassMode Basic  --outFileNamePrefix $out" >> Step4_run_star_2.swarm
done

for f in S*/*R1_paired_EBV.fastq;
do
in2=${f%R1_paired_EBV.fastq}"R2_paired_EBV.fastq"
out=${f%R1_paired_EBV.fastq}"EBV"
echo "module load STAR/2.7.11b && STAR --genomeDir /data/petersonrod/Michelle_Pleet/Samples/ref_genome_star/EBV --genomeFastaFiles /data/petersonrod/Michelle_Pleet/Samples/ref_genome_star/EBV/NC_007605.1_EBV.fna --sjdbGTFfile /data/petersonrod/Michelle_Pleet/Samples/ref_genome_star/EBV/NC_007605.1_EBV.gtf --sjdbOverhang 99 --readFilesIn $f $in2 --twopassMode Basic --outFileNamePrefix $out" >> Step4_run_star_2.swarm
done
