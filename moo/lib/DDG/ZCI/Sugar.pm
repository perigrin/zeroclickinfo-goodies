package DDG::ZCI::Sugar;
use strictures;
use DDG::ZCI::Output;
use DDG::ZCI::Input;

sub import { shift->import_into( scalar caller ) }

sub import_into {
    my $class  = shift;
    my $target = shift;
    no strict "refs";
    *{"${target}::output"} = sub { DDG::ZCI::Output->new(@_) };
    *{"${target}::input"}  = sub { DDG::ZCI::Input->new(@_) };
}

1;
__END__
