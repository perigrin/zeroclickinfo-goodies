package DDG::ZCI::Object;
use strictures;
our @ISA = qw(Moo);

use DDG::ZCI::Input;
use DDG::ZCI::Output;

sub import {
    my $target = caller;
    no strict "refs";
    *{"${target}::output"} = sub { DDG::ZCI::Output->new(@_) };
    *{"${target}::input"}  = sub { DDG::ZCI::Input->new(@_) };

    goto Moo->can('import');
}

1;
__END__
