package DDG::ZCI::Object;
use strictures;
use Moo();
use DDG::ZCI::Sugar ();

our @ISA = qw(Moo);

sub import {
    my $target = caller;
    DDG::ZCI::Sugar->import_into($target);
    goto Moo->can('import');
}

1;
__END__
