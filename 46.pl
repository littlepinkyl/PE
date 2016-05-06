#! /usr/bin/perl
BEGIN{push @INC,".";}
use p;
sub checkCG{
  my $para =  shift;
  return 1 if (p->isPrime($para));
  foreach my $squ (1..int((($para-3)/2)**(1/2))+1){
    my $prime  =  $para - 2* $squ**2;
    if(p->isPrime($prime)){
      #print "$para=$prime + 2* $squ **2\n";
      return 1;
    }
  }
  return 0;
}
my $judge =1;
my $para = 33;
while ($judge){
  if (checkCG($para)){
    #need to check next
    $para +=2;
  }
  else{
    #found
    p->recordResult($para);
    print "yes found $para\n";
    exit 0;
  }
}