# Runs Trimmomatic -> Kraken2 and Produces Annontation Tables and Bed files for IGV
### Step 1 run trimmomatic
#### Run bash file to create Step1 Swarm file.
<pre><code> sbatch ./Prepare_Step1.sh </pre></code>
#### Check the swarm file
<pre><code> head Step1_filter_trimm.swarm </pre></code>
#### Submit Step1 swarm file
<pre><code> swarm -f Step1_filter_trimm.swarm -t 4 -g 20 --time=10:00:00 </pre></code>
### Step 2 run Kraken2 on filtered fastq files
