# Runs Trimmomatic -> Kraken2 and Produces Annontation Tables and Bed files for IGV
### Step 1 run trimmomatic
<pre><code> sbatch ./Prepare_Step1.sh 
swarm -f Step1_filter_trimm.swarm -t 4 -g 20 --time=10:00:00
</pre></code>
