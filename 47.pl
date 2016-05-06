#! /usr/bin/perl
BEGIN{push @INC,".";}
use p;
use Data::Dumper;
sub primeFactorNum{
    my $paraOrigin =  shift;
    my $para=$paraOrigin;
  my $end  =  int($paraOrigin/2)+1;
  my %paraOrigin;
  foreach my $factor (2..$end){
    next if (!p->isPrime($factor));
    if ($para % $factor ==0){
      $paraOrigin{$factor}=1;
      $para=$para/$factor;
      $end=int($para/2)+1;
    }
  }
  my $num=keys %paraOrigin;
  #print "$paraOrigin:$num\n";
  return $num;
}
my $num    =    3;
my @start=(30);
for(1;primeFactorNum($start[$num-1])!=$num;$start[0]=$nextnum){
  #print "$start[0] ";
    foreach(0..$num-1){
        $start[$_]    =    $start[0]+$_;
        if (primeFactorNum($start[$_])!=$num){
            $nextnum    =    $start[$_]+1;
            last;
        }

    }
}
print "get $start[0] have $num distinct prime factors\n";
p->recordResult($start[0]);
