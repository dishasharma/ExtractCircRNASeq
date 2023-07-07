awk '{ print $0}' assembly_txt | sort | uniq > assembl_beds
perl circ_to_seq.pl;
#ls -ltr bed_start_*.bed | awk '{ print $9}' > bed_start_list
#ls -ltr bed_stop_*.bed | awk '{ print $9}' > bed_stop_list

ls -ltr bed_start_*.bed | awk '{ print $9}' | sort | awk '{ print "bedtools getfasta -fi /home/disha/Data/genome/rn6.fa -bed "$0" -fo "$0".fasta -name"}' > bash_start
ls -ltr bed_stop_*.bed | awk '{ print $9}' | sort | awk '{ print "bedtools getfasta -fi /home/disha/Data/genome/rn6.fa -bed "$0" -fo "$0".fasta -name"}' > bash_stop
bash bash_start;
bash bash_stop;

ls -ltr bed_start_*.fasta | awk '{ print $9}' | sort > start_fasta_list
ls -ltr bed_stop_*.fasta | awk '{ print $9}' | sort > stop_fasta_list

perl Script_revseq.pl;
exit;
