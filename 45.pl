#! /usr/bin/perl
sub recordResult{
  open FILEOUT,">>log";
  my $time=`date`;
  chomp($time);
  print FILEOUT $time,"  task:$0  result:@_ \n";
  close FILEOUT;
}
sub checkC{
  my $para =shift;
  my $endRange= int($para**(1/2))+1;
  foreach $piv(165..$endRange){
    if ((3*$piv**2 - $piv)/2 == $para){
      print "get $piv,$para\n";
      return 0;
    }
  }
  return 1;
}
my $a = 287;
#my $judge=1;
while (1){
  my $guess=($a**2+$a)/2;
  $result=checkC($guess);
  if ($result==0){
    print "get $guess!\n";
    recordResult($guess);
    exit 0;
  }
  $a+=2;
}