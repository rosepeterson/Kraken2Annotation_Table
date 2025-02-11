#!/bin/bash
for f in *R1*fastq.gz; 
do
    in="${f%_R1.*fastq.gz}"_R{1,2}*.fastq.gz"
    dir="${f%_R1.*fastq.gz}"
    mkdir -p "$dir"
    mv $in "$dir"
done
