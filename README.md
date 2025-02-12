# Runs Trimmomatic -> Kraken2 and Produces Annontation Tables and Bed files for IGV
##### Step 0 Organize paired fastq files in directories based on sample
<pre><code> ./Step0_organize.sh </pre></code>

### Step 1 run trimmomatic
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
### Step 4 asseembled extraxted reads with Star
<pre><code> ./Prepare_Step4.sh </pre></code>
#### Submit Step4 swarm file
<pre><code> swarm -f Step4_run_star_2.swarm -t 4 -g 50 --time=10:00:00 </pre></code>
#### Check if Step4 Swarm Jobs are running 
<pre><code> squeue -u username </pre></code>
#### After Step4 finishing running check the error and log files and check the fastq files with extracted reads are not empty
<pre><code> cat swarm_number.e 
ls -lrth */*fastq </pre></code>
