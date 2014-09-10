#!/usr/bin/perl -w

BEGIN {
  use Test::Inter;
  $t = new Test::Inter 'ListOps';
}

BEGIN { $t->use_ok('Template'); }

sub test {
  my($input,$output,$dir,$data) = @_;

  my $tmpl = Template->new();
  $tmpl->process($input,$data,$output)  ||
     die $tmpl->error(),"\n";
}

###########################################
# Test data

$data = {
         'A'  => [ qw(A A C B) ],
         'U'  => [ 'A',undef,'Z' ],
        };

###########################################

$t->file(\&test,'1.in','','1.exp','ListOps',$t->testdir(),$data);
$t->done_testing();
1;

# Local Variables:
# mode: cperl
# indent-tabs-mode: nil
# cperl-indent-level: 3
# cperl-continued-statement-offset: 2
# cperl-continued-brace-offset: 0
# cperl-brace-offset: 0
# cperl-brace-imaginary-offset: 0
# cperl-label-offset: 0
# End:

