package DDG::Goodies;
use Moo;
use Module::Pluggable require => 1;
use DDG::Goodies::Output;

has goodies => (
    is      => 'ro',
    default => sub { [ shift->plugins ] },
);

sub handle {
    my ( $self, $input ) = @_;
    for my $goody ( @{ $self->goodies } ) {
        if ( my $result = $goody->handle($input) ) {
            return $result;
        }
    }
}

1;
__END__
