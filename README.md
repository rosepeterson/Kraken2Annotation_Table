# Runs Trimmomatic -> Kraken2 and Produces Annontation Tables and Bed files for IGV

### Step 0 Organize Data
#### Run bash file to create Step1 Swarm file.
<pre><code> for f in *R1*fastq.gz; 
do
    in="${f%_R1.*fastq.gz}"_R{1,2}*.fastq.gz"
    dir="${f%_R1.*fastq.gz}"
    mkdir -p "$dir"
    mv $in "$dir"
done
git clone https://github.com/rosepeterson/Kraken2Annotation_Table.git
unzip Kraken2Annotation_Table/ref_star_genome/*/SAindex.gz.zip
gunzip Kraken2Annotation_Table/ref_star_genome/*/SAindex.gz
mv Kraken2Annotation_Table/*sh ./  </pre></code>
##### Step 1 Run Trimmomatic
<pre><code> ./Prepare_Step1.sh </pre></code>

#### Check the swarm file
<pre><code> head Step1_filter_trimm.swarm </pre></code>
#### Submit Step1 swarm file
<pre><code> swarm -f Step1_filter_trimm.swarm -t 4 -g 20 --time=10:00:00 </pre></code>
#### Check if Step1 Swarm Jobs are running 
<pre><code> squeue -u username </pre></code>
#### After Step1 finishing running check the error and log files and check the new trimmed fastq files are not empty
<pre><code> cat swarm_number.e 
ls -lrth */*fastq.gz </pre></code>
### Step 2 run Kraken2 on filtered fastq files
<pre><code> ./Prepare_Step2.sh </pre></code>
#### Submit Step2 swarm file
<pre><code> swarm -f Step2_run_Kraken2.swarm -t 4 -g 100 --time=10:00:00 </pre></code>
#### Check if Step2 Swarm Jobs are running 
<pre><code> squeue -u username </pre></code>
#### After Step2 finishing running check the error and log files and check the Kraken2 table files are not empty
<pre><code> cat swarm_number.e 
ls -lrth */*txt </pre></code>
### Step 3 extract relevant reads from Kraken2 results 
<pre><code> ./Prepare_Step3.sh </pre></code>
<pre><code> git clone (https://github.com/jenniferlu717/KrakenTools.git) </code></pre>
#### Submit Step3 swarm file
<pre><code> swarm -f Step3_extract_reads_kraken2.swarm -t 50 --time=10:00:00 </pre></code>
#### Check if Step3 Swarm Jobs are running 
<pre><code> squeue -u username </pre></code>
#### After Step3 finishing running check the error and log files and check the fastq files with extracted reads are not empty
<pre><code> cat swarm_number.e 
ls -lrth */*fastq </pre></code>
#### After Step3 remove empty fastq files 
<pre><code> find * -size 0 -print -delete  </pre></code>
<pre><code> ls -lrth */*fastq  </pre></code>
### Step 4 assemble extracted reads with Star
<pre><code> ./Prepare_Step4.sh </pre></code>
#### Submit Step4 swarm file
<pre><code> swarm -f Step4_run_star_2.swarm -t 4 -g 50 --time=10:00:00 </pre></code>
#### Check if Step4 Swarm Jobs are running 
<pre><code> squeue -u username </pre></code>
#### After Step4 finishing running check the error and log files and check the sam files extracted reads are not empty
<pre><code> cat swarm_number.e 
ls -lrth */*sam </pre></code>
### Step 5 sort Sam files and convert to bam files
<pre><code> ./Prepare_Step5.sh </pre></code>
#### Submit Step5 swarm file
<pre><code> swarm -f Step5_sort_sam.swarm -t 4 -g 50 --time=10:00:00 </pre></code>
#### Check if Step5 Swarm Jobs are running 
<pre><code> squeue -u username </pre></code>
#### After Step5 finishing running check the error and log files and check the bam files are not empty
<pre><code> cat swarm_number.e 
ls -lrth */*bam </pre></code>
### Step 6 sort convert bam to bed files
<pre><code> ./Prepare_Step6.sh </pre></code>
####  Check Step6 swarm file look good
<pre><code> cat Step6_Bam2Bed.swarm </code></pre>
#### Submit Step6 swarm file
<pre><code> swarm -f Step6_Bam2Bed.swarm -t 4 -g 50 --time=10:00:00 </code></pre>

#### Check if Step6 Swarm Jobs are running 
<pre><code> squeue -u username </pre></code>
#### After Step6 finishing running check the error and log files and check the bed files are not empty
<pre><code> cat swarm_number.e 
ls -lrth */*bed </pre></code>
