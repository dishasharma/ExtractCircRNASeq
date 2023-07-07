#!/usr/bin/perl

use strict;
use warnings;

my @start_fasta=<bed_start*.fasta>;
my @stop_fasta=<bed_stop*.fasta>;

#foreach (@start_fasta) {
#	print $_,"\n";
#}

my %header;


foreach my $start_file (@start_fasta) {
	open STRT, $start_file;
	my @seq=<STRT>;
	for (my $i=0;$i<@seq;$i++) {
		chomp $seq[$i];
		#if ($seq[$i]=~/\>(.+)/) #/^>(.+)/)
		if ($seq[$i]=~/\>(.+)/)
			{
			chomp $seq[$i+1];
			my $rev_seq = reverse $seq[$i+1];
			#print "$1\n";
			#$header{$1}=$seq[$i+1];
			$header{$1}=$rev_seq;
		}
	}
}

foreach my $stop_file (@stop_fasta) {
	#$stop_file=~/([ES]RR\w{6})/;
	$stop_file=~/(\w*)/;
	my $run=$1;
	open OUT, ">$run"."_cat_seq.fasta";
	open STOP, $stop_file;
	my @seq=<STOP>;
	for (my $j=0;$j<@seq;$j++) {
		chomp $seq[$j];
		#if ($seq[$j]=~/\>(\w*)/) 
		if ($seq[$j]=~/\>(.+)/) 
			{
			#print "$1\n";
			if ($header{$1}) {
				#print "$header{$1}\n";
				chomp $seq[$j+1];
				my $rev_seq1 = reverse $seq[$j+1];
				
				print OUT ">$1\n$header{$1}$rev_seq1\n";
				#print ">$1\n$header{$1}$rev_seq1\n";
			}
		}
	}
}
