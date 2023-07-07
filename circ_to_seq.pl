#!/usr/bin/perl
open ASSEMBLE,"assembl_beds" or die;

while($asmbl=<ASSEMBLE>)
{
chomp $asmbl;
@asmb = split '/', $asmbl;
#push(@asmb_filename,$asmb[0]);
#push(@asmb_bed,$asmb[1]);
#print $asmbl."\n";
open OUT,">bed_start_$asmb[0].bed"or die;
open OUT1,">bed_stop_$asmb[0].bed"or die;


open In,"$asmbl";
while($bed=<In>)
{
	#print $bed;
	@arr_bed=split '\t',$bed;
	$a= $arr_bed[1]+200;
	$b= $arr_bed[2]-200;
	$bed_start = $arr_bed[0]."\t".$arr_bed[1]."\t".$a."\t".$arr_bed[3]."\t".$arr_bed[4]."\t".$arr_bed[5]."\n";
	$bed_stop = $arr_bed[0]."\t".$b."\t".$arr_bed[2]."\t".$arr_bed[3]."\t".$arr_bed[4]."\t".$arr_bed[5]."\n";
	
	print OUT $bed_start;
	print OUT1 $bed_stop;
}
}



exit;
