# ExtractCircRNASeq
This repository includes script to generate sequences for circular RNA junction. 

Install Bedtools and download reference genome of species of interest.

The sequences in circRNAs are in reverse orientation, in order to generate the reads, one needs to provide the bed file as shown in "assembly.txt" and reference genome in the folder.
Change the path of reference genome to your path: "/home/disha/Data/genome/rn6.fa"


It will generate the reads in reverse orientation as it should be in circular RNAs. 

The main script is extract_Seqeunce.sh, which will use all the rest scripts to generate the output.
