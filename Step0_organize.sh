#!/bin/bash
for f in *R1*fastq.gz; 
do
    in="${f%_R1.*fastq.gz}"_R{1,2}*.fastq.gz"
    dir="${f%_R1.*fastq.gz}"
    mkdir -p "$dir"
    mv $in "$dir"
done
git clone https://github.com/rosepeterson/Kraken2Annotation_Table.git
unzip Kraken2Annotation_Table/ref_star_genome/*/SAindex.gz.zip
gunzip Kraken2Annotation_Table/ref_star_genome/*/SAindex.gz
mv Kraken2Annotation_Table/*sh ./ 
